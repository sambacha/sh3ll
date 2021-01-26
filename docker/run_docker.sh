#!/bin/bash
function run_docker() {
    if [[ "$1" == "--upgrade" ]] || [[ "$1" == "--install" ]]; then
        if [[ "$1" == "--upgrade" ]]; then
            echo "Upgrading ${APPLICATION}t..."
            docker pull "${GITHUB}"/"${APPLICATION}":latest
        else
            echo "Installing ${APPLICATION}t..."
        fi
        if [[ -n "$2" ]]; then
            mkdir -p "$2"/bin
        fi
        export PREFIX="$2"
        docker run --read-only -i --rm --entrypoint='/bin/sh' "${GITHUB}"/"${APPLICATION}":latest -c 'cat /usr/bin/install.sh' | bash
    else
        docker run --read-only -i --rm --cap-add=SYS_ADMIN -e APPLICATION_VERSION="$GIT_TAG" -e HOST_PWD="$PWD" --mount type=bind,source=/,target=/workdir "${GITHUB}"/"${APPLICATION}":latest "$@"
    fi
}
