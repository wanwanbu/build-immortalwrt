#!/bin/bash

# 2. 修改默认 IP 为 192.168.10.1（你的原脚本正确）
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
