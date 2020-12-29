# Modprobe

## Docker Improvements

`/etc/modprobe.d/disable_overlay_redirect_dir.conf`

```
options overlay redirect_dir=off metacopy=off
```

## Nested KVM

`/etc/modprobe.d/amd-kvm.conf`

```
options kvm-amd nested=1
```

## v4l2 Loopback

`/etc/modules-load.d/v4l2loopback.conf`

```
v4l2loopback
```

`/etc/modprobe.d/v4l2loopback.conf`

```
options v4l2loopback devices=1 video_nr=10 card_label="OBS Cam" exclusive_caps=1
```
