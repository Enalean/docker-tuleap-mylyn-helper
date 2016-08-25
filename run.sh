#!/bin/bash

readonly MYLYN_SRC='/tuleap-mylyn-src'

cleanup() {
    local base_path_owner
    base_path_owner="$(stat -c '%u:%g' "$BASE_PATH")"
    chown -R "$base_path_owner" "$BASE_PATH"
}
trap cleanup EXIT

run_tests() {
    exec env DISPLAY=:99 mvn -X integration-test -f "$MYLYN_SRC/org.tuleap.mylyn.task.parent/pom.xml"
}

build_packages() {
    exec mvn package -f "$MYLYN_SRC/org.tuleap.mylyn.task.repository"
}

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64/jre'
Xvfb :99 &

if [[ '--build' == "$1" ]]; then
    build_packages
elif [[ '--test' == "$1" ]]; then
    run_tests
else
    printf "You can either pass --test or --build packages" >&2
fi
