# `_s_h_e_l_l`

shell scripts for git, ci/cd, etc


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
