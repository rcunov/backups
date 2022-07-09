#!/bin/bash

VM_ID=202
VM_IMAGE=jammy-server-cloudimg-amd64.img
VM_STORAGE=local-lvm
VM_NET=vmbr0

read -p "Ensure variables are correct. Press enter when done. "

qm create $VM_ID --memory 2048 --net0 virtio,bridge=$VM_NET
qm importdisk $VM_ID $VM_IMAGE $VM_STORAGE
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $VM_STORAGE:vm-$VM_ID-disk-1

qm set $VM_ID --ide2 $VM_STORAGE:cloudinit
qm set $VM_ID --boot c --bootdisk scsi0
qm set $VM_ID --serial0 socket --vga serial0
