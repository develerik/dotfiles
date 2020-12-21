# UDEV Rules

## Wacom USB-Tablet

`/etc/udev/rules.d/60-wacom.rules`

```
ACTION!="add|change", GOTO="wacom_end"
KERNEL!="event[0-9]*", GOTO="wacom_end"

DRIVERS=="wacom", ATTRS{bInterfaceNumber}=="00", ENV{WACOM_TYPE}="stylus"
DRIVERS=="wacom", ATTRS{bInterfaceNumber}=="01", ENV{WACOM_TYPE}="touch"

ATTRS{idVendor}=="056a", ENV{WACOM_TYPE}!="touch", SYMLINK+="input/wacom"
ATTRS{idVendor}=="056a", ENV{WACOM_TYPE}=="touch", SYMLINK+="input/wacom-touch"

ATTRS{idVendor}=="056a", ACTION=="add", RUN+="check_driver wacom $devpath $env{ID_BUS}"

LABEL="wacom_end"
```

## Logitech BRIO

`/etc/udev/rules.d/99-logitech-brio.rules`

```
SUBSYSTEM=="video4linux", KERNEL=="video[0-3]", ATTRS{product}=="Logitech BRIO", ATTRS{serial}=="13326057", RUN="/usr/bin/v4l2-ctl -d $devnode --set-ctrl=zoom_absolute=220"
SUBSYSTEM=="video4linux", KERNEL=="video[0-3]", ATTRS{product}=="Logitech BRIO", ATTRS{serial}=="13326057", RUN="/usr/bin/v4l2-ctl -d $devnode --set-ctrl=pan_absolute=3600"
SUBSYSTEM=="video4linux", KERNEL=="video[0-3]", ATTRS{product}=="Logitech BRIO", ATTRS{serial}=="13326057", RUN="/usr/bin/v4l2-ctl -d $devnode --set-ctrl=tilt_absolute=-3600"
```

## Hide KVM NTFS partitions

`/etc/udev/rules.d/90-hide-ntfs-partitions.rules`


```
KERNEL=="sdx[1-9]", ENV{UDISKS_IGNORE}="1"
```

**NOTE**: `sdx` is your kvm drive
