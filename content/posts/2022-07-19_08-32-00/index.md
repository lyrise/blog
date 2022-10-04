---
title: "Installation of ROCm and TensorFlow on Ubuntu 20.4 LTS for Radeon RX580 by Lyrise"
date: 2022-07-19T08:32:00+09:00
---

## 概要

以下を参考に作業
https://github.com/Grench6/RX580-rocM-tensorflow-ubuntu20.4-guide

## 注意点1

linuxカーネルは'5.4.0-42'にダウングレードしておく必要がある
ref. https://github.com/Grench6/RX580-rocM-tensorflow-ubuntu20.4-guide/issues/13

## 注意点2

pythonは3.8.x系を使うこと

## 注意点3

以下環境変数を設定すること

```sh
export PATH=$PATH:/opt/rocm/bin:/opt/rocm/profiler/bin:/opt/rocm/opencl/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/rocm/hip/lib
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
sudo ldconfig
```

## 補足

`tensorflow-rocm=="2.3.0"`でも動作することを確認した
