cd $HOST_FOLDER_DEVICE/imagebuilder;
DOCKER_TAG="ar71xx-generic-openwrt-17.01";
PROFILE="tl-mr3020-v1";
FILES=$HOST_FOLDER_FILES;
BIN_DIR=$HOST_FOLDER_DEVICE/image;

PACKAGES=$(echo $PACKAGES | sed -E 's/luci|luci-ssl//g');
PACKAGES=$(echo $PACKAGES | sed -r 's/php[0-9]*/php7/g');

PACKAGES="block-mount kmod-fs-ext4 kmod-fs-exfatkmod-usb-storage kmod-usb-ohci kmod-usb-uhci e2fsprogs fdisk";FILES="";

COMMAND="make image ";
COMMAND+="PROFILE='$PROFILE' ";
COMMAND+="PACKAGES='$PACKAGES' ";
COMMAND+="FILES='$FILES' ";
COMMAND+="BIN_DIR='$BIN_DIR' ";
COMMAND+="EXTRA_IMAGE_NAME='$EXTRA_IMAGE_NAME' ";
COMMAND+="DISABLED_SERVICES='$DISABLED_SERVICES' ";

EXECUTE_DOCKER_COMMAND=0;
eval $COMMAND;