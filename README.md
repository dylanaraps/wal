# wal (placeholder name)

`wal` is a script that takes an image (or a directory of images), generates a colorscheme (using `imagemagick`) and then changes all of your open terminal's colorschemes to the new colors on the fly.

`wal` then caches each colorscheme so that cycling through wallpapers while changing colorschemes is instantaneous.

`wal` finally merges the new colorscheme into the Xresources db so that any new terminal emulators you open use the new colorscheme.


## Requirements

#### Terminal Emulator

**Recommended:** `URxvt` or `Xterm`.

- Colors must be set through `.Xresources`.
- Must support these escape sequences: `\033]11;#ff0000\007`
    - Test: Does `printf "%b" "\033]11;#ff0000\007"` set your terminal background red?


#### Dependencies

- `bash`
- Colorscheme Generation: `imagemagick`
- Wallpaper Setting: `feh`, `nitrogen` or `gsettings`.


## Generate colorschemes for all images in a directory.

```sh
for img in "/path/to/dir"*; do
   wal -i "$img"
done
```
