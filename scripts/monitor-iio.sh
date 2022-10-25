#!/bin/bash

echo 'Press <Enter> to see the next device and <Ctrl-C> to exit'

accelloop() {
while true
do
	sleep 0.1

	ACCEL_X=$(cat $1_accel_x_raw)
	ACCEL_Y=$(cat $1_accel_y_raw)
	ACCEL_Z=$(cat $1_accel_z_raw)

	printf "\r%9d %9d %9d" $ACCEL_X $ACCEL_Y $ACCEL_Z
done &
read
echo
kill $!
}

gyroloop() {
while true
do
	sleep 0.1

	ANGLVEL_X=$(cat $1_anglvel_x_raw)
	ANGLVEL_Y=$(cat $1_anglvel_y_raw)
	ANGLVEL_Z=$(cat $1_anglvel_z_raw)

	printf "\r%9d %9d %9d" $ANGLVEL_X $ANGLVEL_Y $ANGLVEL_Z
done &
read
echo
kill $!
}

magnloop () {
while true
do
	sleep 0.1

	MAGN_X=$(cat $1_magn_x_raw)
	MAGN_Y=$(cat $1_magn_y_raw)
	MAGN_Z=$(cat $1_magn_z_raw)
	NORTH=$(cat $1_rot_from_north_magnetic_tilt_comp_raw)

	printf "\r%9d %9d %9d %9d" $MAGN_X $MAGN_Y $MAGN_Z $NORTH
done &
read
echo
kill $!
}

alsloop () {
while true
do
	sleep 0.1
	printf "\r%9d" $(cat $1_illuminance_raw)
done &
read
echo
kill $!
}

incliloop () {
while true
do
	sleep 0.1

	INCLI_X=$(cat $1_incli_x_raw)
	INCLI_Y=$(cat $1_incli_y_raw)
	INCLI_Z=$(cat $1_incli_z_raw)

	printf "\r%9d %9d %9d" $INCLI_X $INCLI_Y $INCLI_Z
done &
read
echo
kill $!
}

echo
trap 'kill $!; echo; exit' INT
for iio in "/sys/bus/iio/devices/iio"*
do
	name=$(cat $iio/name)
	printf "%-24s %s\n" "$name" "$iio"

	case $name in
	Toshiba\ accelerometer)
		accelloop $iio/out;;
	accel_3d)
		accelloop $iio/in;;
	gyro_3d)
		gyroloop $iio/in;;
	magn_3d)
		magnloop $iio/in;;
	als)
		alsloop $iio/in;;
	incli_3d)
		incliloop $iio/in;;
	*)
		echo Name not recognized; echo;;
	esac
done
echo Finished
