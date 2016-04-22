#!/bin/sh

# kernel.org supports rsync
mirror="archive.kernel.org/centos-vault"
# Local Repository Location
repobase="/home/igw/img/Repo/CentOS7"

# versions could be added like ver1 ver2 etc, seperate by space
for vers in 7.0.1406; do
	mkdir -p ${repobase}/${vers}/{cr,centosplus,extras,fasttrack,os,updates}/x86_64
	for repo in cr centosplus extras fasttrack os updates; do
		rsync -art rsync://${mirror}/${vers}/$repo/x86_64 ${repobase}/${vers}/os/
		if [ $? -ne 0 ]; then
			echo "ERROR getting ${repo} files from ${mirror} for ${vers} x64, quitting."
			exit 1
		fi
	done
done
