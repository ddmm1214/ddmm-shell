#!/bin/bash

# 设置Swap文件的路径
SWAP_FILE="/swapfile"

# 设置Swap大小为1G
SWAP_SIZE=1024

# 检查swap文件是否已存在
if [ -f "$SWAP_FILE" ]; then
    echo "Swap文件'$SWAP_FILE'已存在。"
    exit 1
fi

# 创建swap文件
echo "创建Swap文件..."
sudo fallocate -l ${SWAP_SIZE}M $SWAP_FILE

# 设置swap文件的权限
echo "设置Swap文件的权限..."
sudo chmod 600 $SWAP_FILE

# 设置swap空间
echo "设置Swap空间..."
sudo mkswap $SWAP_FILE

# 启用swap文件
echo "启用Swap文件..."
sudo swapon $SWAP_FILE

# 验证swap是否成功启用
echo "Swap已成功启用:"
sudo swapon --show

# 使swap持久化，添加到fstab文件中
echo "使Swap持久化..."
echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab

echo "Swap配置完成。"
