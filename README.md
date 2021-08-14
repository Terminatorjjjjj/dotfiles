# My Terminal Setting

* [My Terminal Setting](#my-terminal-setting)
   * [Issue](#issue)
   * [Common Git Command](#common-git-command)
   * [Create TOC](#create-toc)
   * [Notes](#notes)
      * [vim](#vim)
   * [References](#references)
      * [terminal](#terminal)
      * [vim](#vim-1)
      * [tmux](#tmux)
      * [markdown](#markdown)

## Issue
- [ ] cannot display vim statusline color in mac

## Common Git Command
```bash
git init
git remote add origin <git url>
git remote --global user.name <git user name>
git add .
git commit -m "<commit>"
git push [-u] origin master
git remote remove origin
```

## Create TOC
```bash
./gh-md-toc <markdown>
```

## Notes
### vim
+ ultisnips
   + vim w/ py3 support is required for ultisnips
   + a link to ultisnips/ftdetect is required under ./vim/ftdetect
+ supertab
   + in runtimepath, path to supertab must come before ultisnips

## References
### terminal
+ [macos terminal themes](https://github.com/lysyi3m/macos-terminal-themes)
+ [customize prompt](https://phoenixnap.com/kb/change-bash-prompt-linux)

### vim
+ [vimrc config full guide](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)
+ [vim in vscode](https://zhuanlan.zhihu.com/p/188499395)
+ [reference for colorschemes](https://colorswat.ch/vim/)
+ [statusline tutorial](https://medium.com/hackernoon/the-last-statusline-for-vim-a613048959b2)
+ [latex math snippet](https://castel.dev/post/lecture-notes-1/)
+ [systemverilog syntax highlight](https://www.vim.org/scripts/script.php?script_id=1573)

### tmux
+ [tmux intro](https://blog.hawkhost.com/2010/06/28/tmux-the-terminal-multiplexer/)

### markdown
+ [markdown on neo-vim](https://zhuanlan.zhihu.com/p/84773275)
+ [github markdown toc](https://github.com/ekalinin/github-markdown-toc)


