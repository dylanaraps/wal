# wal (placeholder name)

`wal` is a script that takes an image (or a directory of images), generates a colorscheme (using `imagemagick`) and then changes all of your open terminal's colorschemes to the new colors on the fly.

`wal` then caches each colorscheme so that cycling through wallpapers while changing colorschemes is instantaneous.

`wal` finally merges the new colorscheme into the Xresources db so that any new terminal emulators you open use the new colorscheme.


## Requirements


### Dependencies

- `bash`
- Colorscheme Generation: `imagemagick`
- Wallpaper Setting: `feh`, `nitrogen` or `gsettings`.


### Terminal Emulator

**Recommended:** `URxvt` or `Xterm`.

- Colors must be set through `.Xresources`.
- Must support these escape sequences: `\033]11;#ff0000\007`
    - Test: Does `printf "%b" "\033]11;#ff0000\007"` set your terminal background red?


### i3

To use `wal` with i3 you have to make some modifications to your i3 config file.

i3 can read colors from `Xresources` into config variables! This allows us to change i3's colors dynamically. `wal` will then detect that you're running i3 and reload your config for you. If you've set it up correctly i3 will then use your new colorscheme.

Example:

```sh
# Set colors from Xresources
set_from_resource $fg i3wm.color7 #f0f0f0
set_from_resource $bg i3wm.color2 #f0f0f0

# class                 bor bg  fg  ind   child_border
client.focused          $bg $bg $fg $bg   $bg
client.focused_inactive $bg $bg $fg $bg   $bg
client.unfocused        $bg $bg $fg $bg   $bg
client.urgent           $bg $bg $fg $bg   $bg
client.placeholder      $bg $bg $fg $bg   $bg

client.background       $bg
```


### dunst

`wal` will automatically detect you're running dunst and reload it using launch flags to change the colors.
