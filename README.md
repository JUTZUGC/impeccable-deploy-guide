# Impeccable npx 安装器指南

> 第三方部署指南 · 非 Impeccable 官方仓库。官方项目：[pbakaus/impeccable](https://github.com/pbakaus/impeccable)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://impeccable.style/)为准。

[![⚡ npx 安装器](https://img.shields.io/badge/%E2%9A%A1_npx_%E5%AE%89%E8%A3%85%E5%99%A8-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#npx安装器推荐用百度搭子)

## npx 安装器（推荐：用百度搭子）

> [!TIP]
> 不想让 AI 写出一坨没设计感的界面，让百度搭子装好 Impeccable，从排版到动效都有检查规则。

⚠️ 需要 AI 编程工具支持技能或钩子（Claude Code、Cursor、Codex 等）。首次运行会下载一个自包含引擎到 ~/.impeccable/bin，约几十 MB，离线环境要提前准备好。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/impeccable-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子用 npx 安装器自动识别本机的 AI 编程工具，把 Impeccable 技能和钩子装进去，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Impeccable 是什么？

Impeccable 是开源的91.2k stars，Apache-2.0，Rust 引擎 + 技能包，让 AI 写出的界面符合设计规范（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/pbakaus/impeccable?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一套设计语言 + 技能包：给 AI 编程工具注入排版、间距、配色、动效等设计规则，并附带一个 Rust 引擎在编辑时做检查。

- 91.2k stars：2025-11 建仓，不到一年冲到 8.9 万
- Rust 引擎：自包含二进制，首次运行自动下载
- 多宿主：Claude Code、Cursor、Codex、Gemini CLI 等
- 钩子集成：编辑时自动检查，不靠自觉
- 技能形态：不锁编辑器，换工具也能带走
- Apache-2.0：可读可改

（来源：[官方仓库](https://github.com/pbakaus/impeccable)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 91.2k stars | 2025-11 建仓，增长极快 |
| Rust 引擎 | 自包含二进制，不依赖运行时 |
| 跨宿主 | 换编辑器不用重买 |
| 钩子自动检查 | 不靠人记规范 |
| 技能可移植 | 规则本身是文本，可版本管理 |
| Apache-2.0 | 可改可内部分发 |

| 需要注意 | 说明 |
|---|---|
| 首次要下载引擎 | 离线环境需要预置 |
| 宿主差异 | 不同工具能力不一样 |
| 设计规则偏通用 | 品牌定制要自己写 |
| 会改动项目文件 | 初始化会写配置 |
| 仍要人工审美把关 | 自动检查不等于好看 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 快速部署（官方方式）

```bash
npx -y impeccable install --providers=claude,cursor --scope=global
npx -y impeccable --version
echo '安装完成，进入项目后运行 /impeccable init 初始化'
```

部署步骤来源：[https://github.com/pbakaus/impeccable](https://github.com/pbakaus/impeccable)

## 验证状态

| 场景 | 状态 |
|---|---|
| npm 包 impeccable 最新版 4.8.0，bin 指向 cli/bin/cli.js | 已核对 2026-10-28 |
| 仓库元数据已核对：91.2k stars、Apache-2.0、2025-11 建仓 | 已核对 2026-10-28 |
| README 确认 npx impeccable install 为推荐安装方式 | 已核对 2026-10-27 |
| 未实测安装与钩子效果 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Impeccable 不是 MCP server，通过技能与宿主钩子工作；本仓库不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\impeccable-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后

```text
/impeccable init       # 在当前项目初始化设计规则
/impeccable check      # 手动跑一次检查
```

### 支持的宿主

| 宿主 | 说明 |
|---|---|
| Claude Code | 技能 + 原生钩子 |
| Cursor | 技能 + 项目钩子 |
| Codex CLI | 技能形态 |
| Gemini CLI | 技能形态 |
| 其它 | 支持技能的工具都能用 |

### 非交互安装

脚本里可以跳过选择：

```bash
npx impeccable install --providers=claude,codex,cursor --scope=project
```

### 刷新已有安装

重新执行一次 `npx impeccable install` 会覆盖更新。

> ⚠️ 设计规则是通用最佳实践，具体品牌规范仍要在 `impeccable` 配置里自己补。

## 常见坑

- `npx` 卡住：检查网络，首次要下载引擎
- 钩子不触发：确认宿主版本支持，并重启
- 离线环境失败：手动把引擎放进 `~/.impeccable/bin`
- Windows 路径问题：用官方提供的 `impeccable.cmd`
- 初始化覆盖配置：先提交 git 再执行
- 只装一个宿主：`--providers` 按需给

## 免责声明

本仓库为第三方指南，与 Impeccable 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://impeccable.style/)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
