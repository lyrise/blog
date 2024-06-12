---
title: "kvm+qemu+virtioで、ブリッジ接続する際のコマンド"
date: 2024-06-13T08:45:52+09:00
---

毎回忘れるのでメモ

```sh
nmcli connection add type bridge ifname br0
nmcli connection add type bridge-slave ifname enp5s0 master br0
nmcli connection modify bridge-br0 ipv4.method manual ipv4.addresses "192.168.11.32/24" ipv4.gateway "192.168.11.1" ipv4.dns 192.168.11.1
nmcli connection delete "有線接続 1"
```

最後に再起動が必要

`connection delete`が肝で、これを忘れてハマった
