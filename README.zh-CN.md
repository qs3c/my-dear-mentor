# MyDearMentor Skill

一个用于 Codex 的 skill，在开发过程中持续维护导师式的 `StudyNotes.md`。

## 功能简介
- 记录开发的每个阶段（分析、实现、测试、评审、修复）的过程与结果
- 解释核心思想、决策与推理过程
- 记录本次会话中首次使用的命令行命令，并给出解释（重复命令不再记录）
- 记录问题现象、排查过程与最终的解决办法
- 在开始时询问 `StudyNotes.md` 使用的语言（如果用户未指定）

## 仓库内容
- `.codex/skills/mydearmentor/SKILL.md` —— skill 定义文件
- `mydearmentor.skill` —— 已打包的 skill 文件（本质是 zip，仅扩展名为 `.skill`）

## 安装方式
根据你的 Codex 环境，一般有两种方式：

1) **使用 Codex CLI 的技能安装命令（如果你的环境提供）**
   - 具体命令因版本/环境而异。

2) **手动安装（通用）**
   - 将 `mydearmentor.skill` 重命名为 `mydearmentor.zip` 并解压。
   - 将解压后的目录放到以下任意位置：
     - **全局**：`$CODEX_HOME/skills/mydearmentor`
     - **项目级**：`<你的仓库>/.codex/skills/mydearmentor`

安装后如有需要，请重启 Codex 会话以加载新 skill。

## 使用方式
- 向 Codex 说明“使用 mydearmentor skill”或提出“维护导师式 StudyNotes”的需求。
- skill 会询问记录语言（若用户未指定），随后在该语言中维护 `StudyNotes.md`。

## 备注
- 模板小节标题会翻译为所选语言。
- 若不存在 `StudyNotes.md`，会在仓库根目录自动创建。
