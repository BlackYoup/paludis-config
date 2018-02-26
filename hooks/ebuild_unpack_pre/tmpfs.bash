#!/usr/bin/env bash

hook_umount_tmpfs() {
	local ignore_packages
	local current_package
	local tmpfs
	ignore_packages=( net-www/chromium-stable dev-db/mongodb )
	current_package="${CATEGORY}/${PN}"
	tmpfs="/var/tmp/paludis/build/"

	for package in "${ignore_packages[@]}";
	do
		if [[ "${current_package}" == "${package}" ]]; then
			elog "We are installing \"${package}\" so I'm unmounting $tmpfs"
			umount "${tmpfs}"
			# let's clean things, just in case
			rm "${tmpfs:?}/*" -rf
			exit 0
		fi
	done

	mount "${tmpfs}"
	exit 0

}

hook_umount_tmpfs "$@"
