#!/bin/bash

# 1. 修复 Rust 包下载 LLVM 问题（禁用 download-ci-llvm）
pushd feeds/packages/lang/rust
# 在 Makefile 中寻找并替换 download-ci-llvm 相关行
# 如果找不到直接替换，可以采用追加环境变量的方式
if [ -f Makefile ]; then
    # 方法一：直接替换（如果存在）
    sed -i 's/download-ci-llvm = true/download-ci-llvm = false/' Makefile 2>/dev/null || \
    # 方法二：如果没有该行，则在合适位置添加配置（例如在 define Build/Configure 段前）
    sed -i '/define Build\/Configure/i export RUSTFLAGS="--cfg disable_download_ci_llvm"' Makefile
fi
popd

# 2. 修改默认 IP 为 192.168.10.1（你的原脚本正确）
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
