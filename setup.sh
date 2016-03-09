#!/bin/bash

# git config 
git config --global core.editor "vim"
git config --global push.default "current"
git config --global alias.st "status"
git config --global alias.d "diff"
git config --global alias.ds "diff --staged"

git config --global user.name "Voitek Musial"
git config --global user.email "wojciech.musial@gmail.com"


# initialize the git repo
cd ~/dotfiles
git submodule init
git submodule update

# symlink dotfiles
cd ~/
if [ -e ~/.vim ]; then
		read -r -p "~/.vim already exists. Replace? [y/N] " response
		case $response in
				[yY][eE][sS]|[yY]) 
						rm ~/.vim
						;;
		esac
fi
if [ -e ~/.vimrc ]; then
		read -r -p "~/.vimrc already exists. Replace? [y/N] " response
		case $response in
				[yY][eE][sS]|[yY]) 
						rm ~/.vimrc
						;;
		esac
fi
if [ -e ~/.tmux.conf ]; then
		read -r -p "~/.tmux.conf already exists. Replace? [y/N] " response
		case $response in
				[yY][eE][sS]|[yY]) 
						rm ~/.tmux.conf
						;;
		esac
fi
if [ -e ~/.git-completion.bash ]; then
		read -r -p "~/.git-completion.bash already exists. Replace? [y/N] " response
		case $response in
				[yY][eE][sS]|[yY]) 
						rm -- ~/.git-completion.bash
						;;
		esac
fi
if [ -e ~/.git-prompt.sh ]; then
		read -r -p "~/.git-prompt.sh already exists. Replace? [y/N] " response
		case $response in
				[yY][eE][sS]|[yY]) 
						rm -- ~/.git-prompt.sh
						;;
		esac
fi
if [ -e ~/.pythonrc.py ]; then
		read -r -p "~/.pythonrc.py already exists. Replace? [y/N] " response
		case $response in
				[yY][eE][sS]|[yY]) 
						rm ~/.pythonrc.py
						;;
		esac
fi

if [ ! -e ~/.vim ]; then
    ln -s ./dotfiles/vim ./.vim
fi
if [ ! -e ~/.vimrc ]; then
    ln -s ./dotfiles/vimrc ./.vimrc
fi
if [ ! -e ~/.tmux.conf ]; then
    ln -s ./dotfiles/tmux.conf ./.tmux.conf
fi
if [ ! -e ~/.git-completion.bash ]; then
    ln -s ./dotfiles/git/git-completion.bash ./.git-completion.bash
fi
if [ ! -e ~/.git-prompt.sh ]; then
    ln -s ./dotfiles/git/git-prompt.sh ./.git-prompt.sh
fi
if [ ! -e ~/.pythonrc.py ]; then
    ln -s ./dotfiles/pythonrc.py ./.pythonrc.py
fi

ln -s ./dotfiles/bash_dotfiles ./.bash_dotfiles


# source dotfiles in startup scripts
if [ -f ~/.bash_profile ] && (! grep -q "source ~/.bash_dotfiles" ~/.bash_profile); then
    echo '' >> ~/.bash_profile
    echo 'if [ -e ~/.bash_dotfiles ]; then' >> ~/.bash_profile
    echo '    source ~/.bash_dotfiles' >> ~/.bash_profile
    echo 'fi' >> ~/.bash_profile
fi

if [ -f ~/.bashrc ] && (! grep -q "source ~/.bash_dotfiles" ~/.bashrc); then
    echo '' >> ~/.bashrc
    echo 'if [ -e ~/.bash_dotfiles ]; then' >> ~/.bashrc
    echo '    source ~/.bash_dotfiles' >> ~/.bashrc
    echo 'fi' >> ~/.bashrc
fi
