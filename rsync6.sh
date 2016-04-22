#!/bin/sh

# kernel.org supports rsync
mirror="archive.kernel.org/centos-vault"
# Local Repository Location
repobase="/home/igw/img/Repo/CentOS6"

# versions could be added like ver1 ver2 etc, seperate by space
for vers in 6.4; do
	for repo in cr centosplus contrib extras fasttrack os updates xen4; do
		mkdir -p ${repobase}/${vers}/${repo}/x86_64
		rsync -artv rsync://${mirror}/${vers}/$repo/x86_64 ${repobase}/${vers}/os/
		if [ $? -ne 0 ]; then
			echo "ERROR getting ${repo} files from ${mirror} for ${vers} x64, quitting."
			exit 1
		fi
	done
done
