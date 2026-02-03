# MyDearMentor

[English](README.md) | 中文

一个 Claude Code 插件，在开发过程中持续维护导师式的 `StudyNotes.md`。

## 安装

```bash
/plugin install mydearmentor@qs3c/my-dear-mentor
```

## 功能简介

- 记录开发的每个阶段（分析、实现、测试、评审、修复）的过程与结果
- 解释核心思想、决策与推理过程
- 记录本次会话中首次使用的命令行命令，并给出解释（重复命令不再记录）
- 记录问题现象、排查过程与最终的解决办法
- 在开始时询问 `StudyNotes.md` 使用的语言（如果用户未指定）

## 使用方式

向 Claude Code 说明"使用 mydearmentor skill"或提出"维护导师式 StudyNotes"的需求。

## 仓库结构

```
mydearmentor/
├── .claude-plugin/
│   └── plugin.json              # 插件清单
└── skills/
    └── mydearmentor/
        └── SKILL.md             # 技能定义
```

## 备注

- 模板小节标题会翻译为所选语言
- 若不存在 `StudyNotes.md`，会在仓库根目录自动创建
