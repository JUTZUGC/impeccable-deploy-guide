# Impeccable npx 安装器脚本（第三方指南）——按官方文档封装
# 官方文档：https://impeccable.style/
# 更新日期：2026-10-28
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

npx.cmd -y impeccable install --providers=claude,cursor --scope=global
npx.cmd -y impeccable --version
Write-Host '安装完成，进入项目后运行 /impeccable init 初始化'

Write-Host ''

Write-Host '部署完成：在 AI 编程工具里运行 /impeccable init 初始化项目，之后编辑界面会自动套用设计规则'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://impeccable.style/'
