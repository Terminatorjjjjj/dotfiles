# Useful Tips

## Git
```bash
git init
git remote add origin htttps://<TOKEN>@github.com/<USERNAME>/<REPO>.git
git remote --global user.name <USERNAME>
git add .
git commit -m "<COMMIT>"
git push [-u] origin master
git remote remove origin
git checkout [-b] <BRANCH> // -b to create before checkout
```

## Vim
#### Movement
+ `<C-o>` goes up/preivous in jump list, while `<C-i>` goes down/next

#### Search
+ `*` grabs the word under the cursor and search for the next one
+ `args *.sv` to add all files under directory into buffer list, then `argdo %s/<SEARCH>/<REPLACE>/g | update` to perform some command/macro into all the files.
+ `gf` edit the file whose name is under the cursor

#### Select
+ `gv` selects last selected region in visual mode

#### Editing
+ `C` delete from cursor to end of line, and enter insert mode
+ `yiw` yank a word under the cursor
+ `J` join current line w/ next line
+ `xp` transpose two letters (delete and paste)
+ `==` to indent line to match paragraph
+ `<C-a>` increases the selected number, while `<C-x>` decreases it
+ `.` to repeat last change, including inserting, deleting or replaceing text

#### Window
+ `<C-w> r` to swap/rotate postition of the splits

#### Terminal
+ `:ter` to open terminal in vim for quick shell access

## Tmux
+ `<C-b> ,` rename window
+ `<C-b> n` switch to next window
+ `<C-b> o` switch to next pane

+ `tmux kill-server` to restart tmux after modifying some setting

<!-- vim:wrap:
