# My Terminal Setting

* [My Terminal Setting](#my-terminal-setting)
   * [TODO](#todo)
   * [Git](#git)
      * [common git command](#common-git-command)
   * [Terminal](#terminal)
      * [references](#references)
   * [Vim](#vim)
      * [plugins](#plugins)
      * [references](#references-1)
   * [Tmux](#tmux)
      * [references](#references-2)
   * [Mardown](#mardown)
      * [create TOC](#create-toc)
      * [references](#references-3)

## TODO
- [ ] cannot display vim statusline color in mac

## Git
### common git command
```bash
git init
git remote add origin htttps://<TOKEN>@github.com/<USERNAME>/<REPO>.git
git remote --global user.name <git user name>
git add .
git commit -m "<commit>"
git push [-u] origin master
git remote remove origin
```

## Terminal
### references
+ [macos terminal themes](https://github.com/lysyi3m/macos-terminal-themes)
+ [customize prompt](https://phoenixnap.com/kb/change-bash-prompt-linux)

## Vim
### plugins
+ ultisnips
   + vim w/ py3 support is required
   + a link to ultisnips/ftdetect is required under ./vim/ftdetect
+ supertab
   + in runtimepath, path to supertab must come before ultisnips (line in below in vimrc)

### references
+ [vimrc config guide](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)
+ [vim in vscode](https://zhuanlan.zhihu.com/p/188499395)
+ [colorschemes](https://colorswat.ch/vim/)
+ [statusline guide](https://medium.com/hackernoon/the-last-statusline-for-vim-a613048959b2)
+ [latex math snippet](https://castel.dev/post/lecture-notes-1/)
+ [systemverilog syntax highlight](https://www.vim.org/scripts/script.php?script_id=1573)
+ [netrw guide](https://shapeshed.com/vim-netrw/)

## Tmux
### references
+ [tmux intro](https://blog.hawkhost.com/2010/06/28/tmux-the-terminal-multiplexer/)

## Mardown
### create TOC
```bash
./gh-md-toc <markdown>
```

### references
+ [markdown on neo-vim](https://zhuanlan.zhihu.com/p/84773275)
+ [github markdown toc](https://github.com/ekalinin/github-markdown-toc)


