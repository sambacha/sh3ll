#!/usr/bin/env bash
# SPDX-License-Identifier: ISC
tgzx() {
	( ${#} >= 2; ) || { echo 'usage: tgzx archive-file [files | directories]'; return 1; }
	# shellcheck disable=SC2016
	printf '#!/usr/bin/env bash\ntail -n+3 ${0} | openssl enc -aes-256-cbc -d -a | tar ${1:-xv}z; exit\n' >"${1}"
	tar zc "${@:2}" | openssl enc -aes-256-cbc -a -salt >>"${1}" && chmod +x "${1}"
}
