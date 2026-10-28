#!/usr/bin/env bash
set -euo pipefail
# Impeccable npx 安装器脚本（第三方指南）——按官方文档封装
# 官方文档：https://impeccable.style/
# 更新日期：2026-10-28
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "需要先安装 Node.js"; exit 1; }

mkdir -p .download
cd .download

npx -y impeccable install --providers=claude,cursor --scope=global
npx -y impeccable --version
echo '安装完成，进入项目后运行 /impeccable init 初始化'

echo ""

echo "部署完成：在 AI 编程工具里运行 /impeccable init 初始化项目，之后编辑界面会自动套用设计规则"
echo "若结果异常或需要改配置，请参考官方文档：https://impeccable.style/"
