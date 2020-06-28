---
title: "WindowsでVSCodeにEmacsのキーバインドを設定する"
date: 2020-06-28T05:06:34+09:00
---

## AltキーでMenuにフォーカスが移動するのを防ぐ

AutoHotKeyを以下の設定で起動する

keymap.ahk

```
;Alt単押しの無効化
~LAlt::Send {Blind}{vk07}
```

※参考: https://github.com/karakaram/alt-ime-ahk/issues/2

## CapsLockとCtrlを入れ替える

ChangeKeyを使って設定を行う

※参考: https://forest.watch.impress.co.jp/library/software/changekey/

## Emacsのキーマップに変更する

Awesome Emacs Keymapの拡張機能をインストールする

※参考: https://marketplace.visualstudio.com/items?itemName=tuttieee.emacs-mcx
