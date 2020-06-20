---
title: "SMARTのReallocated_Event_Countを調査するコマンド"
date: 2020-06-20T14:52:59+09:00
draft: true
---

対象はUbuntuの環境。
以下のコマンドで/dev/sd*のSMARTのReallocated_Event_Countを一覧表示する。

```sh
sudo lshw -short | grep disk | awk '{print $2}' | sort | uniq | xargs -L 1 -I {} sh -c "echo {} && sudo smartctl -A {} | grep 'Reallocated_Event_Count' | awk '{print \$2,\$10}'"
```
