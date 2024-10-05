#!/bin/sh

/usr/bin/qemu-system-riscv64 -machine virt -m 4G -smp cpus=2 -nographic \
    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.bin \
    -kernel /usr/lib/u-boot/qemu-riscv64_smode/u-boot.bin \
    -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::12345-:12345 \
    -device virtio-net-device,netdev=net0 \
    -drive file="$1",format=raw,if=virtio \
    -device virtio-rng-pci \
    -vga virtio
