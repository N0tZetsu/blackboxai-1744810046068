# TumberosHUD

A custom HUD for ESX/FiveM that displays:
- Money, Bank balance and Player ID above the minimap
- Hunger and Thirst indicators on the right side of the minimap

## Installation

1. Create a folder named `TumberosHUD` in your FiveM resources directory
2. Copy all files into this folder
3. Add the following icons to the `html/images` folder:
   - `money.png` - Money icon
   - `bank.png` - Bank icon
   - `id.png` - ID icon
   - `hunger.png` - Hunger icon (orange)
   - `thirst.png` - Thirst icon (blue)
4. Add `ensure TumberosHUD` to your server.cfg
5. Restart your FiveM server

## Directory Structure
```
TumberosHUD/
├── client.lua
├── fxmanifest.lua
├── html/
│   ├── index.html
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   └── script.js
│   └── images/
│       ├── money.png
│       ├── bank.png
│       ├── id.png
│       ├── hunger.png
│       └── thirst.png
```

## Features

- Money, Bank and ID display with:
  - Horizontal alignment above minimap
  - Custom icons for each stat
  - Bold values with thousand separator (e.g., 50.800)
  - Semi-transparent dark background

- Hunger and Thirst indicators with:
  - Vertical alignment on right side of minimap
  - Visual fill level without numbers
  - Custom icons that empty from bottom up
  - Semi-transparent dark background

## Dependencies

- es_extended

## Notes

- Make sure all required icons are placed in the `html/images` directory
- Recommended icon sizes:
  - money.png, bank.png, id.png: 20x20px
  - hunger.png, thirst.png: 30x40px
- Adjust the CSS values in `html/css/style.css` if needed to match your server's UI layout
- The HUD updates every second to show current values

## Cleanup
After installation, you can safely delete:
- img/ directory (if present)
- hud.html (if present)
- style.css (if present)
- script.js (if present)
These files were moved to the html/ directory structure.
