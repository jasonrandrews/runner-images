#!/bin/bash -e
################################################################################
##  File:  install-sbt.sh
##  Desc:  Install sbt
################################################################################

source $HELPER_SCRIPTS/install.sh

# lower priority, not installing
exit 0

echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt

exit 0

# original install below has no arm64 suppport

# Install latest sbt release
download_url=$(resolve_github_release_asset_url "sbt/sbt" "endswith(\".tgz\")" "latest")
archive_path=$(download_with_retry "$download_url")
tar zxf "$archive_path" -C /usr/share
ln -s /usr/share/sbt/bin/sbt /usr/bin/sbt

invoke_tests "Tools" "Sbt"
