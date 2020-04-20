#!/bin/bash
set -e

defaultjdkImage='openjdk:8-alpine'
declare -A jdkImages=(
	[0.8.0]='openjdk:8-alpine'
	[0.8.1]='openjdk:8-alpine'
	[0.8.2]='openjdk:8-alpine'
)

declare -A releases=(
	[0.8.0]='https://repo1.maven.org/maven2/org/seaborne/rdf-delta/rdf-delta-dist/0.8.0/rdf-delta-dist-0.8.0.zip'
	[0.8.1]='https://repo1.maven.org/maven2/org/seaborne/rdf-delta/rdf-delta-dist/0.8.1/rdf-delta-dist-0.8.1.zip'
	[0.8.2]='https://repo1.maven.org/maven2/org/seaborne/rdf-delta/rdf-delta-dist/0.8.2/rdf-delta-dist-0.8.2.zip'
)

versions=( "$@" )

if [ ${#versions[@]} -eq 0 ]; then
	versions=("${!releases[@]}")
fi
versions=( "${versions[@]%/}" )
for version in "${versions[@]}"; do
    echo "produce $version"
    dockerfiles=()
    if [ ! -e "$version" ]; then
        mkdir "$version"
    fi

    # prepare Dockerfile
	{ cat Dockerfile.template; } > "$version/Dockerfile"
	# { cat README.md; } > "$version/README.md"

    jdkImage="${jdkImages[$version]:-$defaultjdkImage}"
    url="${releases[$version]}"
    fullVersion="${version}"
    dockerfiles+=( "$version/Dockerfile" )

    for f in "${version}"/*; do
        if [ ! -d "${f}" ]; then
            (
                sed -ri \
                    -e 's!%%VERSION%%!'"$fullVersion"'!' \
                    -e 's!%%RELEASE_URL%%!'"$url"'!' \
                    -e 's!%%JDK_IMAGE%%!'"$jdkImage"'!' \
                    ${f}
            )
        fi
    done
done