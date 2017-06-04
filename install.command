#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd DIR

# check to make sure hombrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Updating Homebrew..."
    brew update
fi

#tap the caskroom
brew tap caskroom/cask 

#check if xquartz is intalled
brew cask install xquartz

#check if virtualbox is intalled
brew cask install virtualbox

#check if docker is intalled
brew install docker

#check if docker-machine is intalled
brew install docker-machine


echo "Creating docker vm"
docker-machine create browser

docker-machine start browser
eval $(docker-machine env browser)

echo "Install successful."
echo "[+] Log out and log back in and run the browser.sh script."