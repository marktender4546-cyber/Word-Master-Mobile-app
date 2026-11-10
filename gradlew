#!/usr/bin/env sh
set -eu
GRADLE_VERSION=8.13
WRAPPER_HOME="${HOME}/.gradle/wordmaster-wrapper"
GRADLE_HOME="${WRAPPER_HOME}/gradle-${GRADLE_VERSION}"
if [ ! -x "${GRADLE_HOME}/bin/gradle" ]; then
  mkdir -p "${WRAPPER_HOME}"
  ZIP="${WRAPPER_HOME}/gradle-${GRADLE_VERSION}-bin.zip"
  echo "Downloading Gradle ${GRADLE_VERSION}..."
  if command -v curl >/dev/null 2>&1; then
    curl -fL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o "${ZIP}"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "${ZIP}" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
  else
    echo "curl yoki wget kerak" >&2
    exit 1
  fi
  unzip -q -o "${ZIP}" -d "${WRAPPER_HOME}"
fi
exec "${GRADLE_HOME}/bin/gradle" "$@"
