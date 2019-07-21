---
title: 独自のシリアライズフォーマット「RocketPack」を実装する 2
date: 2018-12-23T00:00:00+09:00
---

前回に引き続き「RocketPack」がテーマ。

<https://github.com/OmniusLabs/Omnix/tree/master/src/Omnix.Serialization.RocketPack>

「MessagePack-CSharp」と比較を行うため、ベンチマークを実施する際にシリアライズ＆デシリアライズするデータのサイズを大きくしてみた。

また、仕様バグがあったためこっそり修正。

## 結果

{{< figure src="0.png" position="center" >}}
{{< figure src="1.png" position="center" >}}
{{< figure src="2.png" position="center" >}}
{{< figure src="3.png" position="center" >}}

対象のデータのサイズが増えると、「RocketPack」と「MessagePack-CSharp」の処理速度の差が目立たなくなる。

しかし、やはり「MessagePack-CSharp」の速度は異常なほど早い！

## 補足

BenchmarkDotNetでプロファイルを取る方法について。

下記のサイトに詳しく記載されている。

+ [Profiling .NET Code with BenchmarkDotNet](https://adamsitnik.com/ETW-Profiler/)

これでボトルネックを特定するのが楽になる。