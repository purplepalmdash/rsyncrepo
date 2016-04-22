#!/bin/sh

# kernel.org supports rsync
mirror="archive.kernel.org/centos"
# Local Repository Location
repobase="/home/igw/img/Repo/CentOS7"

mkdir -p ${repobase}/${vers}/centosplus/x86_64
mkdir -p ${repobase}/${vers}/cr/x86_64
mkdir -p ${repobase}/${vers}/extras/x86_64
mkdir -p ${repobase}/${vers}/fasttrack/x86_64
mkdir -p ${repobase}/${vers}/os/x86_64
mkdir -p ${repobase}/${vers}/updates/x86_64

# versions could be added like ver1,ver2, etc..
for vers in 7.0.1406; do
rsync -art rsync://${mirror}/${vers}/os/x86_64 ${repobase}/${vers}/os/

if [ $? -ne 0 ]; then
echo "ERROR getting os files from ${mirror} for ${vers} x64, quitting."
exit 1
fi

rsync -art rsync://${mirror}/${vers}/updates/x86_64 ${repobase}/${vers}/updates/

if [ $? -ne 0 ]; then
echo "ERROR getting updates files from ${mirror} for ${vers} x64, quitting."
exit 1
fi

rsync -art rsync://${mirror}/${vers}/centosplus/x86_64 ${repobase}/${vers}/centosplus/

if [ $? -ne 0 ]; then
echo "ERROR getting centosplus files from ${mirror} for ${vers} x64, quitting."
exit 1
fi

rsync -art rsync://${mirror}/${vers}/cr/x86_64 ${repobase}/${vers}/cr/

if [ $? -ne 0 ]; then
echo "ERROR getting updates cr from ${mirror} for ${vers} x64, quitting."
exit 1
fi

rsync -art rsync://${mirror}/${vers}/extras/x86_64 ${repobase}/${vers}/extras/

if [ $? -ne 0 ]; then
echo "ERROR getting extra files from ${mirror} for ${vers} x64, quitting."
exit 1
fi

rsync -art rsync://${mirror}/${vers}/fasttrack/x86_64 ${repobase}/${vers}/fasttrack/

if [ $? -ne 0 ]; then
echo "ERROR getting fasttrack files from ${mirror} for ${vers} x64, quitting."
exit 1
fi
done
