# My Configuration

This is a repository for my configuration.
I aim to only have to execute 1 script to have my system configured as I like it. I use dvorak so a lot of my keybindings will seem weird to you, so I advice you to not use my config, switch to dvorak or reconfigure it.

## Software used

- i3wm (Window Manager)
- i3lock (Lock system)
- dmenu (Appilcation Menu)
- PolyBar (Status Bar)
- Flameshot (Snipping Tool)
- PulseAudio (Audio)

## Monitors

1. 144hz 2560x1080 Center
2. 60hz 1920x1080 Left

## Font

I use the [Sudo](https://www.kutilek.de/sudo-font/) font which you will need to download manually. 

## Use Configuration

1. make sure you have installed all applications necessairy.
2. clone this repository.
3. execute the ```install.sh``` script.

## i3 Window Manager

I use the tiling window manager [i3](https://i3wm.org/).
For the application menu I use dmenu.

**Keybindings**

Modkey (mod) is the Windowskey.

| Keybinding | Action |
| ---------- | ------ |
| mod return | open simple terminal |
| mod d | open dmenu |
| mod shift q | kill application in focus |
| mod arrow_keys | change focus in the according direction |
| mod shift arrow_keys | move in according direction |
| mod v | vertical splitting |
| mod z | horizontal splitting |
| mod s | stacking layout |
| mod w | tabbed layout |
| mod e | toggle layout |
| mod shift space | toggle floating |
| mod space | change toggle between floating and tiling windows |
| mod shift x | lock system |
| mod print | open flameshot |


| **mod r** | **enter resize mode** |
| ---- | ---------- |
| o | shrink width 10 |
| e | grow width 10 |
| e | shrink height 10 |
| Period | grow height 10 |
| h | move left 20 |
| n | move right 20 |
| t | move 20 down |
| c | move 20 up |
| return | exit resize mode |
| escape | exit resize mode |
| mod r | escape resize mode |