```bash
[root@lab-X opt]# mkdir -p /data/.eic-sf/repro-f4/scratch
[root@lab-X opt]# docker run -dit --name repro-f4-v3 \
  --restart unless-stopped \
  -v /data/.eic-sf/repro-f4:/repro \
  ghcr.io/eic/eic_xl:26.07.1-stable \
  sleep infinity
9e37f08cd6a1488a0876864cc6da233e22dc3fa6bd554d2940b0280fdf23a569
[root@lab-X opt]# docker cp /usr/bin/xz repro-f4-v3:/usr/local/bin/xz
Successfully copied 88.6kB to repro-f4-v3:/usr/local/bin/xz
[root@lab-X opt]# docker exec repro-f4-v3 chmod +x /usr/local/bin/xz
[root@lab-X opt]# docker exec repro-f4-v3 which xz
/usr/local/bin/xz
[root@lab-X opt]# docker exec repro-f4-v3 bash -c "echo 'source /etc/eic-env.sh' >> /root/.bashrc"
[root@lab-X opt]# docker exec -it repro-f4-v3 bash
```

```bash
> which eic-info
/opt/local/bin/eic-info
> which spack
/opt/spack/bin/spack
> which xz
/opt/local/bin/xz
> echo $PATH
/opt/software/linux-x86_64_v2/epic-26.04.0-t6ow5muotkh2xudou7xbld4e54a2ic2x/bin:/opt/software/linux-x86_64_v2/epic-26.04.1-qc5fqu7iedenlgfmmpzwrkxwjahbdhgu/bin:/opt/software/linux-x86_64_v2/epic-26.05.0-7byhfqrmjrkotchsq57agxfyv553ol7q/bin:/opt/software/linux-x86_64_v2/epic-26.06.0-ahzpiscawpvpjpayzzuoghv5eduocqhx/bin:/opt/software/linux-x86_64_v2/epic-26.07.0-zvk22qfw56lau3mrhu7yyyb2se7eq6oh/bin:/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/bin:/opt/software/linux-x86_64_v2/epic-main-jfqsof62aqda245apvhfktrkwc2scg35/bin:/opt/local/bin:/opt/local/scripts:/opt/spack/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
> cd /repro
> git clone https://github.com/BNLNPPS/swf-epicprod
> cat > environment-manifest.sh <<'EOF'
export COPYRECO=false
export COPYFULL=false
export COPYLOG=false
export USERUCIO=false
export DETECTOR_VERSION=26.07.1
export DETECTOR_CONFIG=epic_craterlake
export EBEAM=10
export PBEAM=100
EOF
```

```bash
> export TMPDIR=/repro/scratch
> mkdir -p "$TMPDIR"
> source /repro/environment-manifest.sh 
> nohup /repro/swf-epicprod/swf_epicprod/payload/run.sh \
  EVGEN/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000 \
  hepmc3.tree.root 701 0115 \
  > /repro/full-run-v3.log 2>&1 &
[1] 960
> disown
> echo "launched, pid $!"
launched, pid 960
```

