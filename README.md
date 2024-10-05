# Quick Start

- Setting up QEMU

```shell script
sudo apt-get install qemu-system-misc
```

- Get the OpenSBI and U-Boot binaries

```shell script
sudo apt-get install u-boot-qemu opensbi
```

- Make a disk image

```shell script
./qemu-install.sh ./ubuntu-22.04.3-live-server-riscv64.img ./qemu_disk.bin
```

- Boot the damn thing

```shell script
./qemu-run.sh ./qemu_disk.bin
```
