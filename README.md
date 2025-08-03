**Inspired by the famous MIT course: [The Missing Semester of Your CS Education](https://missing.csail.mit.edu)**

## 快捷键速查表

| 快捷键               | 功能                              | 应用    |
| -------------       | -------------------------------- | ------- |
| <Alt + arrow>       | switch between windows           | zellij  |
| <Shift+1>           | cursor                           | raycast |
| <Shift+2>           | iTerm2                           | raycast |
| <Shift+3>           | safari                           | raycast |
| <Shift+0>           | system settings                  | raycast |
| <Ctrl+Alt+←>        | left half window                 | raycast |
| <Ctrl+Alt+→>        | right half window                | raycast |
| <Ctrl+Alt+Enter>    | maximum window                   | raycast |
| <Alt+v>             | toggle sidebar                   | vs code |
| <Alt+b>             | toggle 2nd sidebar               | vs code |
| <Alt+n>             | toggle terminal                  | vs code |
| <space+w,s>         | save                             | vs code |
| <space+h>           | clear search highlighting        | vs code |
| <space+f>           | quick open                       | vs code |
| <space+q>           | quick quit                       | vs code |
| <space+m>           | mark the current position        | vs code |
| <space+j>           | jump back to the marked position | vs code |
| <Ctrl+R>            | fzf search command history       | zsh     | 

## 终端优化：iterm2

在 macOS 环境下，第一件事就是要替换掉原生的 terminal。因为 Apple 原生的 terminal 不支持 true-color，导致 neovim 的主题显示异常。具体可以参考 reddit 上的[讨论](https://www.reddit.com/r/neovim/comments/zq6d53/how_to_fix_colorschemes_in_mac_terminal/)

推荐安装 iterm2 作为默认的 terminal，具体配置如下：

- color preset 推荐使用[iterm2-snazzy](https://github.com/sindresorhus/iterm2-snazzy?tab=readme-ov-file)
- 字体推荐使用 [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

安装 oh-my-zsh，具体可以参考[oh-my-zsh 的文档](https://ohmyz.sh/#install)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### install solarized theme for vim

[solarized theme](https://github.com/altercation/vim-colors-solarized)

### install zsh plugins

1. install zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. install zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

3. install zsh-history-substring-search

```bash
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

4. install zsh-completions

```bash
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

5. install zsh-vi-mode

```bash
git clone https://github.com/jeffreytse/zsh-vi-mode.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
```

## 安装编程开发环境

因为是非常流行的工具，推荐直接根据官方的安装脚本安装，非常方便。

1. 安装 [rust](https://www.rust-lang.org/tools/install) 开发环境
2. 安装 [uv](https://docs.astral.sh/uv/getting-started/installation/) 开发环境：uv 是更加现代化的 python 的包和虚拟环境管理工具，可以替代 pip、venv、conda 等工具。
3. 安装 [node](https://nodejs.org/en/download) 开发环境

## 增强工具

### [fzf](https://github.com/junegunn/fzf)

```bash
# isntall from git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# verify
fzf --version
```

### [zoxide](https://github.com/ajeetdsouza/zoxide)

zoxide 是增强版的 cd，可以根据历史记录自动推荐路径，并且支持交互式选择，无需输入完整路径就能快速跳转。

```bash
# install
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# add to .zshrc if needed
export PATH="$HOME/.local/bin:$PATH"

# verify
zoxide --version

# setup, add to .zshrc
eval "$(zoxide init zsh)"

# common usage
z foo              # cd into highest ranked directory matching foo
z foo bar          # cd into highest ranked directory matching foo and bar
z foo /            # cd into a subdirectory starting with foo

z ~/foo            # z also works like a regular cd command
z foo/             # cd into relative path
z ..               # cd one level up
z -                # cd into previous directory

zi foo             # cd with interactive selection (using fzf)

z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
```

### [bat](https://github.com/sharkdp/bat)

bat 是 cat 的增强版，支持语法高亮。

```bash
# install
cargo install bat --locked

# verify
bat --version
```

### [eza](https://github.com/eza-community/eza)

eza 是 ls 的增强版，支持语法高亮。

```bash
# install from cargo, if you already have a Rust environment set up
# Cargo will build the eza binary and place it in $HOME/.cargo/bin
cargo install eza

# verify
eza --version
```

### [tldr](https://github.com/tldr-pages/tldr)

tldr 是简化版的 man 命令，提供更简洁的命令使用说明。

```bash
# install
cargo install tldc --locked

# verify
tldr --version
```

### [ripgrep](https://github.com/BurntSushi/ripgrep)

ripgrep 是增强版的 grep，支持正则表达式，并且支持递归搜索。

```bash
# install
cargo install ripgrep

# verify
rg --version
```

## 窗口管理器 1：zellij

zellij 是增强版的 tmux，支持多窗口管理和项目编辑，并且可以通过 cargo 安装，非常方便。

```bash
# install
cargo install zellij

# verify
zellij --version
```

zellij 在 lock 模式下可以方便的进行复制粘贴，非常方便。

zellij 默认支持 tmux 的快捷键，默认的前缀是<Ctrl+B>，可以修改为<Ctrl+A>。

zellij 的配置文件是 `~/.config/zellij/config.kdl`，可以参考[zellij 的文档](https://zellij.dev/documentation/configuration/layout/)。

```kdl
shared_except "locked" "scroll" "search" "tmux" {
    bind "Ctrl a" { SwitchToMode "tmux"; }
}

bind "-" { NewPane "down"; SwitchToMode "normal"; }
bind "|" { NewPane "right"; SwitchToMode "normal"; }
```

zellij 的另一大功能是支持自定义 layout，可以参考[zellij 的文档](https://zellij.dev/documentation/configuration/layout/)。

## 窗口管理器 2：tmux [deprecated, please use zellij]

用于多窗口管理和项目编辑的临时保存，[tmux 的官方文档](https://github.com/tmux/tmux)。

不使用 HomeBrew 从源代码安装 tmux，具体步骤如下：

1. 从官网下载相关的依赖包：tmux-3.5, libevent-2.1.12-stable, ncurses-6.5, opensll-3.5.1
2. 安装依赖包和 tmux

```bash
tar -xzf openssl-3.5.1.tar.gz
cd openssl-3.5.1
./config --prefix=/usr/local --openssldir=/usr/local/openssl
make
sudo make install

tar -xzf libevent-2.1.12-stable.tar
cd libevent-2.1.12-stable
export PKG_CONFIG_PATH=/usr/local/openssl/lib/pkgconfig
export CFLAGS="-I/usr/local/openssl/include -I/usr/local/include"
export LDFLAGS="-L/usr/local/openssl/lib -L/usr/local/lib"
./configure --prefix=/usr/local
make
sudo make install

tar -xzf ncurses-6.5.tar.gz
cd ncurses-6.5
./configure --prefix=/usr/local
make
sudo make install

tar -xzf tmux-3.5.tar.gz
cd tmux-3.5
./configure --prefix=/usr/local --disable-utf8proc
make
sudo make install

# verify
tmux -V
```

3. 安装 [tmux-sessionizer](https://github.com/ThePrimeagen/tmux-sessionizer) 脚本，完成之后日常可以使用<ctrl-f>来快速打开 projects 文件夹内的文件，非常实用。

## 编辑器 1：neovim

**neovim 作为首选编辑器，主要用于编写代码和纯英文相关的技术文档。**

### install nvim

```bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz
mv nvim-macos-arm64/bin/nvim ~/.local/bin
sudo mv nvim-macos-arm64/share/nvim /usr/local/share/nvim
```

### create init.lua and config

fork TJ 的 kickstart 项目，通过`~/.config/nvim/init.lua`对 neovim 进行配置，为了不和原始的主分支发生冲突，并且方便后续更新主分支，自己的配置在 my-config 分支上进行修改。

```bash
cd ~/.config
git clone https://github.com/evan4C/kickstart.nvim.git nvim
```

参考 ThePrimeagen 的 neovim 系列视频，练习 neovim 的快捷键。

## 编辑器 2: vs code

**vs code 主要用来写博客，和 review 一些比较复杂的项目。**

vs code 的一些有用的插件

- 好看的主题：vesper，非常高级和漂亮的黑色主题
- 代码截图：code snap，为代码块生成漂亮的截图
- 图标美化：material icon sheme，为不同类型的文件添加好看的图标

## 工具箱：Raycast

Raycast 相当于 apple 自带的 spotlight 的全面升级版，提供了很多实用的小功能，目前最常用的是对每个应用设置快捷键，直接从键盘打开相应的应用，不需要再使用鼠标。
