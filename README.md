# MyDearMentor

English | [中文](README.zh-CN.md)

A Claude Code plugin that maintains a mentor-style `StudyNotes.md` during software development tasks.

## Installation

```bash
/plugin install mydearmentor@qs3c/my-dear-mentor
```

## What it does

- Keeps a running teaching log of each development phase (analysis, implementation, testing, review, fixes)
- Explains core ideas, decisions, and reasoning
- Records every distinct CLI command used during the task with explanations (repeated commands are recorded once)
- Captures problems encountered, investigation steps, and the exact fix that solved them
- Asks which language to use for `StudyNotes.md` at the start (unless already specified)

## Usage

Ask Claude Code to use the mydearmentor skill, or request a mentor-style StudyNotes log.

## Repository Structure

```
mydearmentor/
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest
└── skills/
    └── mydearmentor/
        └── SKILL.md             # Skill definition
```

## Notes

- Template headings are translated to your chosen language
- `StudyNotes.md` is created at the repository root if missing
