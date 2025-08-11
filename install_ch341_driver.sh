#!/usr/bin/sh

echo "Running 'install_ch341_driver.sh'"

sudo echo > /dev/null


wget -O CH341SER_LINUX.ZIP https://www.wch.cn/download/file?id=177
unzip CH341SER_LINUX.ZIP
rm CH341SER_LINUX.ZIP

cd CH341SER_LINUX/driver
make && sudo make install
cd ../..
rm -r CH341SER_LINUX


sudo apt autoremove --purge brltty -y on Ubuntu


echo "Done."