# Current NEOVIM config

- [Current NEOVIM config](#current-neovim-config)
  - [Setup macOS](#setup-macos)
  - [Setup Ubuntu](#setup-ubuntu)
    - [Setup Console (optional)](#setup-console-optional)
  - [Keybindings and Useful Commands](#keybindings-and-useful-commands)
    - [Navigation](#navigation)
    - [Moving Around in Insert and Command Line Mode](#moving-around-in-insert-and-command-line-mode)
    - [Working with Splits](#working-with-splits)
    - [Additional Commands](#additional-commands)
    - [Terminal Functionality](#terminal-functionality)
    - [File and Tag Management](#file-and-tag-management)
    - [Search Files](#search-files)

## Setup macOS

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
sudo apt update && sudo apt upgrade -y
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

Set Terminal -> preferences to custom font and choose MelsoGS NF


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

Close Terminal!

Now set a custom command in the terminal Preferences to call ```zsh```

Reopen Terminal and follow powerlevel10k config.


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

Use two times after each other ```:q``` to quit neovim ;)

Goto: ```cd ~/.local/share/nvim/plugged/coc.nvim/```
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

## Keybindings and Useful Commands

### Navigation

- **Up:** `k`
- **Down:** `j`
- **Left:** `h`
- **Right:** `l`
- **Move around in splits:** `Ctrl + w, < h | j | k | l >`
- **Move splits around:** `Ctrl + w, Shift + < h | j | k | l >`
- **Resize splits:** `Ctrl + w, < + | - | < | > >`

### Moving Around in Insert and Command Line Mode

- **Move Down:** `Ctrl + j`
- **Move Up:** `Ctrl + k`
- **Move Left:** `Ctrl + h`
- **Move Right:** `Ctrl + l`
- **Delete:** `Ctrl + d`

### Working with Splits

- **Move around in splits:** `Ctrl + w, < h | j | k | l >`
- **Move splits around:** `Ctrl + w, Shift + < h | j | k | l >`
- **Resize splits:** `Ctrl + w, < + | - | < | > >`

### Additional Commands

- **Open man page:** `:Man <function>`
- If GDB is installed, you can use:
  - `:packadd termdebug`
  - `:Termdebug <gdb-arguments>`
- **Open/close file tree:** `Ctrl + b` *(Updated: Toggle with `NvimTreeToggle`)*
- **Set focus on file tree:** `Ctrl + f` *(Updated: Focus with `NvimTreeFocus`)*
- If Exuberant Ctags is installed:
  - `Ctrl + t` *(Updated: Toggle with `TagbarToggle`)*
- **Open terminal on the bottom:** `Alt + t` *(Updated: Toggle with a custom height of 5 lines)*

### Terminal Functionality

- **Toggle terminal:** `Alt + t` *(Enhanced to toggle on/off with custom height)*
- **Exit terminal mode:** `Esc` *(For moving back to normal mode in terminal)*
- **Force quit:** `:q!` *(Within terminal mode)*

### File and Tag Management

- **Toggle file tree:** `Ctrl + b` *(Updated to use `NvimTreeToggle` for both insert and normal modes)*
- **Focus on file tree:** `Ctrl + f` *(Updated to use `NvimTreeFocus` for both insert and normal modes)*
- **Toggle tag bar:** `Ctrl + t` *(Updated to use `TagbarToggle` for both insert and normal modes)*

### Search Files

- **Search files:** `Ctrl + p` *(Mapped to trigger `:Files` command)*

