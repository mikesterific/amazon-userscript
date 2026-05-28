# Active Tasks

## Current Task
## Task: Add Human Command Payload Metadata
**Task ID**: TASK-2026-05-27-HUMAN-COMMAND-PAYLOAD
**Complexity**: Level 1
**Status**: Complete

### Description
Add metadata to `.cursor/commands/human.md` so the Human Writing Mode command is included in the command payload.

### Acceptance Criteria
- [x] `.cursor/commands/human.md` has command frontmatter.
- [x] Command description explains when to use Human Writing Mode.
- [x] `setup-memory-bank.sh` creates the `/human` command in new projects.

### Implementation Checklist
- [x] Inspect existing command metadata patterns.
- [x] Add `name` and `description` frontmatter to `human.md`.
- [x] Add the Human command payload to `setup-memory-bank.sh`.
- [x] Update generated README and completion output to list `/human`.

### Files Modified
- `.cursor/commands/human.md`
- `setup-memory-bank.sh`

### Notes
VAN classified this as a Level 1 quick command metadata update. Follow-up included updating the scaffolding script so future projects receive the command.

## Task Queue
*Tasks waiting to be processed.*

---

## Archived Tasks

| Task ID | Description | Archived |
|---------|-------------|----------|
| TASK-2026-01-07-AMAZON-FULLSCREEN | Amazon Prime Video Fullscreen Enhancer | 2026-01-07 |
| TASK-2026-01-07-SHELL-SCRIPT-DOCS | setup-memory-bank.sh Documentation | 2026-01-07 |

**Archive Location**: `memory-bank/archive/archive-2026-01-07-amazon-userscript.md`

---

## Task Template

When starting a new task, use this format:

```markdown
## Task: [Task Name]
**Task ID**: TASK-YYYY-MM-DD-DESCRIPTION
**Complexity**: Level [1-4]
**Status**: [Not Started | In Progress | Complete]

### Description
[Brief description of the task]

### Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

### Implementation Checklist
- [ ] Step 1
- [ ] Step 2

### Files to Modify
- `path/to/file1`
- `path/to/file2`

### Notes
[Any additional notes]
```

---

*Last Updated: 2026-01-07*
