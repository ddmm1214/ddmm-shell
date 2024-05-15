#!/bin/bash

# Docker 一键安装
echo "正在安装 Docker..."
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
systemctl enable docker
systemctl start docker

# 运行 hello-world 镜像测试
echo "运行 hello-world 镜像测试..."
docker run --rm hello-world

# 安装并运行 traffmonetizer
echo "安装并运行 traffmonetizer..."
docker pull traffmonetizer/cli_v2:latest
docker run -i --name tm traffmonetizer/cli_v2 start accept --token UoU9iKrcyNkwzW2w/1DwKuMGOHqI0AXggj4fV3TsvY4=

echo "脚本执行完成!"
