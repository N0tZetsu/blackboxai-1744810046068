# ESX Custom HUD

A custom HUD for ESX/FiveM that displays:
- Money, Bank balance and Player ID above the minimap
- Hunger and Thirst indicators on the right side of the minimap

## Installation

1. Create a folder named `esx_customhud` in your FiveM resources directory
2. Copy all files into this folder
3. Add the following icons to the `img` folder:
   - `Dinero.png` - Money icon
   - `Banco.png` - Bank icon
   - `ID.png` - ID icon
   - `hambre.png` - Hunger icon (orange)
   - `sed.png` - Thirst icon (blue)
4. Add `ensure esx_customhud` to your server.cfg
5. Restart your FiveM server

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

- Make sure all required icons are placed in the `img` directory
- Adjust the CSS values in `style.css` if needed to match your server's UI layout
- The HUD updates every second to show current values
