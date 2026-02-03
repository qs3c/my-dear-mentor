# MyDearMentor

[English](README.md) | 中文

一个在开发过程中持续维护导师式 `StudyNotes.md` 的技能。支持 Claude Code、Codex 和 Gemini CLI。

## 安装

### Claude Code（推荐）

```bash
/plugin install mydearmentor@qs3c/my-dear-mentor
```

### Codex / Gemini CLI

使用安装脚本：

```bash
# Unix/Linux/macOS
./scripts/install.sh -a codex    # 仅 Codex
./scripts/install.sh -a gemini   # 仅 Gemini CLI
./scripts/install.sh -a all      # 所有代理

# Windows PowerShell
.\scripts\install.ps1 -Agent codex
.\scripts\install.ps1 -Agent gemini
.\scripts\install.ps1 -Agent all
```

参数说明：
- `-a / -Agent`：claude、codex、gemini 或 all（默认：all）
- `-s / -Scope`：global 或 project（默认：global）
- `-p / -ProjectPath`：项目路径（用于 project 作用域）

## 功能简介

- 记录开发的每个阶段（分析、实现、测试、评审、修复）的过程与结果
- 解释核心思想、决策与推理过程
- 记录本次会话中首次使用的命令行命令，并给出解释（重复命令不再记录）
- 记录问题现象、排查过程与最终的解决办法
- 在开始时询问 `StudyNotes.md` 使用的语言（如果用户未指定）

## 使用方式

向 AI 代理说明"使用 mydearmentor skill"或提出"维护导师式 StudyNotes"的需求。

## 备注

- 模板小节标题会翻译为所选语言
- 若不存在 `StudyNotes.md`，会在仓库根目录自动创建