```bash
> /opt/spack/bin/spack env status
==> In environment /opt/spack-environment/xl/epic
> /opt/spack/bin/spack find eicrecon acts
==> In environment /opt/spack-environment/xl/epic (11 root specs)
[^] algorithms  [^] edm4eic  [^] eicrecon  [^] epic@26.04.0  [^] epic@26.04.1  [^] epic@26.05.0  [^] epic@26.06.0  [^] epic@26.07.0  [^] epic@26.07.1  [^] epic@main  [^] juggler

==> Included specs
-- no arch / no compilers ---------------------------------------
acts                  dawncut         gfal2           libtool          prmon                        py-jinja2-cli       py-rucio-clients                            root
actsvg                dd4hep          gfal2-util      lzo              py-awkward                   py-jupyter-console  py-scipy                                    sherpa
afterburner           doxygen         github-copilot  madx             py-bokeh                     py-jupyterlab       py-seaborn                                  simsipm
arrow                 east            graphviz        mosquitto        py-boost-histogram           py-lmfit            py-snakemake-executor-plugin-slurm          slurm sysconfdir=/etc/slurm
autoconf              edm4hep         hepmc3          multitime        py-boto3                     py-lxml             py-snakemake-executor-plugin-slurm-jobstep  snakemake
automake              eic-smear       hepmcmerger     nano             py-dask                      py-matplotlib       py-snakemake-storage-plugin-fs              spdlog
cairo                 eigen           heppdt          ninja            py-dask-histogram            py-mplhep           py-snakemake-storage-plugin-pelican         stow
catch2                emacs           imagemagick     nopayloadclient  py-deepdiff                  py-numpy            py-snakemake-storage-plugin-rucio           strace
celeritas             epic-generator  irt             npsim            py-eic-rucio-policy-package  py-onnx             py-toml                                     valgrind
clang-build-analyzer  estarlight      irt2            ollama           py-epic-capybara             py-onnxruntime      py-torch                                    xeyes
claude-code           fastjet         iwyu            onnx             py-graphviz                  py-openpyxl         py-uproot                                   xrootd
cli11                 fjcontrib       jana2           opencascade      py-hepunits                  py-pandas           py-vector                                   xrootd-mcp-server
cmake                 fmt             just            osg-ca-certs     py-hist                      py-particle         py-wurlitzer                                zenodo-mcp-server
cnpy                  g4occt          k4actstracking  pelican          py-histoprint                py-pip              py-yapf
covfie                gaudi           k4fwcore        phonebook-cli    py-htgettoken                py-pre-commit       pyrobird
cppcoro               gdb             lcov            podio            py-ipython                   py-pycairo          pythia8
dawn                  geant4+opengl   lhapdf          poppler          py-jinja2                    py-pyyaml           rivet

-- linux-debian13-x86_64_v2 / %c,cxx=gcc@14.2.0 -----------------
acts@45.3.0

-- linux-debian13-x86_64_v2 / %cxx=gcc@14.2.0 -------------------
eicrecon@1.39.2
==> 2 installed packages
==> 0 concretized packages to be installed (show with `spack find -c`)
```

```bash
> git clone -b feature/debuggable-installations https://github.com/SebastianPaucar/spack /opt/spack-debug
Cloning into '/opt/spack-debug'...
remote: Enumerating objects: 656501, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 656501 (delta 0), reused 2 (delta 0), pack-reused 656494 (from 1)
Receiving objects: 100% (656501/656501), 222.49 MiB | 21.59 MiB/s, done.
Resolving deltas: 100% (313702/313702), done.
> for f in config.yaml mirrors.yaml packages.yaml repos.yaml upstreams.yaml include.yaml; do
  cp "/opt/spack/etc/spack/$f" "/opt/spack-debug/etc/spack/$f" 2>/dev/null && echo "copied: $f"
done
copied: config.yaml
copied: mirrors.yaml
copied: packages.yaml
copied: repos.yaml
copied: upstreams.yaml
copied: include.yaml
> /opt/spack-debug/bin/spack --version
1.2.2 (9b558fc99dedfc17b00959c3644cfc19b06da8a9)
> /opt/spack-debug/bin/spack config get repos
repos:
  eic: /opt/spack-packages/repos/eic-spack/spack_repo/eic
  k4: /opt/spack-packages/repos/key4hep-spack
  builtin: /opt/spack-packages/repos/spack_repo/builtin
> /opt/spack-debug/bin/spack config get mirrors
mirrors:
  ghcr-v2026.03.0:
    url: oci://ghcr.io/eic/spack-v2026.03.0
    signed: false
  spack-v1.2.0:
    url: https://binaries.spack.io/v1.2.0
    signed: true
  spack-public:
    binary: false
    url: https://mirror.spack.io
```

