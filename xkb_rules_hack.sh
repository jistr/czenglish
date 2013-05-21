#!/bin/bash

set -eo pipefail

function main() {
  if [[ $(id -u) != '0' ]]; then
    echo "This script must be run as root."
    exit 1
  fi

  cd /usr/share/X11/xkb/rules

  backup_file "base.xml"
  backup_file "base.lst"
  backup_file "evdev.xml"
  backup_file "evdev.lst"

  for base_name in base evdev; do
    insert_after "$base_name.lst" "$lst_layout" "$lst_layout_after" "$lst_layout_not_if"
    insert_after "$base_name.lst" "$lst_variants" "$lst_variants_after" "$lst_variants_not_if"
    insert_after "$base_name.xml" "$xml_layout" "$xml_layout_after" "$xml_layout_not_if"

    echo
    diff -c2 "$base_name.lst.before-czenglish" "$base_name.lst" || true
    echo
    diff -c2 "$base_name.xml.before-czenglish" "$base_name.xml" || true
  done
}

lst_layout='  cen             Czenglish'
lst_layout_after='^ *cz *Czech'
lst_layout_not_if='^ *cen *Czenglish'

lst_variants='  ralt_switch     cen: Czenglish (ralt_switch)\
  caps_switch     cen: Czenglish (caps_switch)\
  nerd            cen: Czenglish (nerd)'
lst_variants_after='^ *dvorak-ucw *cz:'
lst_variants_not_if='^ *ralt_switch *cen:'

xml_layout='    <layout>\
      <configItem>\
        <name>cen</name>\
        <shortDescription>cen</shortDescription>\
        <description>Czenglish</description>\
      </configItem>\
      <variantList>\
        <variant>\
          <configItem>\
            <name>ralt_switch</name>\
            <description>Czenglish (ralt_switch)</description>\
          </configItem>\
        </variant>\
        <variant>\
          <configItem>\
            <name>caps_switch</name>\
            <description>Czenglish (caps_switch)</description>\
          </configItem>\
        </variant>\
        <variant>\
          <configItem>\
            <name>nerd</name>\
            <description>Czenglish (nerd)</description>\
          </configItem>\
        </variant>\
      </variantList>\
    </layout>'
xml_layout_after='^ *<layoutList>'
xml_layout_not_if='Czenglish'

function backup_file() {
  backup_name="$1.before-czenglish"
  if [[ ! -e "$backup_name" ]]; then
    echo "Creating backup file: $backup_name"
    cp "$1" "$backup_name"
  else
    echo "Backup file $backup_name already exists."
  fi
}

function insert_after() {
  file_name="$1"
  text="$2"
  after="$3"
  not_if_contains="$4"

  if grep -qi "$not_if_contains" "$file_name"; then
    echo "File $file_name contains '$not_if_contains', not inserting anything."
    return
  fi

  sed -nie "/$after/a\\$text" "$file_name"
}

main
