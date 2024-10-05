#!/bin/sh

dd if=/dev/zero bs=1M of="$2" count=1 seek=5000

/usr/bin/qemu-system-riscv64 -machine virt -m 4G -smp cpus=2 -nographic \
    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.bin \
    -kernel /usr/lib/u-boot/qemu-riscv64_smode/u-boot.bin \
    -netdev user,id=net0 \
    -device virtio-net-device,netdev=net0 \
    -drive file="$1",format=raw,if=virtio \
    -drive file="$2",format=raw,if=virtio \
    -device virtio-rng-pci -no-reboot
