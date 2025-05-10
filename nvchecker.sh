#!/bin/bash

# Wrapper script around nvchecker that automatically detects the versions of
# packages in in this repo, and loads the appropriate configuration.

repo_packages() {
	cut -d ' ' -f 1 < ./repo_packages.txt | sort
}

nvchecker_packages() {
	grep '\[.*]' ./nvchecker.toml |
		tr -d '][' |
		grep -vx __config__ |
		sort
}

check_missing_sources() {
	missing_packages="$(comm -23 <(repo_packages) <(nvchecker_packages))"
	if [ -n "$missing_packages" ]; then
		printf "Error: some packages don't have nvchecker sources configured\n"
		printf "%s" "$missing_packages" | sed 's/^/ - /'
		printf "\n"
	fi
}

process_pkgbuild() (
	# This function receives a path to a pkgbuild as $1, which is soruced so
	# we can access variables defined in it. A subshell is used to avoid
	# polluting the rest of the script with variables form the pkgbuild.

	# shellcheck source=/dev/null
	source "$1"

	# Some packages don't haev a upstream source that we care to check.
	if [ -n "$_nvchecker_skip" ]; then
		return
	fi

	# If the format of pkgver is too different from what nvchecker expects,
	# we may need to specificy it the version nvchecker expects too.
	if [ -n "$_nvchecker_version" ]; then
		pkgver="$_nvchecker_version"
	fi

	# Disable "SC2154 var is referenced but not assigned", these will be
	# defined by the pkgbuild, but shellcheck doesn't know about that.
	# shellcheck disable=SC2154
	printf "%s %s\n" "$pkgname" "$pkgver"
)

generate_published() {
	find ./sxmo ./plasma ./pine64 -name PKGBUILD | while read -r pkgbuild; do
		process_pkgbuild "$pkgbuild"
	done
}

generate_published > repo_packages.txt
check_missing_sources
nvchecker -c ./nvchecker.toml
