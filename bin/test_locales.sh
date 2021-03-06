#!/bin/bash

# This creates a faux Swedish Chef locale under xx and transforms all the
# strings such that every resulting string has four properties:
#
# 1. it's longer than the English equivalent (tests layout issues)
# 2. it's different than the English equivalent (tests missing gettext calls)
# 3, every string ends up with a non-ascii character (tests unicode)
# 4. looks close enough to the English equivalent that you can quickly
#    figure out what's wrong
#
# Run this from the project root directory like this:
#
# $ bin/test_locales.sh

echo "extract and merge...."
./manage.py extract
./manage.py merge

echo "creating dir...."
mkdir -p locale/xx/LC_MESSAGES

echo "copying messages.pot file...."
cp locale/templates/LC_MESSAGES/messages.pot locale/xx/LC_MESSAGES/messages.po

echo "poxx messages.po file...."
bin/poxx.py locale/xx/LC_MESSAGES/messages.po
bin/compile-mo.sh locale/xx/
