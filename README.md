Czenglish
=========

Czenglish is a combined Czech/English xkb keyboard layout, mostly useful for
geeks who often need to type characters present on English keyboard layout, but
are not willing to resign on writing Czech properly with diacritics.

Features
--------

* Unless a modifier key is pressed, the layout is English.

* By pressing a modifier key together with a letter, you'll write a letter with
  an acute, caron etc. You can combine this with the shift key to write capital
  letters with diacritics.

Variants
--------

The `basic` variant is all you need in theory, the others are just if you are
lazy to click through X settings to set the modifiers properly.

* `basic` - the keyboard layout without any modifier key preset. You can set
  the modifier key with parameters to `setxkbmap` or by clicking through your
  favorite app for keyboard settings.

* `ralt_switch` - basic + set right alt as the modifier key.

* `caps_switch` - basic + set caps lock as the modifier key.

* `nerd` - basic + set caps lock as the modifier key + shuffle other modifier
  keys so that: alts behave as ctrls, super and menu keys behave as alts,
  right ctrl behaves like left super key (this is good for invoking Gnome or
  Unity menus).

Installation
------------

1.  Install the layout file into your system.

        sudo su -c 'cd /usr/share/X11/xkb/symbols; wget https://raw.github.com/jistr/czenglish/master/symbols/cen; chmod 0644 cen'

2.  Set it as layout for your user

    basic: `dconf write /org/gnome/libgnomekbd/keyboard/layouts "['cen']"`  
    ralt_switch: `dconf write /org/gnome/libgnomekbd/keyboard/layouts "['cen\tralt_switch']"`  
    caps_switch: `dconf write /org/gnome/libgnomekbd/keyboard/layouts "['cen\tcaps_switch']"`  
    nerd: `dconf write /org/gnome/libgnomekbd/keyboard/layouts "['cen\tnerd']"`

3.  Do a logout/login.
