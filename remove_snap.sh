#!/usr/bin/sh

echo "Running 'remove_snap.sh'"

sudo echo > /dev/null


for i in 1 2 3; do
    for p in $(snap list | awk '{print $1}'); do
        sudo snap remove $p
    done
done

sudo systemctl stop snapd
sudo systemctl disable --now snapd.socket
for m in /snap/core/*; do
    sudo umount $m
done

sudo apt autoremove --purge snapd -y

rm -rf ~/snap
sudo rm -rf /var/snap /var/lib/snapd /var/cache/snapd

sudo sh -c "cat > /etc/apt/preferences.d/no-snapd.pref" << EOL
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOL


echo "Done."