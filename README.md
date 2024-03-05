# Current NEOVIM config

## Setup on MAC

Install neovim:\
```brew install neovim```

Install node:\
```brew install node```

Install yarn:\
```pm install -g yarn```

Install vim-plug:
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Clone Repository into ~/.config/nvim:\
```git clone https://github.com/LeonWandruschka/nvim-config.git ~/.config/nvim/```


Now open neovim and execute ```:PlugInstall```

Exit vim and move to the nvim/plugged/coc folder:\
```cd ~/.local/share/nvim/plugged/coc.nvim/```

In this folder execute ```yarn install```

Now open neovim again:\
```nvim ~/.config/nvim/init.vim```

After opening neovim execute ```:CocInstall coc-clangd``` and\
right afterwards execute ```:CocCommand clangd.install```




## Setup Ubuntu

Update System

```zsh
sudo apt update && sudo apt ugrade -y
```

Install Git and vim

```zsh
sudo apt install git -y && sudo apt install vim -y
```

**Install other dependencies**

Nodejs

```zsh
sudo apt install nodejs -y && sudo apt install npm -y && sudo npm install -g n
```

```zsh
sudo n latest && sudo npm install -g npm-check-updates
```

Clangd | Python3 | exuberant-ctags

```zsh
sudo apt install clangd -y && sudo apt install python3 -y && sudo apt install exuberant-ctags -y
```

Install latest neovim using snap

```zsh
sudo snap install --beta nvim --classic
```

Install [FONT](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k)

### Setup Console (optional)

Install zsh

```zsh
sudo apt install zsh -y
```

Install ohmyzsh

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Powerlevel10k (ohmyzsh configuration)

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set the ZSH theme to powerlevel10k!

ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc

**Back to neovim**

Install vimplug (packagemanager)

```zsh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Clone current config

```zsh
git clone https://github.com/LeonWandruschka/nvim-config.git ~/.config/nvim/
```

Open nvim and press ENTER on upcoming warnings!

Enter ```:PlugInstall``` and wait till all plugins are isntalled

Goto: ```~/.local/share/nvim/plugged/coc.nvim/```
and use ```sudo npm ci``` to build (can take a while)

Now neovim is setup!


Additional programs that are nice:
lazy git:
```zsh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```
