---
title: "自宅サーバー"
date: 2021-01-27T09:08:07+09:00
---

2018年に組んだ(自宅)サーバーを記録として残しておく。

## 外観
{{< figure src="0.jpg" title="Screenshot" class="center" >}}
{{< figure src="1.jpg" title="Screenshot" class="center" >}}
{{< figure src="2.jpg" title="Screenshot" class="center" >}}
{{< figure src="3.jpg" title="Screenshot" class="center" >}}

## スペック
- CPU: Intel Core i7-8700K
- Memory: 64GB
- SSD: 1
- HDD: 16

## こだわり
### HDDを繋いでる奴
https://www.amazon.co.jp/dp/B082D6XSZN/

コスパが最高に良かった。これをx2して利用している。

### HDDの管理
暗号化と冗長化をやっている。

具体的には

1. dm-cryptで暗号化
2. ZFSで2台毎にmirror
3. mhddfsで束ねて管理

している。

mhddfsが味噌で、最悪HDD1台になっても、何らかのデータは引き出せる。
