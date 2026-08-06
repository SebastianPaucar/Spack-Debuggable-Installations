FROM docker.io/rockylinux:8 AS bootstrap

ENV SPACK_ROOT=/opt/spack \
    CURRENTLY_BUILDING_DOCKER_IMAGE=1 \
    container=docker

RUN dnf update -y \
 && dnf install -y \
        bzip2 \
        curl \
	cpio \
        file \
        findutils \
        gcc-c++ \
        gcc \
        gcc-gfortran \
	gdb \
        git \
        gnupg2 \
        hg \
        hostname \
        iproute \
        make \
        patch \
        python3 \
        python3-pip \
        svn \
        unzip \
	wget \
        xz \
        zstd \
 && pip3 install boto3 \
 && rm -rf /var/cache/dnf \
 && dnf clean all

RUN mkdir $SPACK_ROOT && cd $SPACK_ROOT && \
    git init --quiet && git remote add origin https://github.com/SebastianPaucar/spack.git && \
    git fetch --depth=1 origin feature/debuggable-installations-source-and-symbols && \
    git checkout --detach FETCH_HEAD && \
    mkdir -p $SPACK_ROOT/opt/spack

RUN mkdir -p /opt/spack-packages && cd /opt/spack-packages && \
    git init --quiet && git remote add origin https://github.com/SebastianPaucar/spack-packages.git && \
    git fetch --depth=1 origin feature/compiler-wrapper-build-id-prototype && \
    git checkout --detach FETCH_HEAD

RUN mkdir -p /opt/poc-repo && cd /opt/poc-repo && \
    git init --quiet && git remote add origin https://github.com/SebastianPaucar/poc-repo.git && \
    git fetch --depth=1 origin main && \
    git checkout --detach FETCH_HEAD

RUN mkdir -p /root/.spack && \
    { echo 'repos:'; \
      echo '  builtin:'; \
      echo '    destination: /opt/spack-packages'; \
      echo '  poc_repo: /opt/poc-repo/spack_repo/poc_repo'; \
    } > /root/.spack/repos.yaml

RUN ln -s $SPACK_ROOT/share/spack/docker/entrypoint.bash \
          /usr/local/bin/docker-shell \
 && ln -s $SPACK_ROOT/share/spack/docker/entrypoint.bash \
          /usr/local/bin/interactive-shell \
 && ln -s $SPACK_ROOT/share/spack/docker/entrypoint.bash \
          /usr/local/bin/spack-env

RUN mkdir -p /root/.spack \
 && cp $SPACK_ROOT/share/spack/docker/modules.yaml \
        /root/.spack/modules.yaml \
 && rm -rf /root/*.* /run/nologin

# [WORKAROUND]
# https://superuser.com/questions/1241548/
#     xubuntu-16-04-ttyname-failed-inappropriate-ioctl-for-device#1253889
RUN [ -f ~/.profile ]                                               \
 && sed -i 's/mesg n/( tty -s \\&\\& mesg n || true )/g' ~/.profile \
 || true


WORKDIR /root
SHELL ["docker-shell"]

# Creates the package cache
RUN spack bootstrap now \
    && spack bootstrap status --optional \
    && spack spec hdf5+mpi \
    && spack spec hdf5-crash-demo@1.14.6

ENTRYPOINT ["/bin/bash", "/opt/spack/share/spack/docker/entrypoint.bash"]
CMD ["interactive-shell"]

# Build stage with Spack pre-installed and ready to be used
FROM bootstrap AS builder


# What we want to install and how we want to install it
# is specified in a manifest file (spack.yaml)
RUN mkdir -p /opt/spack-environment && \
set -o noclobber \
&&  (echo spack: \
&&   echo '  specs:' \
&&   echo '  - hdf5 build_type=Debug ^compiler-wrapper@1.1.0-build-id ^readline@8.2 ^openmpi' \
&&   echo '  view: /opt/views/view' \
&&   echo '  concretizer:' \
&&   echo '    unify: true' \
&&   echo '  config:' \
&&   echo '    install_tree:' \
&&   echo '      root: /opt/software') > /opt/spack-environment/spack.yaml

# Install the software, remove unnecessary deps
RUN cd /opt/spack-environment && spack env activate . && spack install --fail-fast --debug-source --debug-symbols && spack gc -y

# Strip all the binaries
#RUN find -L /opt/views/view/* -type f -exec readlink -f '{}' \; | \
#    xargs file -i | \
#    grep 'charset=binary' | \
#    grep 'x-executable\|x-archive\|x-sharedlib' | \
#    awk -F: '{print $1}' | xargs strip

# Modifications to the environment that are necessary to run
RUN cd /opt/spack-environment && \
    spack env activate --sh -d . > activate.sh

COPY repro_simple.c /root/demo/repro_simple.c

# Bare OS image to run the installed executables
FROM docker.io/rockylinux:8

COPY --from=builder /opt/spack-environment /opt/spack-environment
COPY --from=builder /opt/software /opt/software
COPY --from=builder /opt/views /opt/views

RUN { \
      echo '#!/bin/sh' \
      && echo '.' /opt/spack-environment/activate.sh \
      && echo 'exec "$@"'; \
    } > /entrypoint.sh \
&& chmod a+x /entrypoint.sh \
&& ln -s /opt/views/view /opt/view


ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/bin/bash" ]
