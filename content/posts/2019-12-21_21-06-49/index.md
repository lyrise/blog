---
title: "FlatBuffersっぽいIDLからimmutableなC#のクラスを作成してProtocolBuffersっぽいシリアライズをしたい！"
date: 2019-12-21T21:06:49+09:00
draft: true
---

ソースコード

https://github.com/omnius-labs/core/tree/develop/src/Omnius.Core.Serialization.RocketPack
https://github.com/omnius-labs/core/tree/develop/src/Omnius.Core.Serialization.RocketPack.DefinitionCompiler

nugetのツールのインストール

rpdファイルの作成

コマンドの実行

C#のサンプルリポジトリ

```rpd
syntax = v1.0;

using "Omnius.Core.Cryptography";
using "Omnius.Core.Network";

namespace "Omnius.Xeus.Service";

table NodeProfile {
    Id: bytes(capacity: 256) = 0,
    Addresses: vector<OmniAddress>(capacity: 32) = 1,
}
```