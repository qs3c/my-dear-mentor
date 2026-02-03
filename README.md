# MyDearMentor

English | [中文](README.zh-CN.md)

A skill that maintains a mentor-style `StudyNotes.md` during software development tasks. Works with Claude Code, Codex, and Gemini CLI.

## Installation

### Claude Code (recommended)

```bash
/plugin install mydearmentor@qs3c/my-dear-mentor
```

### Codex / Gemini CLI

Use the install script:

```bash
# Unix/Linux/macOS
./scripts/install.sh -a codex    # Codex only
./scripts/install.sh -a gemini   # Gemini CLI only
./scripts/install.sh -a all      # All agents

# Windows PowerShell
.\scripts\install.ps1 -Agent codex
.\scripts\install.ps1 -Agent gemini
.\scripts\install.ps1 -Agent all
```

Options:
- `-a / -Agent`: claude, codex, gemini, or all (default: all)
- `-s / -Scope`: global or project (default: global)
- `-p / -ProjectPath`: project path for project scope

## What it does

- Keeps a running teaching log of each development phase (analysis, implementation, testing, review, fixes)
- Explains core ideas, decisions, and reasoning
- Records every distinct CLI command used during the task with explanations (repeated commands are recorded once)
- Captures problems encountered, investigation steps, and the exact fix that solved them
- Asks which language to use for `StudyNotes.md` at the start (unless already specified)

## Usage

Ask your AI agent to use the mydearmentor skill, or request a mentor-style StudyNotes log.

## Notes

- Template headings are translated to your chosen language
- `StudyNotes.md` is created at the repository root if missing