```bash
> cp -r /opt/spack-packages/repos/spack_repo/builtin/packages/compiler_wrapper /tmp/backup-compiler-wrapper-orig
> curl -sL https://raw.githubusercontent.com/SebastianPaucar/spack-packages/feature/compiler-wrapper-1.1.0-build-id/repos/spack_repo/builtin/packages/compiler_wrapper/package.py -o /tmp/compiler_wrapper.package.py.patched
> diff -u /opt/spack-packages/repos/spack_repo/builtin/packages/compiler_wrapper/package.py /tmp/compiler_wrapper.package.py.patched
--- /opt/spack-packages/repos/spack_repo/builtin/packages/compiler_wrapper/package.py	2026-07-23 17:40:01.000000000 -0400
+++ /tmp/compiler_wrapper.package.py.patched	2026-09-25 00:53:47.017938678 -0400
@@ -1,12 +1,14 @@
 # Copyright Spack Project Developers. See COPYRIGHT file for details.
 #
 # SPDX-License-Identifier: (Apache-2.0 OR MIT)
+import os
 import pathlib
 import shutil
 import sys
 
 from spack_repo.builtin.build_systems.generic import Package
 
+import spack.builder
 from spack.package import *
 
 
@@ -27,7 +29,7 @@
     """
 
     homepage = "https://github.com/spack/spack"
-    url = f"file:///{pathlib.PurePath(__file__).parent}/cc.sh"
+    url = "https://github.com/spack/compiler-wrapper/releases/download/v1.0/compiler-wrapper-1.0.tar.gz"
 
     # FIXME (compiler as nodes): use a different tag, since this is only to exclude
     # this node from auto-generated rules
@@ -38,11 +40,15 @@
     license("Apache-2.0 OR MIT")
 
     if sys.platform != "win32":
+        version("1.1.0", sha256="a07b35081d14b0729090bc1e5790a5dda2d5b997e064c62da39a1224ee249b2a")
+        version("1.0", sha256="ac876f7600fa6cb0c74ae172ef1c61661aacff03a6befbc7d87e092e2f2233f9")
+        # Prototype: pulls in --build-id/-Wl,--build-id injection ahead of an official release.
         version(
-            "1.0",
-            sha256="c7b816479554fd32f677db15ceec6627b91c86074a5d65498688afcbe2796188",
-            expand=False,
+            "1.1.0-build-id",
+            git="https://github.com/SebastianPaucar/compiler-wrapper.git",
+            commit="6db88149277190ae93e40f90d3550ebf937ce056",
         )
+
     else:
         version("1.0")
         has_code = False
@@ -175,6 +181,10 @@
             compiler = getattr(compiler_pkg, attr_name)
             env.set(spack_var_name, compiler)
 
+            # -frandom-seed= is needed for deterministic builds with GCC
+            if compiler_pkg.name == "gcc" and self.spec.satisfies("@1.1:"):
+                env.set(f"SPACK_{wrapper_var_name}_HAS_FRANDOM_SEED", "1")
+
             if language not in compiler_pkg.compiler_wrapper_link_paths:
                 continue
 
@@ -228,6 +238,23 @@
             extra_rpaths = dedupe(extra_rpaths)
             env.set("SPACK_COMPILER_EXTRA_RPATHS", ":".join(extra_rpaths))
 
+        # Set SPACK_PREFIX_MAP and SPACK_BUILD_PREFIX_MAP, so
+        # the source tree and and the out-of-source build directory
+        # are remapped to . and ./build respectively
+        staging_src = dependent_spec.package.stage.source_path
+        env.set("SPACK_PREFIX_MAP", staging_src)
+
+        try:
+            builder = spack.builder.create(dependent_spec.package)
+            build_dir = getattr(builder, "build_directory", None)
+        except Exception:
+            build_dir = None
+
+        if build_dir and os.path.isabs(build_dir):
+            env.set("SPACK_BUILD_PREFIX_MAP", build_dir)
+        else:
+            env.set("SPACK_BUILD_PREFIX_MAP", staging_src)
+
         env.set("SPACK_ENABLE_NEW_DTAGS", self.enable_new_dtags)
         env.set("SPACK_DISABLE_NEW_DTAGS", self.disable_new_dtags)
```

```bash
> cp /tmp/compiler_wrapper.package.py.patched /opt/spack-packages/repos/spack_repo/builtin/packages/compiler_wrapper/package.py
cp: overwrite '/opt/spack-packages/repos/spack_repo/builtin/packages/compiler_wrapper/package.py'? y
> spack info compiler-wrapper | grep -A6 "Preferred version\|Safe versions\|Versions:"
Preferred version:  
    1.1.0-build-id    [git] https://github.com/SebastianPaucar/compiler-wrapper.git at commit 6db88149277190ae93e40f90d3550ebf937ce056

Safe versions:  
    1.1.0-build-id    [git] https://github.com/SebastianPaucar/compiler-wrapper.git at commit 6db88149277190ae93e40f90d3550ebf937ce056
    1.1.0             https://github.com/spack/compiler-wrapper/releases/download/v1.1.0/compiler-wrapper-1.1.0.tar.gz
    1.0               https://github.com/spack/compiler-wrapper/releases/download/v1.0/compiler-wrapper-1.0.tar.gz

Deprecated versions:  
    None
```

