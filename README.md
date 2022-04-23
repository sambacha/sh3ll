# `_s_h_e_l_l`

shell scripts for git, ci/cd, etc

```shell
          make -C git -j$(sysctl -n hw.physicalcpu) GIT-VERSION-FILE dist dist-doc
```

```bash
 mkfifo pipe
 tee out.txt < pipe &
 command > pipe
 echo $?
 ```

```sh
# Source: http://fvue.nl/wiki/Bash:_Error_handling
#
#!/bin/bash -eu
# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error when substituting.
 
(false)                   # Caveat 1: If an error occurs in a subshell, it isn't detected
(false) || false          # Solution: If you want to exit, you have to detect the error yourself
(false; true) || false    # Caveat 2: The return status of the ';' separated list is `true'
(false && true) || false  # Solution: If you want to control the last command executed, use `&&'
```

### mk dmg

```bash
       die () {
            echo "$*" >&2
            exit 1
          }
          VERSION="`sed -n 's/^GIT_VERSION = //p' <git/GIT-VERSION-FILE`"
          test -n "$VERSION" ||
          die "Could not determine version!"
          export VERSION
          ln -s git git-$VERSION
          mkdir -p build &&
          cp git/git-$VERSION.tar.gz git/git-manpages-$VERSION.tar.gz build/ ||
          die "Could not copy .tar.gz files"
          # drop the -isysroot `GIT_SDK` hack
          sed -i .bak -e 's/ -isysroot .(SDK_PATH)//' Makefile ||
          die "Could not drop the -isysroot hack"
          # make sure that .../usr/local/git/share/man/ exists
          sed -i .bak -e 's/\(tar .*-C \)\(.*\/share\/man\)$/mkdir -p \2 \&\& &/' Makefile ||
          die "Could not edit Makefile"
          # For debugging:
          #
          # cat Makefile
          # make vars
          PATH=/usr/local/bin:/System/Library/Frameworks:$PATH \
          make build/intel-universal-snow-leopard/git-$VERSION/osx-built-keychain ||
          die "Build failed"
          PATH=/usr/local/bin:$PATH \
          make image ||
          die "Build failed"
          mkdir osx-installer &&
          mv *.dmg disk-image/*.pkg osx-installer/
   ```
