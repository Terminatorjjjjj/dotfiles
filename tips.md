# Useful Tips

## Git
#### Basics
```bash
git init
git remote add <REMOTE> https://<TOKEN>@github.com/<USERNAME>/<REPO>.git
git remote --global user.name <USERNAME>
git add .
git commit -m "<COMMIT>"
git push [-u] origin master
git remote remove origin
```

#### Branch
```bash
git checkout [-b] <BRANCH> # -b to create before checkout
git push <REMOTE> :<BRANCH> # colon to remove remote brnch
git remote show <REMOTE>
git remote prune <REMOTE>
git remote update -p # sync and remote all outdated branches
```

## Vim
#### Movement
+ `<C-o>` goes up/preivous in jump list, while `<C-i>` goes down/next (jk does not count as jumps)
+ `g;` goes to previous in change list, `g,` to go to next

#### Search/Replace
+ `*` grabs the word under the cursor and search for the next one
+ `args *.sv` to add all files under directory into buffer list, then `argdo %s/<SEARCH>/<REPLACE>/g | update` to perform some command/macro into all the files
+ `gf` edit the file whose name is under the cursor

#### Select
+ `gv` selects last selected region in visual mode

#### Editing
+ `C` delete from cursor to end of line, and enter insert mode
+ `yiw` yank a word under the cursor
+ `yi)` yank a everything inside parenthesis, more variation in usage like `vi]` or `ci}`; alternative `ya)` will include the parenthesis
+ `J` join current line w/ next line
+ `xp` transpose two letters (delete and paste)
+ `==` to indent line to match paragraph
+ `<C-a>` increases the selected number, while `<C-x>` decreases it
+ `.` to repeat last change, including inserting, deleting or replaceing text
+ `&` to repeat last normal mode command

#### Window
+ `<C-w> r` to swap/rotate postition of the splits

#### Command Line Window
+ `q:` opens normal command history, can be edited as normal file
+ `q/` and `q?` open search history

#### Terminal
+ `:ter` to open terminal in vim for quick shell access

## Tmux
+ `<C-b> ,` rename window
+ `<C-b> n` switch to next window
+ `<C-b> o` switch to next pane

+ `tmux kill-server` to restart tmux after modifying some setting

<!-- vim:wrap: