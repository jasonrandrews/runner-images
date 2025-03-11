#!/bin/bash -e
################################################################################
##  File:  install-gcc-compilers.sh
##  Desc:  Install GNU C++ compilers
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/os.sh
source $HELPER_SCRIPTS/install.sh

versions=$(get_toolset_value '.gcc.versions[]')

for version in ${versions[*]}; do
    echo "Installing $version..."
    apt-get install $version
done

invoke_tests "Tools" "gcc"

if is_ubuntu22; then
    add-apt-repository ppa:ubuntu-toolchain-r/test -y
    apt update
    apt install gcc-13 g++-13 -y
fi
