# United States (International) with AltGr dead keys - French
## Credits
All due credits go to 
- Windows: [Thomas Faingnaert](https://github.com//thomasfaingnaert)
- Mac: [xv0x7c0](https://github.com/xv0x7c0/osx-us-altgr-intl/)
## Introduction
Windows includes a keyboard layout called "United States (International)", which allows typing many special characters easily.
The layout defines several keys as "dead keys", such as the apostrophe (`'`) and double quotes (`"`).
This means that to enter a single `'`, you have to press `'` followed by a space.
This can be annoying when you need to enter a lot of these characters, since each now requires two keys to be pressed.

In Linux, there is a keyboard layout named "USA International (AltGr dead keys)" that solves this problem and still allows typing special characters.
If you want to type `'`, you just press `'`.
If you want to use `'` as a dead key, you use AltGr (right alt): e.g. `AltGr+' a` will produce `à`.

All five dead keys (`` ` ``, `~`, `^`, `'` and `"`) are now only dead when AltGr is pressed, otherwise they function as normal keys.
Note that the original layout already defines several AltGr combinations, e.g. `AltGr+'` becomes `´`.
If you want to type these characters in the modified layout, you should follow the old keycombination with a space: e.g. `AltGr+' <SPACE>` will produce `´`.

This layout provides an easier access to French characters using the following mapping:

- `AltGr + a`: à
- `AltGr + s`: â
- `AltGr + q`: ä
- `AltGr + w`: è
- `AltGr + e`: é
- `AltGr + r`: ê
- `AltGr + t`: ë
- `AltGr + y`: ù
- `AltGr + u`: û
- `AltGr + i`: î
- `AltGr + j`: ï
- `AltGr + o`: ô
- `AltGr + o`: ô
- `AltGr + p`: ö
- `AltGr + c`: ç

## How to Build or Install
You can download the latest installer from the releases tab of this repo (https://github.com/bogue/us-intl-altgr-fr/releases).

If you prefer to build from source, you can open the .KLC source file in Microsoft Keyboard Layout Creator.
After opening the file, choose Project > Build DLL and Setup Package in the menu to create an installer.
