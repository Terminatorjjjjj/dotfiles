# Useful Tips

## Linux

+ `<c-w>` delete word left
+ `<c-e>` go to end of command line
+ `<c-u>` clear whole line
+ `<c-p>` previous command
+ `<c-n>` next command

## Git

#### Basics
```sh
git init
git remote add <REMOTE> https://<TOKEN>@github.com/<USERNAME>/<REPO>.git
git remote --global user.name <USERNAME>
git add .
git commit -m "<COMMIT>"
git push [-u] origin master
git remote remove origin
```

#### Branch
```sh
git checkout [-b] <BRANCH>  # -b to create before checkout
git merge <SRC BRANCH>      # checkout to branch that want to merge others first
git push <REMOTE> :<BRANCH> # colon to remove remote brnch
git remote show <REMOTE>
git remote prune <REMOTE>
git remote update -p        # sync and remove all outdated branches
git branch -u master        # link branch to master as upstream
```

#### Stash
```sh
git stash
git stash save -u "<COMMIT>"
git stash list
git stash pop [STASH]       # pop stash@{smallest id} by default
git stash clear
```

## Vim

#### Movement
+ `<c-o>` goes up/preivous in jump list, while `<c-i>` goes down/next (jk does not count as jumps)
+ `<c-e>` to scroll down without moving the cursor, `<c-y>` to scroll up
+ `g;` goes to previous in change list, `g,` to go to next
+ `gf` edit the file whose name is under the cursor
+ `gd` go to declaration of word under cursor, same effect as `[[`
+ `%` to go to the matching parenthesis under the cursor

#### Search/Replace
+ `*` grabs the word under the cursor and search for the next one
+ `args *.sv` to add all files under directory into buffer list, then `argdo %s/<SEARCH>/<REPLACE>/g | update` to perform some command/macro into all the files

#### Select
+ `gv` selects last selected region in visual mode

#### Editing
+ `C` delete from cursor to end of line, and enter insert mode
+ `yiw` yank a word under the cursor
+ `yi)` yank a everything inside parenthesis, more variation in usage like `vi]` or `ci}`; alternative `ya)` will include the parenthesis
+ `J` join current line w/ next line
+ `xp` transpose two letters (delete and paste)
+ `==` to indent line to match paragraph
+ `<c-a>` increases the selected number, while `<c-x>` decreases it; add a number before pressing increase/decrease by that amount; in visual mode, add `g` before to increase/decrease over line
+ `.` to repeat last change, including inserting, deleting or replaceing text
+ `&` to repeat last normal mode command
+ `<c-o>` in insert mode will jump to normal mode and execute one command

#### Fold
+ `za` to toggle fold
+ `zM` to close all folds
+ `zR` to open all folds
+ `zf{motion}` to create fold (manual or marker) on selected region
+ `zd` to remove fold
+ `zj` to move to next fold
+ `zk` to move to previous fold

#### Window
+ `<c-w> r` to swap/rotate postition of the splits
+ `<c-w> o` to close all other splits

#### Command Line Window
+ `q:` opens normal command history, can be edited as normal file
+ `q/` and `q?` open search history
+ `<c-r><c-w>` copy to word under the buffer's cursor to command line
+ `<c-r><c-a>` copy to WORD under the buffer's cursor to command line

#### Misc
+ `:ter` to open terminal in vim for quick shell access
+ `:so $VIMRUNTIME/syntax/hitest.vim` to check all the highlight group examples for current colorscheme
+ `r! <shell cmd>` to add command results into current buffer

#### Plugin: Fugitive
+ `:G` to show git status
   + move to file then `s` to stage and `u` to unstage
   + `cc` to create commit
+ `Git commit` to open commit window
+ `Git push` to push to remote
+ `Git diff` to open conflicted file on 3-way diff

#### Plugin: CtrlP
+ `<c-d>` search by filename only
+ `<c-f>` cycle between modes (file, buf, mru)
+ `<c-j>` navigate down the list
+ `<c-k>` navigate up the list
+ `<c-v>` open in vertical split
+ `<c-x>` open in horizontal split

#### Plugin: Unimpaired
+ `[<space>` insert empty line above
+ `]<space>` insert empty line below
+ `[b` go to previous buffer
+ `]b` go to next buffer
+ `[q` go up in quickfix list
+ `]q` go down in quickfix list


## Tmux
+ `<c-b> ,` rename window
+ `<c-b> n` switch to next window
+ `<c-b> l` switch to last window
+ `<c-b> o` switch to next pane

+ `tmux kill-server` to restart tmux after modifying some setting

