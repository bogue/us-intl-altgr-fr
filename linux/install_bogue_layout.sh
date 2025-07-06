#!/bin/bash

# This script installs the "bogue" custom keyboard layout.
# It must be run with root privileges (e.g., using sudo).

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Please use sudo." >&2
  exit 1
fi

# 1. Create the symbols file
cat > /usr/share/X11/xkb/symbols/bogue << 'EOF'
// BOGUE: Custom US International layout with AltGr for French characters

default partial alphanumeric_keys
xkb_symbols "bogue" {

    name[Group1]= "English (US, intl., with AltGr FR by Bogue)";

    // BOGUE custom french mappings (placed before us(intl) to ensure precedence)
    key <AC01> { [         a,          A,        agrave,           Agrave ] };
    key <AC02> { [         s,          S,   acircumflex,      Acircumflex ] };
    key <AD09> { [         o,          O,   ocircumflex,      Ocircumflex ] };
    key <AD08> { [         i,          I,   icircumflex,      Icircumflex ] };
    key <AD07> { [         u,          U,   ucircumflex,      Ucircumflex ] };
    key <AD06> { [         y,          Y,        ugrave,           Ugrave ] };
    key <AD02> { [         w,          W,        egrave,           Egrave ] };
    key <AD04> { [         r,          R,   ecircumflex,      Ecircumflex ] };
    key <AD05> { [         t,          T,    ediaeresis,       Ediaeresis ] };
    include "us(intl)"

    // BOGUE custom french mappings (placed before us(intl) to ensure precedence)
    key <AC01> { [         a,          A,        agrave,           Agrave ] };
    key <AC02> { [         s,          S,   acircumflex,      Acircumflex ] };
    key <AD09> { [         o,          O,   ocircumflex,      Ocircumflex ] };
    key <AD08> { [         i,          I,   icircumflex,      Icircumflex ] };
    key <AD07> { [         u,          U,   ucircumflex,      Ucircumflex ] };
    key <AD06> { [         y,          Y,        ugrave,           Ugrave ] };
    key <AD02> { [         w,          W,        egrave,           Egrave ] };
    key <AD04> { [         r,          R,   ecircumflex,      Ecircumflex ] };
    key <AD05> { [         t,          T,    ediaeresis,       Ediaeresis ] };
    key <AB03> { [         c,          C,      ccedilla,         Ccedilla ] };

    // five dead keys moved into level3:
    key <TLDE> { [    grave, asciitilde,  dead_grave,   dead_tilde      ] };
    key <AC11> { [apostrophe,quotedbl,    dead_acute,   dead_diaeresis  ] };

    // diversions from the MS Intl keyboard:
    key <AE01> { [        1, exclam,      onesuperior,  exclamdown      ] };
    key <AC07> { [        j, J,           idiaeresis,   Idiaeresis      ] };
    key <AB02> { [        x, X,           oe,           OE              ] };
    key <AB04> { [        v, V,           registered,   registered      ] };

    // onequarter etc (not in iso8859-15) moved to get three unshifted deadkeys:
    key <AE06> { [        6, asciicircum, dead_circumflex, onequarter    ] };
    key <AE07> { [        7, ampersand,   dead_horn,       onehalf       ] };
    key <AE08> { [        8, asterisk,    dead_ogonek,     threequarters ] };

    include "level3(ralt_switch)"
};
EOF

echo "Created /usr/share/X11/xkb/symbols/bogue"

# 2. Add to evdev.lst
# Check if the entry already exists
if ! grep -q "bogue" /usr/share/X11/xkb/rules/evdev.lst; then
  sed -i '/! layout/a bogue            us: English (US, intl., with AltGr FR by Bogue)' /usr/share/X11/xkb/rules/evdev.lst
  echo "Added 'bogue' to /usr/share/X11/xkb/rules/evdev.lst"
else
  echo "'bogue' already exists in /usr/share/X11/xkb/rules/evdev.lst"
fi

# 3. Add to evdev.xml
# Check if the entry already exists
if ! grep -q "<name>bogue</name>" /usr/share/X11/xkb/rules/evdev.xml; then
  sed -i '/<\/layoutList>/i \
    <layout>\
      <configItem>\
        <name>bogue</name>\
        <shortDescription>en</shortDescription>\
        <description>English (US, intl., with AltGr FR by Bogue)</description>\
        <languageList>\
          <iso639Id>eng</iso639Id>\
        <\/languageList>\
      <\/configItem>\
      <variantList/>\
    <\/layout>' /usr/share/X11/xkb/rules/evdev.xml
  echo "Added 'bogue' layout to /usr/share/X11/xkb/rules/evdev.xml"
else
    echo "'bogue' layout already exists in /usr/share/X11/xkb/rules/evdev.xml"
fi

echo ""
echo "Installation complete."
echo "To apply the changes, please log out and log back in."
echo "You should then be able to select the 'English (US, intl., with AltGr FR by Bogue)' layout in your system settings."