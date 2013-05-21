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

        sudo su -c 'cd /usr/share/X11/xkb/symbols
                    wget -nc https://raw.github.com/jistr/czenglish/master/symbols/cen
                    chmod 0644 cen'

2.  Now you can try the layout in current session.

    basic: `setxkbmap -layout cen`  
    ralt_switch: `setxkbmap -layout cen -variant ralt_switch`  
    caps_switch: `setxkbmap -layout cen -variant caps_switch`  
    nerd: `setxkbmap -layout cen -variant nerd`

### Persistent settings for Gnome 3.6+ ###

1.  Gnome 3.6 (and higher?) has a
    [bug](https://bugzilla.gnome.org/show_bug.cgi?id=696288)
    that makes it impossible to make custom keyboard layout persistent
    across sessions without editing Xkb rules. The `xkb_rules_hack.sh`
    script attempts to do exactly that. *Use at your own risk, it edits
    system files in /usr/share/X11/xkb/rules.*

2.  Set the layout in DConf.

    basic: `dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'cen')]"`  
    ralt_switch: `dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'cen+ralt_switch')]"`  
    caps_switch: `dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'cen+caps_switch')]"`  
    nerd: `dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'cen+nerd')]"`
