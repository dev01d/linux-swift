#!/bin/bash
#
eval "$(cat /etc/lsb-release)"
SWIFT_PLATFORM=$(echo $DISTRIB_ID$DISTRIB_RELEASE | tr '[:upper:]' '[:lower:]' )
SWIFT_PLATFORM2=$(echo $SWIFT_PLATFORM | tr -d . )
SWIFT_VERSION=$(curl -s https://api.github.com/repos/apple/swift/releases/latest | grep -Po '"tag_name": *\K"[^"]*"' | tr -d \" | tr -d swift | tr '[:upper:]' '[:lower:]')
SWIFT_VERSION2="$(tr [a-z] [A-Z] <<< "$SWIFT_VERSION")"
#
##
#
echo -e "\n\e[1;25;32m Make a working dir  \e[0m"
rm -rf ./Swift || exit
mkdir $PWD/Swift

echo -e "\n\e[1;25;32m cd to said dir \e[0m"
cd $PWD/Swift || exit
echo $PWD

# Get latest Swift binary release
echo -e "\n\e[1;25;32m Get latest Swift binary release \e[0m"
eval wget https://swift.org/builds/swift"${SWIFT_VERSION}"/"${SWIFT_PLATFORM2}"/swift"${SWIFT_VERSION2}"/swift"${SWIFT_VERSION2}"-"${SWIFT_PLATFORM}".tar.gz

# Extract
echo -e "\n\e[1;25;32m Extract Swift binary \e[0m"
eval tar -xzvf swift"${SWIFT_VERSION2}"-"${SWIFT_PLATFORM}".tar.gz

# Move swift
echo -e "\n\e[1;25;32m Move swift to /usr/local/bin \e[0m"
sudo cp -vr $PWD/swift"${SWIFT_VERSION2}"-"${SWIFT_PLATFORM}" /usr/local/bin/swift

# Add to path
echo -e "\n\e[1;25;32m Add binary to PATH \e[0m"
if test -f $HOME/.bash_aliases; then
  echo "export PATH=/usr/local/bin/swift/usr/bin:"${PATH}"" >> $HOME/.bash_aliases
  source $HOME/.bash_aliases
else
  echo "export PATH=/usr/local/bin/swift/usr/bin:"${PATH}"" >> $HOME/.bashrc
  source $HOME/.bashrc
fi

echo -e "\n\e[1;25;32m Remove working dir ./Swift \e[0m"
cd ../ || exit
rm -rf ./Swift || exit

echo -e "\n\e[1;25;32m Swift version info \e[0m"
swift --version

echo -e "\n\e[1;25;32m Done \xE2\x9C\x94 \e[0m\n"