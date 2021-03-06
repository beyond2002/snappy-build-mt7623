#!/bin/sh
# workaround to untar snappy-mtk-wifi-config.tar.gz to target directory 
image=$1
if [ ! -e snappy-mtk-wifi-config.tar.gz ] ; then
	echo "File snappy-mtk-wifi-config.tar.gz not found. exit"
	exit 1
fi
echo "workaround snappy..."
sudo losetup /dev/loop0 ${image} -o $((139264 * 512))
sudo mount /dev/loop0 /mnt
sudo tar axvf snappy-mtk-wifi-config.tar.gz -C /mnt --same-owner
sudo umount /mnt
sudo losetup -d /dev/loop0

