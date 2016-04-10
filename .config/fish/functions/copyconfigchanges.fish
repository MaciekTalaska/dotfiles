function copyconfigchanges
	pushd
    rsync -avR .config/fish/functions/ ~/projects/dotfiles/
    rsync -avR .config/fish/config.fish ~/projects/dotfiles/
    rsync -avR .config/fish/fishd.xps ~/projects/dotfiles/
    rsync -avR .config/fisherman/fishfile ~/projects/dotfiles/
    cp ~/.conkyrc ~/projects/dotfiles/.conkyrc
    cp ~/.vimrc ~/projects/dotfiles/.vimrc
    cp ~/.tmux.conf ~/projects/dotfiles/.tmux.conf
    cp ~/.bashrc ~/projects/dotfiles/.bashrc
    cp ~/.bash_profile ~/projects/dotfiles/.bash_profile
    cp ~/.bash_aliases ~/projects/dotfiles/.bash_aliases
    cp ~/.zshrc ~/projects/dotfiles/.zshrc
    popd
end
