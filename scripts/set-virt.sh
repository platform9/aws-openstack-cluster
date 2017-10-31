#!/usr/bin/env bash
NOVA_CONF="/opt/pf9/etc/nova/conf.d/nova_override.conf"

function set_virtualization()
{
  modprobe kvm_intel > /dev/null 2>&1
  modprobe kvm_amd > /dev/null 2>&1
  ls -l /dev/kvm
  if [[ "$?" != "0" ]]; then
      echo "KVM not enabled--setting virtualization to qemu"
      echo "[libvirt]" > $NOVA_CONF
      echo "virt_type = qemu" >> $NOVA_CONF
  else
      echo "KVM enabled--setting virtualization to kvm"
      echo "[libvirt]" > $NOVA_CONF
      echo "virt_type = kvm" >> $NOVA_CONF
  fi
  service pf9-ostackhost restart
}

set_virtualization
