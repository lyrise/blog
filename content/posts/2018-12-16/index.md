---
title: 独自のシリアライズフォーマット「RocketPack」を実装する
date: 2018-12-16T00:00:00+09:00
---

[System.IO.Pipelines](https://blogs.msdn.microsoft.com/dotnet/2018/07/09/system-io-pipelines-high-performance-io-in-net/)を利用した、独自実装の「RocketPack」というフォーマットのシリアライザを実装した。

<https://github.com/OmniusLabs/Omnix/tree/master/src/Omnix.Serialization.RocketPack>

比較のために、[MessagePack for C#](https://github.com/neuecc/MessagePack-CSharp)をベースラインに設定したベンチマークを行った。

## 結果

{{< figure src="img/SerializeTest.png" position="center" >}}
{{< figure src="img/DeserializeTest.png" position="center" >}}

「MessagePack-CSharp」やはり凄い。。