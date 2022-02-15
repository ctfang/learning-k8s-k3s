#!/usr/bin/env bash
set -e

# Switch to directory where this shell script sits.
pushd `dirname $0` > /dev/null
CURRENT_SCRIPT_PATH=`pwd -P`
# Switch back to current directory.
popd > /dev/null

cd "${CURRENT_SCRIPT_PATH}/"

multipass launch --name master --cpus=2 --mem 4G --disk 5G
multipass launch --name n1 --mem 1G --disk 5G
multipass launch --name n2 --mem 1G --disk 5G

#multipass delete --purge master
#multipass delete --purge worker01
#multipass delete --purge worker02

multipass mount "${CURRENT_SCRIPT_PATH}/" master:/www
echo "虚拟机准本完成"