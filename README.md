# wal (placeholder name)

`wal` is a script that takes an image (or a directory of images), generates a colorscheme (using `imagemagick`) and then changes all of your open terminal's colorschemes to the new colors on the fly.

`wal` then caches each generated colorscheme so that cycling through wallpapers while changing colorschemes is instantaneous.

`wal` finally merges the new colorscheme into the Xresources db so that any new terminal emulators you open use the new colorscheme.


## Table of Contents

- **[Requirements](#requirements)**
    - [Dependencies](#dependencies)
    - [Terminal Emulator](#terminal-emulator)
    - [i3](#i3)
    - [dunst](#dunst)
    - [vim](#vim)


## Requirements


### Dependencies

- `bash`
- Colorscheme Generation: `imagemagick`
- Wallpaper Setting: `feh`, `nitrogen` or `gsettings`.
- Desktop Environment: `xprop`
    - This is used to detect the correct wallpaper setter.


### Terminal Emulator

**Recommended:** `URxvt` or `Xterm`.

- Colors must be set through `.Xresources`.
- Must support these escape sequences: `\033]11;#ff0000\007`
    - Test: Does `printf "%b" "\033]11;#ff0000\007"` set your terminal background red?


### i3

To use `wal` with i3 you have to make some modifications to your i3 config file.

i3 can read colors from `Xresources` into config variables! This allows us to change i3's colors dynamically. On run `wal` will detect that you're running i3 and reload your config for you. If you've set it up correctly i3 will then use your new colorscheme.

Example:

```sh
# Set colors from Xresources
# Change 'color7' and 'color2' to whatever colors you want i3 to use
# from the generated scheme.
set_from_resource $fg i3wm.color7 #f0f0f0
set_from_resource $bg i3wm.color2 #f0f0f0

# class                 border  backgr. text indicator child_border
client.focused          $bg     $bg     $fg  $bg       $bg
client.focused_inactive $bg     $bg     $fg  $bg       $bg
client.unfocused        $bg     $bg     $fg  $bg       $bg
client.urgent           $bg     $bg     $fg  $bg       $bg
client.placeholder      $bg     $bg     $fg  $bg       $bg

client.background       $bg
```


### dunst

`wal` will automatically detect you're running dunst and reload it using launch flags to change the colors.


### vim

Inside this repo there's a colorscheme I created for vim that uses your terminal colors. It was made to work with the colors `wal` generates and you can install it using any vim package manager.

Example:

```vim
# Using plug
Plug 'dylanaraps/wal'

colorscheme wal
```
