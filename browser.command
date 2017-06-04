DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
docker-machine start browser
eval $(docker-machine env browser)
source bash_profile.txt
dockerchrome