# Current NEOVIM config

## Setup on MAC

Install neovim:\
```brew install neovim```

Install node:\
```brew install node```

Install yarn:\
```pm install -g yarn```

Install vim-plug:\
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Clone Repository into ~/.config/nvim:\
```git clone git@github.com:LeonWandruschka/nvim-config.git  ~/.config/nvim```


Now open neovim and execute ```:PlugInstall```

Exit vim and move to the nvim/plugged/coc folder:\
```cd ~/.local/share/nvim/plugged/coc.nvim/```

In this folder execute ```yarn install```

Now open neovim again:\
```nvim ~/.config/nvim/init.vim```

After opening neovim execute ```:CocInstall coc-clangd``` and\
right afterwards execute ```:CocCommand clangd.install```


