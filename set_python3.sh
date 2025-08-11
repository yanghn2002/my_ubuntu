#!/usr/bin/sh

echo "Running 'set_python3.sh'"

sudo echo > /dev/null


sudo apt install python3
sudo rm /usr/bin/python
sudo ln /usr/bin/python3 /usr/bin/python


echo "Done.