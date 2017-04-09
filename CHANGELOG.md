## 10 April

- Added `-n` to skip wallpaper setting. @hallgat89

## 6 April

- Fixed `wal -o` and unicode characters.
- Fixed error when `-o` was empty.

## 2 April

- Rewrite `wal2iterm` script.
    - Theme output is correct now.
    - We now also generate Foreground, Background, Cursor and Selection colors.

## 12 March

- `wal` no longer errors/exits when a palette isn't found. Instead `wal` will loop trying larger palette sizes until it finds a suitable 16 colors. Wallpapers that didn't work previously will now work just fine.

## 11 March

- Added transparency support for Rofi using `-a`.
- Supressed error when `xprop` wasn't installed.
- Supressed error that occurs only on first run.

## 9 March

- Added script to export colors as iTerm2 colorscheme. @joethecodhr
- Added a color file that just contains plain hex values for the colors.

## 28 January

- Added `-a` flag to set terminal transparency. (Only works with URxvt)

## 19 January

- Fixed issue with `wal` file not being created.
- Fixed issue when `wal` was given a symlink as an argument.


**NOTE:** Users should change `wal -r` to `(wal -r &)` in their shellrc file to stop slowdown.


## 18 January

- wal now properly canonicalizes image paths.


## 15 January

- Fixed issues with directory shuffle.
