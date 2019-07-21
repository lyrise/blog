---
title: WindowsでRust, Go, Pythonの開発環境を構築する
date: 2019-04-08T00:00:00+09:00
description: "WindowsにおけるRust, Go, Pythonの開発環境の構築方法メモ。"
---

## Rustの場合

「Windows Subsystem for Linux」+「VSCode」で環境を構築した。

### 1. Windows Subsystem for Linuxを有効化し、Ubuntuをインストールする。

(参考: [Windows10でWSLとVSCodeを使ってC++プログラミング環境を整える](https://qiita.com/yo_kanyukari/items/37421f497b7ffaa75502))

### 2. WSLにrustupとrlsのインストールを行う。

WSLのUbuntuを起動し

```sh
curl https://sh.rustup.rs -sSf | sh
```

を実行しrustupをインストールする。 (参考: <https://www.rust-lang.org/tools/install>)

続けて

```sh
rustup update
rustup component add rls rust-analysis rust-src
```

を実行し、rlsのインストールを行う。 (参考: <https://github.com/rust-lang/rls>)

### 3. VSCodeの設定を行う。

VSCodeの拡張機能([rust-lang.rust](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust))をインストールする。

続けて、VSCodeの設定に

```json
{
    "rust-client.useWSL": true,
    "rust-client.rustupPath": "~/.cargo/bin/rustup"
}
```

を追加する。

### 失敗例

VSCodeをWSLにインストールする方法はうまくいかなかった。

「[WSLに開発環境完全移行してみる](https://qiita.com/LeftLetter/items/0eda1834a46c3b3bff60)」の通りに環境を構築してみたが、

```txt
/usr/share/code/bin/../code: error while loading shared libraries: libx11-xcb.so.1: cannot open shared object file ～
```

というエラーが表示されVSCodeの起動ができなかった。
そもそも、WSL上でのVSCodeの動作はかなり不安定らしいので、諦めた。

-----

## Goの場合

「Chocolatey」+「VSCode」で環境を構築した。

### 1. Chocolateyのインストールを行う。

(参考: [Windows環境にchocolateyをインストールし、使う](https://qiita.com/Koutaru/items/41a87ea4004fa685de55))

### 2.golangのインストールを行う。

コマンドプロンプトを起動し

```sh
choco install golang
```

を実行する。 (参考: [WindowsにGo言語をインストールする方法まとめ](https://qiita.com/yoskeoka/items/0dcc62a07bf5eb48dc4b))

### 3. VSCodeの設定を行う。

VSCodeの拡張機能([ms-vscode.Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go))をインストールする。

### 失敗例

WSLにGoをインストールし、VSCodeの拡張機能と連携させたかったが、今のところ拡張機能がWSLに対応していないらしい。 (参考: [WSL上のGO言語だとVSCodeの拡張機能では「PATHかGOROOTをアップデートして」というエラーが出る](https://qiita.com/aoshimanoa/items/af79929256078fe2f611))

-----

## Pythonの場合

「Chocolatey」+「VSCode」で環境を構築した。

### 1. Chocolateyとpythonのインストールを行う。

参考: [【Chocolatey入門】導入から注意点、今後の可能性まで](https://qiita.com/kangetsu121/items/b6352b547cd32e71bc65)

### 2. VSCodeの設定を行う。

VSCodeの拡張機能([ms-python.python](https://marketplace.visualstudio.com/itemdetails?itemName=ms-python.python))をインストールする。

-----

## 感想

VSCode良い！

WSLで全部対応できるかと思っていたが、拡張機能周りがまだまだ追い付いていない感じ。
