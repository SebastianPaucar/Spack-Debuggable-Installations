# Spack Debuggable Installations Demo

This container demonstrates Spack's new `--debug-source` and `--debug-symbols` install flags, developed on the `feature/debuggable-installations-source-and-symbols` branch. These flags preserve the full build source and out-of-source tree and split debug symbols for installed packages so you can attach a debugger to an installed binary and get full source-level detail (exact file, line number, and variable values) instead of a bare, symbol-less crash.

The content related to this demo is:

* [PR 52768](https://github.com/spack/spack/pull/52768) (`spack/spack`): DWARF-referenced source hook and symbol splitting plus GDB init for debuggable installations.
* [PR 19](https://github.com/spack/compiler-wrapper/pull/19) (`spack/compiler-wrapper`): `-ffile-prefix-map=<staging>=.` and `--build-id` injection in compiler-wrapper.
* [PR 5353](https://github.com/spack/spack-packages/pull/5353) (`spack/spack-packages`): set `SPACK_DEBUG_PREFIX_MAP` for `-ffile-prefix-map=<stage>=.` injection at compiler-wrapper level.
* [Issue 52580](https://github.com/spack/spack/issues/52580) (`spack/spack`): `.spack/` vs relative paths vs compiler-wrapper remaps.

Particulary, the Dockerfile in this demo (attached) wires my repos:

* `spack/spack`: [`feature/debuggable-installations-source-and-symbols`](https://github.com/SebastianPaucar/spack/tree/feature/debuggable-installations-source-and-symbols) branch (forked)
* `spack/compiler-wrapper`: [`feature/debug-prefix-map`](https://github.com/SebastianPaucar/compiler-wrapper/tree/feature/debug-prefix-map) branch (forked).
* `spack/spack-packages`: [`feature/compiler-wrapper-build-id-prototype`](https://github.com/SebastianPaucar/spack-packages/tree/feature/compiler-wrapper-build-id-prototype) branch (forked).
* [`repo-poc`](https://github.com/SebastianPaucar/poc-repo): A custom package repo (`poc_repo`) containing `hdf5-crash-demo`, alongside the standard builtin package repo.

## What is in the demo container

* The container ships a deliberately-crashing HDF5 variant (`hdf5-crash-demo`),  a patched copy of upstream HDF5 that null-pointer-dereferences whenever an attribute name starts with the letter `X`. It exists purely as a reproducible PoC so you can walk through the full install-crash-debug pipeline yourself, live, inside the container.
* A pre-installed, standard `hdf5` build, unrelated to the crash demo, is also included in the container just as a baseline example.
* `/root/demo/repro_simple.c` a small C program that creates an HDF5 file and writes an attribute named `Xcrash`, triggering the deliberate crash.

## Quick start

## 1. Pull and run the container

```bash
git clone git@github.com:SebastianPaucar/Spack-Debuggable-Installations.git
docker pull sebastianpaucar/spack-debuggable-installations:latest
docker run -it sebastianpaucar/spack-debuggable-installations:latest interactive-shell
```

This drops you into an interactive shell inside the container, with Spack already activated..

## 2. Install the crash-demo package with debug source and symbols

```bash
spack install --debug-source --debug-symbols hdf5-crash-demo build_type=Debug  ^compiler-wrapper@1.1.0-build-id ^readline@8.2 ^openmpi
```

> Note: `build_type=Debug` is required for building with debug info, so the Spack's symbol-splitting step can work. `readline@8.2` is used due a network issue related to the standard `readline@8.3` for `hdf5`.

## 3. Compile the reproducer against it

```bash
HDF5_PREFIX=$(spack location -i hdf5-crash-demo)

$(spack location -i mpi)/bin/mpicc -g0 /root/demo/repro_simple.c \
    -I${HDF5_PREFIX}/include -L${HDF5_PREFIX}/lib -lhdf5 \
    -Wl,-rpath,${HDF5_PREFIX}/lib -o /root/demo/repro_simple
```

## 4. Run it (it will segfault)

```bash
/root/demo/repro_simple
```

```bash
Segmentation fault (core dumped)
```

This is expected. The patched HDF5 deliberately dereferences a null pointer whenever an attribute name starts with `X`, and repro_simple.c writes an attribute named `Xcrash`.

## 5. Debug it with full source-level detail

```bash
CACHE=$(find ~/.spack/debug-sources -maxdepth 1 -iname "hdf5-crash-demo*")
gdb -x ${CACHE}/gdbinit -ex run -ex bt -ex list --args /root/demo/repro_simple
```

This loads a Spack-generated `gdbinit` that points `gdb` at the cached source tree and split debug symbols for this exact build. You should see a full backtrace with source file, line number, and live variable values, landing directly on the injected crash:

```bash
Program received signal SIGSEGV, Segmentation fault.
H5A__create (loc=loc@entry=0x7ffec77f81a0, attr_name=attr_name@entry=0x400b60 "Xcrash", type=type@entry=0xb33880, space=space@entry=0xb5f890, 
    acpl_id=acpl_id@entry=792633534417207310) at ./src/H5Aint.c:251
251	        *poc_null      = 42;
#0  H5A__create (loc=loc@entry=0x7ffec77f81a0, attr_name=attr_name@entry=0x400b60 "Xcrash", type=type@entry=0xb33880, space=space@entry=0xb5f890, 
    acpl_id=acpl_id@entry=792633534417207310) at ./src/H5Aint.c:251
#1  0x00007fac85dc28e1 in H5VL__native_attr_create (obj=<optimized out>, loc_params=0x7ffec77f8330, attr_name=0x400b60 "Xcrash", type_id=<optimized out>, 
    space_id=288230376151711747, acpl_id=792633534417207310, aapl_id=792633534417207311, dxpl_id=792633534417207304, req=0x0) at ./src/H5VLnative_attr.c:110
#2  0x00007fac85da771c in H5VL__attr_create (obj=0xb5b890, loc_params=loc_params@entry=0x7ffec77f8330, cls=0xb26360, name=name@entry=0x400b60 "Xcrash", 
    type_id=type_id@entry=216172782113783825, space_id=space_id@entry=288230376151711747, acpl_id=792633534417207310, aapl_id=792633534417207311, dxpl_id=792633534417207304, 
    req=0x0) at ./src/H5VLcallback.c:988
#3  0x00007fac85dadbff in H5VL_attr_create (vol_obj=vol_obj@entry=0xb5f4f0, loc_params=loc_params@entry=0x7ffec77f8330, name=name@entry=0x400b60 "Xcrash", 
    type_id=type_id@entry=216172782113783825, space_id=space_id@entry=288230376151711747, acpl_id=acpl_id@entry=792633534417207310, aapl_id=792633534417207311, 
    dxpl_id=792633534417207304, req=0x0) at ./src/H5VLcallback.c:1021
#4  0x00007fac85a0593e in H5A__create_common (vol_obj=0xb5f4f0, loc_params=loc_params@entry=0x7ffec77f8330, attr_name=attr_name@entry=0x400b60 "Xcrash", 
    type_id=type_id@entry=216172782113783825, space_id=space_id@entry=288230376151711747, acpl_id=acpl_id@entry=792633534417207310, aapl_id=792633534417207311, token_ptr=0x0)
    at ./src/H5A.c:123
#5  0x00007fac85a05be8 in H5A__create_api_common (loc_id=loc_id@entry=72057594037927936, attr_name=attr_name@entry=0x400b60 "Xcrash", 
    type_id=type_id@entry=216172782113783825, space_id=space_id@entry=288230376151711747, acpl_id=792633534417207310, acpl_id@entry=0, aapl_id=<optimized out>, 
    aapl_id@entry=0, token_ptr=0x0, _vol_obj_ptr=0x0) at ./src/H5A.c:179
#6  0x00007fac85a07ccf in H5Acreate2 (loc_id=72057594037927936, attr_name=0x400b60 "Xcrash", type_id=216172782113783825, space_id=288230376151711747, acpl_id=0, aapl_id=0)
    at ./src/H5A.c:228
#7  0x0000000000400a66 in main ()
246	    assert(space);
247	
248	    /* Deliberate PoC crash: trigger on any attribute name starting with "X" */
249	    if (attr_name[0] == 'X') {
250	        int *poc_null = NULL;
251
k*poc_null      = 42;
```

As shown above, a full call stack (`H5Acreate2`-`H5A__create_api_common`-`H5A__create_common`-`H5VL_attr_create`-`...`-`H5A__create`) and a source listing centered on the crash line is triggered, all reconstructed from the cached debug-source tree.

## Why this matters

Normally, once a package finishes building, its build directory and unstripped debug info are gone. If a user hits a crash in production, there's no easy way to get back to sou
rce-level debugging without rebuilding from scratch with debug flags. The `--debug-source` and `--debug-symbols` flags solve this by caching exactly what's needed (source tree + split symbols, keyed by the package's dag hash) so any installed build stays debuggable long after the fact.


Normally, once a package finishes building, its build directory and unstripped debug info are gone. If a user hits a crash in production, there's no easy way to get back to source-level debugging without rebuilding from scratch with debug flags. The `--debug-source` and `--debug-symbols` flags solve this by caching exactly what's needed (source tree + split symbols, keyed by the package's dag hash) so a debug build stays debuggable long after the fact, without needing to keep the original build directory around.

> Note: `--debug-symbols` splits symbols out of the installed binaries, which requires those binaries to actually carry debug info in the first place, so the package must be  nstalled with `build_type=Debug` (or an equivalent debug-info flag for non-CMake build systems). Installing without a debug build type will skip symbol splitting silently: `--debug-source` still caches the source tree, but no `symbols/` directory or build-ID index is produced.

## Notes

### Debug cache layout (out-of-prefix)

Split debug symbols are stored outside the install prefix, under `~/.spack/debug-sources/<package>-<version>-<dag-hash>/symbols/`, organized by build-ID (the standard ELF mechanism debuggers use to match a binary to its separate debug file):


```bash
[root@5031a4660868 ~]# ls  ~/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54
HDF5Examples  c++  compile_commands.json  fortran  gdbinit  hl	java  m4  src  symbols	test  testpar  tools  utils
[root@5031a4660868 ~]# ls  ~/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54/symbols/
h5clear.debug  h5delete.debug  h5format_convert.debug  h5ls.debug     h5perf_serial.debug  h5stat.debug			   libhdf5_tools_debug.so.310.0.6.debug  ph5diff.debug
h5copy.debug   h5diff.debug    h5import.debug	       h5mkgrp.debug  h5repack.debug	   h5unjam.debug		   mirror_server.debug
h5debug.debug  h5dump.debug    h5jam.debug	       h5perf.debug   h5repart.debug	   libhdf5_debug.so.310.5.1.debug  mirror_server_stop.debug
[root@5031a4660868 ~]# ls  ~/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54/symbols/.build-id/
09  16	18  1d	32  44	45  4a	65  6b	77  7c	7f  81	ac  c9	cb  cc	d3  eb	f6
```
Because the symbols are keyed by build-ID rather than tied to a specific file path, `gdb` can locate them automatically via `set debug-file-directory` (see below) as long as the installed binaries retain their build-ID notes. No manual `add-symbol-file` bookkeeping needed in the common case.


### Prefix size reporting

Splitting debug symbols out of the binaries also shrinks the installed package itself. The generated `gdbinit` reports exactly how much smaller the install prefix became as a result:

```bash
cat ~/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54/gdbinit
# Generated by 'spack debug' for hdf5@1.14.6
# dag_hash: mtl4u2gq3pbkw77o6baggzmgxrftaz54
set substitute-path ./build /root/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54
set debug-file-directory /root/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54/symbols
#
# Debug symbols were split for 22 binaries into:
#   /root/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54/symbols/
# Prefix size reduced by ~24.4 MiB
# The debug-file-directory line above auto-loads split symbols via
# build-id lookup, if your toolchain emits build-id notes at link time.
# If it doesn't, or auto-discovery still doesn't trigger, load manually:
#   add-symbol-file "/root/.spack/debug-sources/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54/symbols/h5clear.debug" <load-address>   # for /opt/software/linux-broadwell/hdf5-1.14.6-mtl4u2gq3pbkw77o6baggzmgxrftaz54/bin/h5clear
#   (get <load-address> from `info sharedlibrary` after `run`)
```

For `hdf5`, splitting symbols out of 22 binaries reduced the install prefix by roughly 24.4 MiB, a  deployment-size benefit on top of the debuggability gain, since production installs no longer need to carry full debug sections inline in every shared library and executable.