```bash
> cp /opt/spack-environment/concretizer.yaml /opt/spack-environment-debug/
> cp /opt/spack-environment/config.yaml /opt/spack-environment-debug/
> cp /opt/spack-environment/packages.yaml /opt/spack-environment-debug/
> cp /opt/spack-environment/packages_root_with_opengl.yaml /opt/spack-environment-debug/
> cp /opt/spack-environment/view.yaml /opt/spack-environment-debug/
> cp /opt/spack-environment/xl/spack.yaml /opt/spack-environment-debug/xl/
> cp /opt/spack-environment/xl/spack.lock /opt/spack-environment-debug/xl/
> cp /opt/spack-environment/xl/epic/spack.yaml /opt/spack-environment-debug/xl/epic/
> cp /opt/spack-environment/xl/epic/spack.lock /opt/spack-environment-debug/xl/epic/
```

```bash
> . /opt/spack-debug/share/spack/setup-env.sh
> spack env activate -d /opt/spack-environment-debug/xl/epic
> spack env status
==> In environment /opt/spack-environment-debug/xl/epic
> which spack
/opt/spack-debug/bin/spack
> spack --version
1.2.2 (9b558fc99dedfc17b00959c3644cfc19b06da8a9)
```

```bash
> emacs  /opt/spack-environment-debug/xl/spack.yaml
> emacs /opt/spack-environment-debug/xl/epic/spack.yaml
> grep -n "acts\|eicrecon" /opt/spack-environment-debug/xl/spack.yaml
9:  - acts build_type=RelWithDebInfo ^compiler-wrapper@1.1.0-build-id
10:  - actsvg
56:  - k4actstracking
> grep -n "acts\|eicrecon" /opt/spack-environment-debug/xl/epic/spack.yaml
20:  - eicrecon build_type=RelWithDebInfo ^compiler-wrapper@1.1.0-build-id
```

```bash
> cat > /opt/local/etc/cmake/find_package_resolve_symlinks.cmake <<'EOF'
# Stub toolchain file — created to satisfy CMAKE_TOOLCHAIN_FILE lookup
# triggered by Spack's compiler-wrapper/CMake integration in this environment.
set(CMAKE_FIND_PACKAGE_RESOLVE_SYMLINKS ON)
EOF
```

```bash
> nohup spack install --add --debug-source --debug-symbols \
  "eicrecon@1.39.2 build_type=RelWithDebInfo" \
  "acts@45.3.0 build_type=RelWithDebInfo" \
  ^compiler-wrapper@1.1.0-build-id \
  > /repro/debug-install.log 2>&1 &
[1] 10935
> disown
> echo "debug install launched, pid $!"
debug install launched, pid 10935
> cat /repro/debug-install.log
nohup: ignoring input
==> Warning: The following issues were ignored while updating the indices of binary caches:
FetchIndexError: Could not fetch manifest from https://ghcr.io/v2/eic/spack-v2026.03.0/manifests/index.spack, due to: GET https://ghcr.io/v2/eic/spack-v2026.03.0/manifests/index.spack returned 404: Not Found
[ ] l5w2n3b acts@45.3.0 fetching from build cache (0s)
[ ] l5w2n3b acts@45.3.0 no binary available (1s)
[ ] l5w2n3b acts@45.3.0 staging (3s)
[ ] l5w2n3b acts@45.3.0 cmake (4s)
[ ] l5w2n3b acts@45.3.0 build (34s)
[ ] l5w2n3b acts@45.3.0 install (12m42s)
[+] l5w2n3b acts@45.3.0 /root/spack/linux-x86_64_v2/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7 (14m02s)
[ ] uqzp2yc eicrecon@1.39.2 fetching from build cache (0s)
[ ] giy6qcb k4actstracking@00-01 fetching from build cache (0s)
[ ] giy6qcb k4actstracking@00-01 no binary available (2s)
[ ] uqzp2yc eicrecon@1.39.2 no binary available (2s)
[ ] uqzp2yc eicrecon@1.39.2 staging (2s)
[ ] giy6qcb k4actstracking@00-01 staging (2s)
[ ] giy6qcb k4actstracking@00-01 cmake (3s)
[ ] uqzp2yc eicrecon@1.39.2 cmake (4s)
[ ] uqzp2yc eicrecon@1.39.2 build (15s)
[ ] giy6qcb k4actstracking@00-01 build (19s)
[ ] giy6qcb k4actstracking@00-01 install (1m01s)
[+] giy6qcb k4actstracking@00-01 /root/spack/linux-x86_64_v2/k4actstracking-00-01-giy6qcb4oaehw5ovgz5qphecbkqjvjkq (1m03s)
[ ] uqzp2yc eicrecon@1.39.2 install (5m03s)
[+] uqzp2yc eicrecon@1.39.2 /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd (5m32s)
[ ] 6g3t3by juggler@15.2.0 fetching from build cache (0s)
[ ] 6g3t3by juggler@15.2.0 no binary available (2s)
[ ] 6g3t3by juggler@15.2.0 staging (3s)
[ ] 6g3t3by juggler@15.2.0 cmake (4s)
[ ] 6g3t3by juggler@15.2.0 build (12s)
[ ] 6g3t3by juggler@15.2.0 install (1m39s)
[+] 6g3t3by juggler@15.2.0 /root/spack/linux-x86_64_v2/juggler-15.2.0-6g3t3byl6xvruxakqjby75byzrjibjnj (1m40s)
==> Updating view at /opt/local
```

