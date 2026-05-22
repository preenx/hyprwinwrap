# hyprwinwrap

Clone of xwinwrap for hyprland. Need hypr 0.54+.

## Installing
```
hyprpm add https://github.com/gen3vra/hyprwinwrap
hyprpm enable hyprwinwrap
```

## Features
- Run any program as a background, with the ability to set its position and size in percentage
- Use `hyprctl dispatch hyprwinwrap_interactivity` to toggle temporary focus. Calling it again or changing focus resets it to a background window

Example config:
```ini
plugin {
    #example: foot --app-id=window-bg -o colors.alpha=0.0 [path-to-script]
    #example: xterm -class window-bg [path-to-script]
    hyprwinwrap {
        # class is an EXACT match and NOT a regex!
        class = window-bg # use hyprctl clients to find the class of your window
        # you can also use title
        title = window-bg
        # you can add the position of the window in a percentage
        pos_x = 0
        pos_y = 0
        # you can add the size of the window in a percentage
        size_x = 100
        size_y = 97 # 100 would cover bottom waybar, 97 leaves space for it
    }
}

```
Example script for cava:

```sh
#!/bin/sh
sleep 1 && cava
```
_sleep required because resizing happens a few ms after open, which breaks cava_

## Notes
- Some programs check if they're hidden and may stop rendering, like kitty
- If you use an alt tab script make sure you skip `m_hidden` windows for it to work properly (eg: `previous_client="$(hyprctl clients -j | jq -r '[.[] | select(.workspace.id == '"$active_workspace"' and .hidden == false)] | sort_by(.focusHistoryID) | nth(1) | .address')"`)