
#!/bin/bash
set -x
shopt -s extglob

if [[ "$TRAVIS_SECURE_ENV_VARS" != "true" ]]
then
  echo >&2 "Missing TRAVIS_SECURE_ENV_VARS. Skipping GitHub deployment."
  exit 0
fi

install_deps() {
  version="2.7.0"  # 2.14.1 fails to overwrite duplicates
  case "$(uname)" in
    Linux)
      sudo apt-get update
      sudo apt-get install curl
      curl -L "https://github.com/github/hub/releases/download/v$version/hub-linux-amd64-$version.tgz" | tar xvz --strip-components=1 "hub-linux-amd64-$version/bin/hub"
      ;;
    Darwin)
      curl -L "https://github.com/github/hub/releases/download/v$version/hub-darwin-amd64-$version.tgz" | tar xvz --strip-components=1 "hub-darwin-amd64-$version/bin/hub"
      ;;
    *)
      echo "Unknown: $(uname)"
      exit 1
      ;;
  esac

  hub_path="$PWD/bin/hub"
  hub() {
    "$hub_path" "$@"
  }
}
install_deps

export EDITOR="touch"

# Sanity check
hub release show latest || exit 1

for tag in $TAGS
do
  if ! hub release show "$tag"
  then
    echo "Creating new release $tag"
    git show --no-patch  --format='format:%B' > description
    hub release create -F description "$tag"
  fi

  files=()
  for file in deploy/*
  do
    [[ $file == *.@(xz|gz|zip) ]] || continue
    [[ $file == *"$tag"* ]] || continue
    files+=(-a "$file")
  done
  hub release edit "${files[@]}" "$tag" || exit 1
done
