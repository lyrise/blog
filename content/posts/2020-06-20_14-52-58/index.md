---
title: "SMARTのReallocated_Event_Countを調査するコマンド"
date: 2020-06-20T14:52:59+09:00
---

対象はUbuntuの環境。
以下のコマンドで/dev/sd*のSMARTのReallocated_Event_Countを一覧表示する。

```sh
sudo lshw -short | grep disk | awk '{print $2}' | sort | uniq | xargs -L 1 -I {} sh -c "echo {} && sudo smartctl -A {} | grep 'Reallocated_Event_Count' | awk '{print \$2,\$10}'"
```

以下のように一覧表示される。

```
/dev/sda
Reallocated_Event_Count 95
/dev/sdb
/dev/sdc
Reallocated_Event_Count 0
/dev/sdd
Reallocated_Event_Count 0
/dev/sde
Reallocated_Event_Count 0
/dev/sdf
Reallocated_Event_Count 0
```

forで回したほうが見通しが良くなるので以下も追記。

```sh
for v in $(lshw -short | grep disk | awk '{print $2}' | sort | uniq)
do
    echo "$v $(smartctl -A $v | grep 'Reallocated_Event_Count' | awk '{print $2,$10}')"
done
```

結果は以下の通り

```
/dev/sda Reallocated_Event_Count 95
/dev/sdb
/dev/sdc Reallocated_Event_Count 0
/dev/sdd Reallocated_Event_Count 0
/dev/sde Reallocated_Event_Count 0
/dev/sdf Reallocated_Event_Count 0
```
