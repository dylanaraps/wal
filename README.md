# wal (WIP) (placeholder name)

`wal` is a script that takes an image (or a directory of images), generates a colorscheme (using `imagemagick`) and then changes all of your open terminal's colorschemes to the new colors on the fly. `wal` then caches each generated colorscheme so that cycling through wallpapers while changing colorschemes is instantaneous. `wal` finally merges the new colorscheme into the Xresources db so that any new terminal emulators you open use the new colorscheme.

`wal` can also change the colors in some other programs, check out the [Customization](#customization) section below.

[Album of examples (Warning large)](http://imgur.com/a/ttSOb)

![screen](http://i.imgur.com/4aLsvvW.png)


## Table of Contents

- **[Requirements](#requirements)**
    - [Dependencies](#dependencies)
    - [Terminal Emulator](#terminal-emulator)
- **[Setup](#setup)**
- **[Usage](#usage)**
- **[Customization](#customization)**
    - [i3](#i3)
    - [dunst](#dunst)
    - [vim](#vim)
    - [shell variables](#shell-variables)
    - [scss variables](#scss-variables)


## Requirements


### Dependencies

- `bash`
- `imagemagick`
    - Colorscheme generation
- `xfce`, `gnome`, `cinnamon`, `mate`
    - Desktop wallpaper setting.
- `feh`, `nitrogen`, `bgs`, `hsetroot`, `habak`
    - Universal wallpaper setting.
- `xprop`
    - Used to detect which DE wallpaper setter to use.
    - Only required if you're running a DE.


### Terminal Emulator

To use `wal` your terminal emulator must support a special type of escape sequence. The command below can be used as a test to see if `wal` will work with your setup.

Run the command below, does the background color of your terminal become red?

```sh
printf "%b" "\033]11;#ff0000\007"
```

If your terminal's background color is now red, your terminal will work with `wal`.


## Setup

The only setup that `wal` requires is a single line added to your shell rc file (`.bashrc`, `.zshrc` and etc). The line we're adding sets the colorscheme for any new terminal emulators you open.

This line is required because the escape sequences to change terminal colors don't save the theme for future use. Any new terminal windows you open won't be using the new colors unless this line is added to your shell rc file.

**URxvt and Xterm.**

`wal` will work out of the box.


**All other terminal emulators.**

Add this line to your shell startup file. (`.bashrc`, `.zshrc` and etc.)

```sh
# Import colorscheme from 'wal'
wal -r
```


## Usage

Run `wal` and point it to either a directory (`wal -i "path/to/dir"`) or an image (`wal -i "/path/to/img.jpg"`) and that's all. `wal` will change your wallpaper for you and also set your terminal colors.

**NOTE:** If you're running a terminal that is **not** URxvt or Xterm then look above at the line you must add to your shell rc file.

```sh
Usage: wal [OPTION] -i '/path/to/dir'
Example: wal -i '/home/dylan/Pictures/Wallpapers/'
         wal -i '/home/dylan/Pictures/1.jpg'

Flags:
  -c                      Delete all cached colorschemes.
  -h                      Display this help page.
  -i '/path/to/dir'       Which image to use.
     '/path/to/img.jpg'
  -q                      Quiet mode, don't print anything.
  -r                      Reload current colorscheme.
  -t                      Fix artifacts in VTE Terminals. (Termite, xfce4-terminal)

```


## Customization

See this personal script of mine that updates my lemonbar and startpage with the new colors.

https://github.com/dylanaraps/bin/blob/master/wal-set

**NOTE:** `wal` stores the exported files in `$HOME/.cache/wal/`


### i3

To use `wal` with i3 you have to make some modifications to your i3 config file.

i3 can read colors from `Xresources` into config variables! This allows us to change i3's colors dynamically. On run `wal` will detect that you're running i3 and reload your config for you. If you've set it up correctly i3 will then use your new colorscheme.

Example:

```sh
# Set colors from Xresources
# Change 'color7' and 'color2' to whatever colors you want i3 to use
# from the generated scheme.
# NOTE: The '#f0f0f0' in the lines below is the color i3 will use if
# it fails to get colors from Xresources for some reason.
set_from_resource $fg i3wm.color7 #f0f0f0
set_from_resource $bg i3wm.color2 #f0f0f0

# class                 border  backgr. text indicator child_border
client.focused          $bg     $bg     $fg  $bg       $bg
client.focused_inactive $bg     $bg     $fg  $bg       $bg
client.unfocused        $bg     $bg     $fg  $bg       $bg
client.urgent           $bg     $bg     $fg  $bg       $bg
client.placeholder      $bg     $bg     $fg  $bg       $bg

client.background       $bg

# PROTIP: You can also dynamically set dmenu's colors this way:
bindsym $mod+d exec dmenu_run -nb "$fg" -nf "$bg" -sb "$bg" -sf "$fg"
```


### dunst

`wal` will automatically detect you're running dunst and reload it using launch flags to change the colors.


### vim

Inside this repo there's a colorscheme I created for vim that uses your terminal colors. It was made to work with the colors `wal` generates and you can install it using any vim package manager.

Example:

```vim
! Using plug
Plug 'dylanaraps/wal'

colorscheme wal
```


### Shell Variables

`wal` also exports the colorscheme as a list of shell variables that you can source for use in scripts and the shell.

Example:

```sh
# Add this line to your .bashrc or a shell script.
source "$HOME/.cache/wal/colors.sh"

```

In the shell:

```sh
# Once the file is sourced you can use the colors like this:

dylan ~ >echo "$color0"
#282A23

dylan ~ >echo "$color0 $color5"
#282A23 #BCC3CE

# lemonbar example
lemonbar -B "$color7" -F "$color0"
```


### SCSS variables

`wal` also exports the colorscheme as SCSS variables for use in webpages. I'm using this feature to update my startpage with the new colors dynamically.

Example:

```scss
// Example .scss file

// Import Colors
@import '/home/dylan/.cache/wal/colors.scss';

body {
    background: $color0;
    color: $color7;
}
```