```bash
> cd /root/.spack/debug-sources/
> ls
./  ../  acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/  eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/
> ls *
acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7:
./  ../  Alignment/  cmake/  compile_commands.json  Core/  Examples/  Fatras/  gdbinit  Plugins/  Python/  symbols/  Tests/

eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd:
./  ../  compile_commands.json  gdbinit  src/  symbols/
```

> find /root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd -maxdepth 2 -iname "eicrecon"
/root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/lib/EICrecon
/root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/include/EICrecon
/root/spack/linux-x86_64_v2/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/bin/eicrecon
> find /repro/scratch -iname "*.edm4hep.root"
/repro/scratch/960/FULL/26.07.1/epic_craterlake/DIS/pythia8.316-1.0/NC/noRad/ep/10x100/q2_1000toINF/pythia8.316-1.0_NC_noRad_ep_10x100_q2_1000toINF_run000.0115.edm4hep.root
> find /opt/software/linux-x86_64_v2/epic-26.07.1-*/share/epic -iname "epic_craterlake_10x100.xml"
/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml

```bash
> cat > /repro/combined-gdbinit <<'EOF'
# Combined debug config: eicrecon + acts
set substitute-path ./build /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd
set substitute-path . /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd
set substitute-path ./build /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7
set substitute-path . /root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7
set debug-file-directory /root/.spack/debug-sources/eicrecon-1.39.2-uqzp2ych7ziv4a3imjygmmmk2q46ybkd/symbols:/root/.spack/debug-sources/acts-45.3.0-l5w2n3bqp6iwwuizcjggcsvvk6qjhyy7/symbols
EOF
```

```bash
> source /opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/setup.sh
env | grep -i detector
Error: This script has ceased to exist at '/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/setup.sh'.
       Please use the version at '/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/bin/thisepic.sh'.
DETECTOR_CACHE=/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic
DETECTOR_PATH=/opt/local/share/epic
DETECTOR=epic
DETECTOR_CONFIG=epic
DETECTOR_VERSION=26.07.1
> ln -s /opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/compact /opt/local/share/epic/compact
> ln -s /opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml /opt/local/share/epic/epic_craterlake_10x100.xml
> source /opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/bin/thisepic.sh
> source /repro/environment-manifest.sh
> export DETECTOR_BEAMS=10x100
> export DETECTOR_COMPACT=${DETECTOR_PATH}/${DETECTOR_CONFIG}_${DETECTOR_BEAMS}.xml
> echo "DETECTOR_COMPACT=$DETECTOR_COMPACT"
DETECTOR_COMPACT=/opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml
> ls -la "$DETECTOR_COMPACT"
-rw-r--r--. 1 root root 6.7K Dec 31  1969 /opt/software/linux-x86_64_v2/epic-26.07.1-uzwreubimqduvctpoysj5wmbj6ay5emu/share/epic/epic_craterlake_10x100.xml
```
