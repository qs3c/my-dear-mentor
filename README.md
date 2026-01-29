# MyDearMentor Skill

A Codex skill that maintains a mentor-style `StudyNotes.md` during software development tasks.

## What it does
- Keeps a running teaching log of each development phase (analysis, implementation, testing, review, fixes)
- Explains core ideas, decisions, and reasoning
- Records CLI commands once per session with explanations (repetitive commands are skipped)
- Captures problems encountered, investigation steps, and the exact fix that solved them
- Asks which language to use for `StudyNotes.md` at the start (unless already specified)

## Repository contents
- `.codex/skills/mydearmentor/SKILL.md` — the skill definition
- `mydearmentor.skill` — packaged skill file (zip format with a `.skill` extension)

## Installation
You have two common options, depending on your Codex setup:

1) **Use your Codex CLI skill installer (if available)**
   - The exact command depends on your Codex version/environment.

2) **Manual install (works everywhere)**
   - Rename `mydearmentor.skill` to `mydearmentor.zip` and extract it.
   - Put the extracted folder at one of these locations:
     - **Global**: `$CODEX_HOME/skills/mydearmentor`
     - **Project-local**: `<your-repo>/.codex/skills/mydearmentor`

After installation, restart your Codex session if needed so it loads the new skill.

## Usage
- Ask Codex to “use the mydearmentor skill” or request a mentor-style StudyNotes log.
- The skill will prompt for a language if none is provided, then maintain `StudyNotes.md` in that language.

## Notes
- Template headings are translated to the chosen language.
- `StudyNotes.md` is created at the repository root if missing.
