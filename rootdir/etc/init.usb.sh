#!/system/bin/sh

if [ -f /sys/devices/soc0/soc_id ]; then
				soc_id=`cat /sys/devices/soc0/soc_id`
else
				soc_id=`cat /sys/devices/system/soc/soc0/id`
fi


#
setprop sys.usb.rps_mask 0

case "$soc_id" in
				"239" | "241" | "263")
								setprop sys.usb.rps_mask 10
				;;
esac
