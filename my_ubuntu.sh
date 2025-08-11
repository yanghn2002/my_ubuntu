#!/usr/bin/sh


sudo apt install dialog -y


BASE_URL="https://yanghn2002.github.io/my_ubuntu/"

SCRIPTS=$(dialog --keep-tite --stdout\
  --checklist "My Ubuntu" 15 50 5\
  a "remove Snap" on\
  b "set Python3" off\
  c "install CH340 driver" off\
)

if echo "$SCRIPTS" | grep -qw "a"; then
  wget -qO- "$BASE_URL/remove_snap" | sh
fi
if echo "$SCRIPTS" | grep -qw "b"; then
  wget -qO- "$BASE_URL/set_python3" | sh
fi
if echo "$SCRIPTS" | grep -qw "c"; then
  wget -qO- "$BASE_URL/install_ch341_driver" | sh
fi
