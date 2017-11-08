#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
#sudo apt-get install neovim golang
#sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
#sudo update-alternatives --set vi /usr/bin/nvim
#sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
#sudo update-alternatives --set vim /usr/bin/nvim
#sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
#sudo update-alternatives --set editor /usr/bin/nvim
sudo apt install rpl
GOPATH=~/gocade
export GOPATH=$HOME/gocade
go get -d github.com/pocke/lemonade
cd $GOPATH/src/github.com/pocke/lemonade/
make install
ln -s /usr/bin/nvim /usr/local/bin/vim
