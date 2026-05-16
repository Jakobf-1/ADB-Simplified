mkdir Utility
cd Utility
mkdir ADBtool
touch ADB.sh
cat <<EOF > ADB.sh
cd ADBtool
bash ADBloader.sh
EOF
chmod +x ./ADB.sh
cd ADBtool
touch ADBloader.sh
cat <<EOF > ADBloader.sh
#!/bin/bash
clear
sudo apt install android-tools-adb
sudo apt install android-tools-fastboot
sleep 1
clear
echo "Commands:"
echo "  fbd       = list fastboot devices"
echo "  fbleave   = leaves fastboot mode (reboot device)"
echo "  abd       = list adb devices"
echo "  fbenter   = enter fastboot mode on any connected device"
echo "  adbshell  = enter device shell"
while true; do
	read -p "> " inp
	if [ "$inp" = "fbd" ]; then
		sudo fastboot devices
	elif [ "$inp" = "abd" ]; then
		sudo adb devices
	elif [ "$inp" = "adbshell" ]; then
		sudo adb shell
	elif [ "$inp" = "fbleave" ]; then
		sudo fastboot reboot
	elif [ "$inp" = "fbenter" ]; then
		sudo adb reboot fastboot
	fi
done
read -p "Press Enter to exit..."
EOF
chmod +x ./ADBloader.sh
cd ..
cd ..
rm installer.sh
