#!/bin/bash

# =============================================================================
# Memory Bank Project Setup Script
# =============================================================================
# Creates a new project folder with the complete Memory Bank structure
# and Cursor rules needed for custom agents.
#
# Usage: ./setup-memory-bank.sh <project-name>
# Example: ./setup-memory-bank.sh my-new-project
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check for project name argument
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide a project name${NC}"
    echo "Usage: $0 <project-name>"
    echo "Example: $0 my-new-project"
    exit 1
fi

PROJECT_NAME="$1"
PROJECT_PATH="$HOME/git/$PROJECT_NAME"

# Check if project already exists
if [ -d "$PROJECT_PATH" ]; then
    echo -e "${RED}Error: Project '$PROJECT_NAME' already exists at $PROJECT_PATH${NC}"
    exit 1
fi

echo -e "${BLUE}Creating Memory Bank project: ${GREEN}$PROJECT_NAME${NC}"
echo -e "${BLUE}Location: ${GREEN}$PROJECT_PATH${NC}"
echo ""

# =============================================================================
# Create Directory Structure
# =============================================================================

echo -e "${YELLOW}Creating directory structure...${NC}"

mkdir -p "$PROJECT_PATH"
mkdir -p "$PROJECT_PATH/memory-bank/creative"
mkdir -p "$PROJECT_PATH/memory-bank/reflection"
mkdir -p "$PROJECT_PATH/memory-bank/archive"
mkdir -p "$PROJECT_PATH/.cursor/rules/isolation_rules/Core"
mkdir -p "$PROJECT_PATH/.cursor/rules/isolation_rules/Level1"
mkdir -p "$PROJECT_PATH/.cursor/rules/isolation_rules/Level2"
mkdir -p "$PROJECT_PATH/.cursor/rules/isolation_rules/Level3"
mkdir -p "$PROJECT_PATH/.cursor/rules/isolation_rules/Level4"
mkdir -p "$PROJECT_PATH/.cursor/rules/isolation_rules/Phases/CreativePhase"
mkdir -p "$PROJECT_PATH/.cursor/rules/isolation_rules/visual-maps/van_mode_split"

# Create .gitkeep files for empty directories
touch "$PROJECT_PATH/memory-bank/creative/.gitkeep"
touch "$PROJECT_PATH/memory-bank/reflection/.gitkeep"
touch "$PROJECT_PATH/memory-bank/archive/.gitkeep"

# =============================================================================
# Memory Bank Files
# =============================================================================

echo -e "${YELLOW}Creating Memory Bank files...${NC}"

# tasks.md
cat > "$PROJECT_PATH/memory-bank/tasks.md" << 'EOF'
# Active Tasks

## Current Task
*No active task. Use VAN mode to initialize a new task.*

## Task Queue
*Tasks waiting to be processed.*

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
EOF

# activeContext.md
cat > "$PROJECT_PATH/memory-bank/activeContext.md" << 'EOF'
# Active Context

## Current Focus
*No active focus. Initialize a task to set context.*

## Recent Changes
*Track recent changes here.*

## Open Questions
*Questions that need resolution.*

## Key Decisions
*Important decisions made during current work.*

---

*Last Updated: [Date]*
EOF

# progress.md
cat > "$PROJECT_PATH/memory-bank/progress.md" << 'EOF'
# Project Progress

## Overview
Track overall project progress and milestones here.

## Completed Features
*List completed features and their completion dates.*

## In Progress
*Current work items.*

## Upcoming
*Planned work items.*

## Metrics
- **Tasks Completed**: 0
- **Test Coverage**: N/A
- **Known Issues**: 0

---

*Last Updated: [Date]*
EOF

# projectbrief.md
cat > "$PROJECT_PATH/memory-bank/projectbrief.md" << 'EOF'
# Project Brief

## Overview
*Provide a high-level description of your project.*

## Objectives
- *Objective 1*
- *Objective 2*
- *Objective 3*

## Scope
*Define what is in and out of scope.*

## Architecture
*Describe the high-level architecture.*

## Timeline
*Project timeline and milestones.*

## Stakeholders
*Key stakeholders and their roles.*

---

*Last Updated: [Date]*
EOF

# productContext.md
cat > "$PROJECT_PATH/memory-bank/productContext.md" << 'EOF'
# Product Context

## Product Description
*Describe what the product does and its value proposition.*

## Target Users
*Who will use this product?*

## Key Features
1. **Feature 1**: Description
2. **Feature 2**: Description
3. **Feature 3**: Description

## User Flows
*Describe the main user journeys.*

## Success Metrics
*How will you measure success?*

---

*Last Updated: [Date]*
EOF

# systemPatterns.md
cat > "$PROJECT_PATH/memory-bank/systemPatterns.md" << 'EOF'
# System Patterns

This document captures common patterns and architectural decisions used throughout the codebase.

## Architecture Patterns
*Document architectural patterns used in the project.*

## Design Patterns
*Document design patterns used in the project.*

## Code Conventions
*Document coding conventions and standards.*

## Common Components
*Document reusable components and utilities.*

## Testing Patterns
*Document testing approaches and patterns.*

---

*Last Updated: [Date]*
EOF

# techContext.md
cat > "$PROJECT_PATH/memory-bank/techContext.md" << 'EOF'
# Technical Context

## Technology Stack

### Frontend
*List frontend technologies.*

### Backend
*List backend technologies.*

### Infrastructure
*List infrastructure and deployment technologies.*

## Development Environment
*Describe the development environment setup.*

## Build Process
*Describe the build and deployment process.*

## APIs and Integration
*Document external APIs and integrations.*

## Testing
*Describe testing tools and approaches.*

---

*Last Updated: [Date]*
EOF

# style-guide.md
cat > "$PROJECT_PATH/memory-bank/style-guide.md" << 'EOF'
# Style Guide

## Coding Standards
*Define coding standards for the project.*

## Naming Conventions
*Define naming conventions for files, variables, functions, etc.*

## File Organization
*Define how files and folders should be organized.*

## Best Practices
*Document best practices for the project.*

## Documentation Standards
*Define documentation requirements.*

---

*Last Updated: [Date]*
EOF

# =============================================================================
# Cursor Rules - Main Entry Point
# =============================================================================

echo -e "${YELLOW}Creating Cursor rules...${NC}"

# main.mdc
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/main.mdc" << 'EOF'
---
description: main rule
globs: main.mdc
alwaysApply: false
---
# 🔍 ISOLATION-FOCUSED MEMORY BANK SYSTEM

🚨 CRITICAL RULE: MEMORY BANK CREATION IS MANDATORY 🚨
Memory Bank MUST be created BEFORE any other operation in ANY mode
NO process can continue without verifying Memory Bank existence

> **TL;DR:** This system is designed to work with Cursor custom modes, where each mode loads only the rules it needs. The system uses visual Mermaid diagrams and selective document loading to optimize context usage.

## 🧭 MODE-SPECIFIC VISUAL MAPS

```mermaid
graph TD
    subgraph Modes["Cursor Custom Modes"]
        VAN["VAN MODE<br>Initialization"] --> PLAN["PLAN MODE<br>Task Planning"]
        PLAN --> Creative["CREATIVE MODE<br>Design Decisions"]
        Creative --> Implement["IMPLEMENT MODE<br>Code Implementation"]
        Implement --> Reflect["REFLECT MODE<br>Task Review"]
        Reflect --> Archive["ARCHIVE MODE<br>Documentation"]
    end
```

## 📋 MEMORY BANK VERIFICATION - MANDATORY IN ALL MODES

```mermaid
graph TD
    Start["Mode Activation"] --> CheckMemBank{"Memory Bank<br>Exists?"}
    
    CheckMemBank -->|"No"| CreateMemBank["CREATE MEMORY BANK<br>[CRITICAL STEP]"]
    CheckMemBank -->|"Yes"| VerifyMemBank["Verify Memory Bank<br>Structure"]
    
    CreateMemBank --> VerifyCreation{"Creation<br>Successful?"}
    VerifyCreation -->|"No"| AbortAll["⛔ ABORT ALL OPERATIONS<br>Fix Memory Bank First"]
    VerifyCreation -->|"Yes"| VerifyMemBank
    
    VerifyMemBank --> StructureCheck{"Structure<br>Valid?"}
    StructureCheck -->|"No"| FixStructure["Fix Memory Bank<br>Structure"]
    StructureCheck -->|"Yes"| ContinueMode["Continue with<br>Mode Operations"]
```

## 📚 VISUAL PROCESS MAPS

Each mode has its own visual process map:

- @VAN Mode Map - `.cursor/rules/isolation_rules/visual-maps/van-mode-map.mdc`
- @PLAN Mode Map - `.cursor/rules/isolation_rules/visual-maps/plan-mode-map.mdc`
- @CREATIVE Mode Map - `.cursor/rules/isolation_rules/visual-maps/creative-mode-map.mdc`
- @IMPLEMENT Mode Map - `.cursor/rules/isolation_rules/visual-maps/implement-mode-map.mdc`
- @REFLECT Mode Map - `.cursor/rules/isolation_rules/visual-maps/reflect-mode-map.mdc`
- @ARCHIVE Mode Map - `.cursor/rules/isolation_rules/visual-maps/archive-mode-map.mdc`

## 🔄 FILE STATE VERIFICATION

```mermaid
graph TD
    subgraph "Memory Bank Files"
        tasks["tasks.md<br>Source of Truth"]
        active["activeContext.md<br>Current Focus"]
        creative["creative-*.md<br>Design Decisions"]
        progress["progress.md<br>Implementation Status"]
    end
    
    VAN["VAN MODE"] -->|"Creates/Updates"| tasks
    VAN -->|"Creates/Updates"| active
    
    PLAN["PLAN MODE"] -->|"Reads"| tasks
    PLAN -->|"Reads"| active
    PLAN -->|"Updates"| tasks
    
    Creative["CREATIVE MODE"] -->|"Reads"| tasks
    Creative -->|"Creates"| creative
    Creative -->|"Updates"| tasks
    
    Implement["IMPLEMENT MODE"] -->|"Reads"| tasks
    Implement -->|"Reads"| creative
    Implement -->|"Updates"| tasks
    Implement -->|"Updates"| progress
```

## 💻 PLATFORM-SPECIFIC COMMANDS

| Action | Windows | Mac/Linux |
|--------|---------|-----------|
| Create file | `echo. > file.ext` | `touch file.ext` |
| Create directory | `mkdir directory` | `mkdir -p directory` |
| List files | `dir` | `ls` |
| Show file content | `type file.ext` | `cat file.ext` |

## 📋 COMPLEXITY LEVELS

| Level | Type | Description |
|-------|------|-------------|
| 1 | Quick Bug Fix | Simple, isolated fixes |
| 2 | Simple Enhancement | Single component changes |
| 3 | Intermediate Feature | Multi-component features |
| 4 | Complex System | Architectural changes |
EOF

# =============================================================================
# Core Rules
# =============================================================================

# memory-bank-paths.mdc
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Core/memory-bank-paths.mdc" << 'EOF'
---
description: Defines canonical paths for core Memory Bank files.
globs: memory-bank-paths.mdc
alwaysApply: true
---

# CORE MEMORY BANK FILE LOCATIONS

**CRITICAL:** All core Memory Bank files reside within the `memory-bank/` directory at the project root. Do NOT create or modify these files outside this directory unless explicitly instructed for archiving purposes.

* **Tasks File:** `memory-bank/tasks.md`
* **Active Context File:** `memory-bank/activeContext.md`
* **Progress File:** `memory-bank/progress.md`
* **Project Brief File:** `memory-bank/projectbrief.md`
* **Product Context File:** `memory-bank/productContext.md`
* **System Patterns File:** `memory-bank/systemPatterns.md`
* **Tech Context File:** `memory-bank/techContext.md`
* **Style Guide File:** `memory-bank/style-guide.md`
* **Creative Phase Docs:** `memory-bank/creative/creative-[feature_name].md`
* **Reflection Docs:** `memory-bank/reflection/reflection-[task_id].md`
* **Archive Directory:** `memory-bank/archive/archive-[task_id].md`

**Verification Mandate:** Before any `create_file` or `edit_file` operation on these core files, verify the path starts with `memory-bank/`.
EOF

# platform-awareness.mdc
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Core/platform-awareness.mdc" << 'EOF'
---
description: Platform detection and command adaptation
globs: platform-awareness.mdc
alwaysApply: false
---

# Platform Awareness

## Platform Detection

Detect the current platform and adapt commands accordingly:

```mermaid
graph TD
    Start["Detect Platform"] --> Check{"Check OS"}
    Check -->|"Windows"| Win["Use Windows Commands"]
    Check -->|"macOS/Linux"| Unix["Use Unix Commands"]
```

## Command Mapping

| Action | Windows | macOS/Linux |
|--------|---------|-------------|
| Create directory | `mkdir directory` | `mkdir -p directory` |
| Create file | `echo. > file` | `touch file` |
| Delete file | `del file` | `rm file` |
| Delete directory | `rmdir /s /q dir` | `rm -rf dir` |
| Copy file | `copy src dst` | `cp src dst` |
| Move file | `move src dst` | `mv src dst` |
| List files | `dir` | `ls -la` |
| Find text | `findstr pattern file` | `grep pattern file` |
| Environment var | `%VAR%` | `$VAR` |
| Path separator | `\` | `/` |
EOF

# file-verification.mdc
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Core/file-verification.mdc" << 'EOF'
---
description: File verification protocol
globs: file-verification.mdc
alwaysApply: false
---

# File Verification Protocol

## Before Any File Operation

```mermaid
graph TD
    Start["File Operation"] --> CheckExists{"File Exists?"}
    CheckExists -->|"Yes"| ReadFirst["Read Current Content"]
    CheckExists -->|"No"| CreateNew["Create New File"]
    ReadFirst --> ValidateContent["Validate Content"]
    ValidateContent --> ProceedEdit["Proceed with Edit"]
    CreateNew --> VerifyPath["Verify Path is Correct"]
    VerifyPath --> WriteContent["Write Content"]
```

## Verification Checklist

- [ ] Verify file path is correct
- [ ] Read existing content before editing
- [ ] Backup critical content before major changes
- [ ] Validate changes after writing
- [ ] Confirm no unintended modifications
EOF

# =============================================================================
# Level Workflows
# =============================================================================

# Level 1 Workflow
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Level1/workflow-level1.mdc" << 'EOF'
---
description: Workflow for Level 1 Quick Bug Fix tasks
globs: workflow-level1.mdc
alwaysApply: false
---

# Level 1: Quick Bug Fix Workflow

## Overview
Level 1 tasks are simple, isolated fixes that can be completed quickly.

## Process

```mermaid
graph TD
    Start["🐛 Bug Identified"] --> Verify["Verify Bug Location"]
    Verify --> Fix["Apply Fix"]
    Fix --> Test["Test Fix"]
    Test --> Document["Quick Documentation"]
    Document --> Complete["✅ Complete"]
```

## Characteristics
- Single file changes
- No architectural impact
- Clear, isolated scope
- Minimal testing required

## Documentation
- Brief note in progress.md
- No creative phase required
- Simple reflection optional
EOF

# Level 2 Workflow
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Level2/workflow-level2.mdc" << 'EOF'
---
description: Workflow for Level 2 Simple Enhancement tasks
globs: workflow-level2.mdc
alwaysApply: false
---

# Level 2: Simple Enhancement Workflow

## Overview
Level 2 tasks are simple enhancements affecting a single component.

## Process

```mermaid
graph TD
    Start["📝 Enhancement"] --> Plan["Basic Planning"]
    Plan --> Implement["Implementation"]
    Implement --> Test["Testing"]
    Test --> Reflect["Basic Reflection"]
    Reflect --> Archive["Archive"]
```

## Characteristics
- Single component focus
- Limited dependencies
- Straightforward implementation
- Basic testing coverage

## Documentation Requirements
- tasks.md updated with checklist
- Basic reflection document
- Archive upon completion
EOF

# Level 3 Workflow
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Level3/workflow-level3.mdc" << 'EOF'
---
description: Workflow for Level 3 Intermediate Feature tasks
globs: workflow-level3.mdc
alwaysApply: false
---

# Level 3: Intermediate Feature Workflow

## Overview
Level 3 tasks involve multi-component features requiring comprehensive planning.

## Process

```mermaid
graph TD
    Start["🔧 Feature"] --> Plan["Comprehensive Planning"]
    Plan --> Creative["Creative Phase"]
    Creative --> Implement["Phased Implementation"]
    Implement --> Test["Thorough Testing"]
    Test --> Reflect["Detailed Reflection"]
    Reflect --> Archive["Feature Archive"]
```

## Phases

### 1. Planning Phase
- Document requirements
- Identify affected components
- Create implementation checklist

### 2. Creative Phase (if needed)
- Design decisions
- Architecture considerations
- UI/UX design

### 3. Implementation Phase
- Follow checklist
- Test incrementally
- Document progress

### 4. Reflection Phase
- Capture lessons learned
- Update system patterns

### 5. Archive Phase
- Complete documentation
- Archive all artifacts
EOF

# Level 4 Workflow
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Level4/workflow-level4.mdc" << 'EOF'
---
description: Workflow for Level 4 Complex System tasks
globs: workflow-level4.mdc
alwaysApply: false
---

# Level 4: Complex System Workflow

## Overview
Level 4 tasks involve significant architectural changes or new systems.

## Process

```mermaid
graph TD
    Start["🏗️ System Change"] --> Arch["Architectural Planning"]
    Arch --> Creative["Extended Creative Phase"]
    Creative --> Phase1["Phase 1 Implementation"]
    Phase1 --> Review1["Review & Adjust"]
    Review1 --> Phase2["Phase 2 Implementation"]
    Phase2 --> Integration["Integration Testing"]
    Integration --> Reflect["Comprehensive Reflection"]
    Reflect --> Archive["Comprehensive Archive"]
```

## Key Considerations
- Multiple creative phases may be needed
- Phased implementation required
- Regular checkpoints and reviews
- Comprehensive documentation
- Impact analysis required
EOF

# =============================================================================
# Visual Maps
# =============================================================================

# VAN Mode Map
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/visual-maps/van-mode-map.mdc" << 'EOF'
---
description: Visual process map for VAN mode (Initialization)
globs: van-mode-map.mdc
alwaysApply: false
---

# VAN MODE: Initialization

```mermaid
graph TD
    Start["🚀 VAN MODE"] --> VerifyMB["Verify Memory Bank"]
    VerifyMB --> ReadContext["Read Project Context"]
    ReadContext --> GetTask["Get Task Description"]
    GetTask --> Analyze["Analyze Complexity"]
    Analyze --> Level{"Determine Level"}
    Level -->|"1"| L1["Quick Bug Fix"]
    Level -->|"2"| L2["Simple Enhancement"]
    Level -->|"3"| L3["Intermediate Feature"]
    Level -->|"4"| L4["Complex System"]
    L1 & L2 & L3 & L4 --> UpdateTasks["Update tasks.md"]
    UpdateTasks --> NextMode["Recommend Next Mode"]
```

## Steps

1. **Verify Memory Bank** - Ensure all required files exist
2. **Read Context** - Load project context files
3. **Get Task** - Understand what needs to be done
4. **Analyze** - Determine complexity level
5. **Update** - Record task in tasks.md
6. **Transition** - Move to appropriate next mode
EOF

# Plan Mode Map
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/visual-maps/plan-mode-map.mdc" << 'EOF'
---
description: Visual process map for PLAN mode
globs: plan-mode-map.mdc
alwaysApply: false
---

# PLAN MODE: Task Planning

```mermaid
graph TD
    Start["📋 PLAN MODE"] --> ReadTasks["Read tasks.md"]
    ReadTasks --> LoadContext["Load Active Context"]
    LoadContext --> Analyze["Analyze Requirements"]
    Analyze --> CreatePlan["Create Implementation Plan"]
    CreatePlan --> Checklist["Build Checklist"]
    Checklist --> Identify["Identify Creative Needs"]
    Identify --> UpdateTasks["Update tasks.md"]
    UpdateTasks --> NextMode{"Creative Needed?"}
    NextMode -->|"Yes"| Creative["→ CREATIVE MODE"]
    NextMode -->|"No"| Implement["→ IMPLEMENT MODE"]
```

## Planning Outputs
- Implementation checklist
- Files to modify list
- Dependencies identified
- Creative phase flags
EOF

# Creative Mode Map
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/visual-maps/creative-mode-map.mdc" << 'EOF'
---
description: Visual process map for CREATIVE mode
globs: creative-mode-map.mdc
alwaysApply: false
---

# CREATIVE MODE: Design Decisions

```mermaid
graph TD
    Start["🎨 CREATIVE MODE"] --> ReadTasks["Read tasks.md"]
    ReadTasks --> Identify["Identify Design Needs"]
    Identify --> Create["Create creative-*.md"]
    Create --> Explore["Explore Options"]
    Explore --> Document["Document Decisions"]
    Document --> UpdateTasks["Update tasks.md"]
    UpdateTasks --> NextMode["→ IMPLEMENT MODE"]
```

## Creative Document Structure
```markdown
# Creative Phase: [Feature Name]

## Context
[What problem are we solving?]

## Options Considered
1. Option A: [Description]
2. Option B: [Description]

## Decision
[Which option and why]

## Implementation Notes
[How to implement the decision]
```
EOF

# Implement Mode Map
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/visual-maps/implement-mode-map.mdc" << 'EOF'
---
description: Visual process map for IMPLEMENT mode
globs: implement-mode-map.mdc
alwaysApply: false
---

# IMPLEMENT MODE: Code Implementation

```mermaid
graph TD
    Start["⚙️ IMPLEMENT MODE"] --> ReadTasks["Read tasks.md"]
    ReadTasks --> ReadCreative["Read Creative Docs"]
    ReadCreative --> GetChecklist["Get Checklist"]
    GetChecklist --> Implement["Implement Changes"]
    Implement --> Test["Test Changes"]
    Test --> UpdateProgress["Update progress.md"]
    UpdateProgress --> CheckComplete{"All Done?"}
    CheckComplete -->|"No"| Implement
    CheckComplete -->|"Yes"| NextMode["→ REFLECT MODE"]
```

## Implementation Guidelines
- Follow checklist order
- Test after each change
- Update tasks.md status
- Commit working changes
EOF

# Reflect Mode Map
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/visual-maps/reflect-mode-map.mdc" << 'EOF'
---
description: Visual process map for REFLECT mode
globs: reflect-mode-map.mdc
alwaysApply: false
---

# REFLECT MODE: Task Review

```mermaid
graph TD
    Start["🔍 REFLECT MODE"] --> ReadTasks["Read tasks.md"]
    ReadTasks --> ReadProgress["Read progress.md"]
    ReadProgress --> Analyze["Analyze What Worked"]
    Analyze --> Document["Create reflection-*.md"]
    Document --> UpdatePatterns["Update systemPatterns.md"]
    UpdatePatterns --> NextMode["→ ARCHIVE MODE"]
```

## Reflection Template
```markdown
# Reflection: [Task ID]

## Summary
[What was accomplished]

## What Worked Well
- Item 1
- Item 2

## Challenges Faced
- Challenge 1: [How resolved]

## Lessons Learned
- Lesson 1
- Lesson 2

## Future Recommendations
- Recommendation 1
```
EOF

# Archive Mode Map
cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/visual-maps/archive-mode-map.mdc" << 'EOF'
---
description: Visual process map for ARCHIVE mode
globs: archive-mode-map.mdc
alwaysApply: false
---

# ARCHIVE MODE: Task Documentation

```mermaid
graph TD
    Start["📦 ARCHIVE MODE"] --> ReadAll["Read All Task Docs"]
    ReadAll --> Compile["Compile Archive Document"]
    Compile --> Create["Create archive-*.md"]
    Create --> UpdateProgress["Update progress.md"]
    UpdateProgress --> ClearTasks["Clear tasks.md"]
    ClearTasks --> Complete["✅ Task Complete"]
```

## Archive Document Structure
```markdown
# Archive: [Task ID]

## Task Summary
[Brief description]

## Implementation Details
[What was done]

## Files Changed
- file1.ext
- file2.ext

## Lessons Learned
[Key takeaways]

## Related Documents
- creative-*.md
- reflection-*.md
```
EOF

# =============================================================================
# Creative Phase Template
# =============================================================================

cat > "$PROJECT_PATH/.cursor/rules/isolation_rules/Phases/CreativePhase/creative-phase-template.mdc" << 'EOF'
---
description: Template for creative phase documents
globs: creative-phase-template.mdc
alwaysApply: false
---

# Creative Phase Template

Use this template when creating `memory-bank/creative/creative-[feature].md` files.

```markdown
# Creative Phase: [Feature Name]

## Status: [DRAFT | IN PROGRESS | COMPLETE]

## Context
[Describe the problem being solved and why a creative phase is needed]

## Requirements
- Requirement 1
- Requirement 2

## Options Considered

### Option 1: [Name]
**Description:** [What this option entails]
**Pros:**
- Pro 1
- Pro 2
**Cons:**
- Con 1

### Option 2: [Name]
**Description:** [What this option entails]
**Pros:**
- Pro 1
**Cons:**
- Con 1

## Decision
**Selected:** Option [X]
**Rationale:** [Why this option was chosen]

## Implementation Plan
1. Step 1
2. Step 2
3. Step 3

## Open Questions
- Question 1?

---
*Created: [Date]*
*Status Updated: [Date]*
```
EOF

# =============================================================================
# Custom Agent Commands
# =============================================================================

echo -e "${YELLOW}Creating custom agent commands...${NC}"

mkdir -p "$PROJECT_PATH/.cursor/commands"

# VAN Mode Command
cat > "$PROJECT_PATH/.cursor/commands/van.md" << 'EOF'
# ADAPTIVE MEMORY-BASED ASSISTANT SYSTEM - ENTRY POINT

> **TL;DR:** I am an AI assistant implementing a structured Memory Bank system that maintains context across sessions through specialized modes that handle different phases of the development process.

```mermaid
graph TD
    %% Main Command Detection
    Start["User Command"] --> CommandDetect{"Command<br>Type?"}
    
    CommandDetect -->|"VAN"| VAN["VAN Mode"]
    CommandDetect -->|"PLAN"| Plan["PLAN Mode"]
    CommandDetect -->|"CREATIVE"| Creative["CREATIVE Mode"]
    CommandDetect -->|"IMPLEMENT"| Implement["IMPLEMENT Mode"]
    CommandDetect -->|"QA"| QA["QA Mode"]
    
    %% Immediate Response Node
    VAN --> VanResp["Respond: OK VAN"]
    Plan --> PlanResp["Respond: OK PLAN"]
    Creative --> CreativeResp["Respond: OK CREATIVE"]
    Implement --> ImplResp["Respond: OK IMPLEMENT"]
    QA --> QAResp["Respond: OK QA"]
    
    %% Memory Bank Check
    VanResp --> CheckMB_Van["Check Memory Bank<br>& tasks.md Status"]
    PlanResp --> CheckMB_Plan["Check Memory Bank<br>& tasks.md Status"]
    CreativeResp --> CheckMB_Creative["Check Memory Bank<br>& tasks.md Status"]
    ImplResp --> CheckMB_Impl["Check Memory Bank<br>& tasks.md Status"]
    QAResp --> CheckMB_QA["Check Memory Bank<br>& tasks.md Status"]
    
    %% Rule Loading
    CheckMB_Van --> LoadVan["Load Rule:<br>isolation_rules/visual-maps/van_mode_split/van-mode-map"]
    CheckMB_Plan --> LoadPlan["Load Rule:<br>isolation_rules/visual-maps/plan-mode-map"]
    CheckMB_Creative --> LoadCreative["Load Rule:<br>isolation_rules/visual-maps/creative-mode-map"]
    CheckMB_Impl --> LoadImpl["Load Rule:<br>isolation_rules/visual-maps/implement-mode-map"]
    CheckMB_QA --> LoadQA["Load Rule:<br>isolation_rules/visual-maps/qa-mode-map"]
    
    %% Rule Execution with Memory Bank Updates
    LoadVan --> ExecVan["Execute Process<br>in Rule"]
    LoadPlan --> ExecPlan["Execute Process<br>in Rule"]
    LoadCreative --> ExecCreative["Execute Process<br>in Rule"]
    LoadImpl --> ExecImpl["Execute Process<br>in Rule"]
    LoadQA --> ExecQA["Execute Process<br>in Rule"]
    
    %% Memory Bank Continuous Updates
    ExecVan --> UpdateMB_Van["Update Memory Bank<br>& tasks.md"]
    ExecPlan --> UpdateMB_Plan["Update Memory Bank<br>& tasks.md"]
    ExecCreative --> UpdateMB_Creative["Update Memory Bank<br>& tasks.md"]
    ExecImpl --> UpdateMB_Impl["Update Memory Bank<br>& tasks.md"]
    ExecQA --> UpdateMB_QA["Update Memory Bank<br>& tasks.md"]
    
    %% Verification with Memory Bank Checks
    UpdateMB_Van --> VerifyVan{"Process<br>Complete?"}
    UpdateMB_Plan --> VerifyPlan{"Process<br>Complete?"}
    UpdateMB_Creative --> VerifyCreative{"Process<br>Complete?"}
    UpdateMB_Impl --> VerifyImpl{"Process<br>Complete?"}
    UpdateMB_QA --> VerifyQA{"Process<br>Complete?"}
    
    %% Outcomes
    VerifyVan -->|"Yes"| CompleteVan["VAN Process<br>Complete"]
    VerifyVan -->|"No"| RetryVan["Resume<br>VAN Process"]
    
    VerifyPlan -->|"Yes"| CompletePlan["PLAN Process<br>Complete"]
    VerifyPlan -->|"No"| RetryPlan["Resume<br>PLAN Process"]
    
    VerifyCreative -->|"Yes"| CompleteCreative["CREATIVE Process<br>Complete"]
    VerifyCreative -->|"No"| RetryCreative["Resume<br>CREATIVE Process"]
    
    VerifyImpl -->|"Yes"| CompleteImpl["IMPLEMENT Process<br>Complete"]
    VerifyImpl -->|"No"| RetryImpl["Resume<br>IMPLEMENT Process"]
    
    VerifyQA -->|"Yes"| CompleteQA["QA Process<br>Complete"]
    VerifyQA -->|"No"| RetryQA["Resume<br>QA Process"]
    
    %% Mode Transitions with Memory Bank Preservation
    CompleteVan -->|"Level 1"| TransToImpl["→ IMPLEMENT Mode"]
    CompleteVan -->|"Level 2-4"| TransToPlan["→ PLAN Mode"]
    CompletePlan --> TransToCreative["→ CREATIVE Mode"]
    CompleteCreative --> TransToImpl2["→ IMPLEMENT Mode"]
    CompleteImpl --> TransToQA["→ QA Mode"]
    
    %% Memory Bank System
    MemoryBank["MEMORY BANK<br>CENTRAL SYSTEM"] -.-> tasks["tasks.md<br>Source of Truth"]
    MemoryBank -.-> projBrief["projectbrief.md<br>Foundation"]
    MemoryBank -.-> active["activeContext.md<br>Current Focus"]
    MemoryBank -.-> progress["progress.md<br>Implementation Status"]
```

## MEMORY BANK FILE STRUCTURE

```mermaid
flowchart TD
    PB([projectbrief.md]) --> PC([productContext.md])
    PB --> SP([systemPatterns.md])
    PB --> TC([techContext.md])
    
    PC & SP & TC --> AC([activeContext.md])
    
    AC --> P([progress.md])
    AC --> Tasks([tasks.md])
```

## VERIFICATION COMMITMENT

```
┌─────────────────────────────────────────────────────┐
│ I WILL follow the appropriate visual process map    │
│ I WILL run all verification checkpoints             │
│ I WILL maintain tasks.md as the single source of    │
│ truth for all task tracking                         │
└─────────────────────────────────────────────────────┘
```
EOF

# PLAN Mode Command
cat > "$PROJECT_PATH/.cursor/commands/plan.md" << 'EOF'
# MEMORY BANK PLAN MODE

Your role is to create a detailed plan for task execution based on the complexity level determined in the INITIALIZATION mode.

```mermaid
graph TD
    Start["🚀 START PLANNING"] --> ReadTasks["📚 Read tasks.md<br>.cursor/rules/isolation_rules/main.mdc"]
    
    %% Complexity Level Determination
    ReadTasks --> CheckLevel{"🧩 Determine<br>Complexity Level"}
    CheckLevel -->|"Level 2"| Level2["📝 LEVEL 2 PLANNING"]
    CheckLevel -->|"Level 3"| Level3["📋 LEVEL 3 PLANNING"]
    CheckLevel -->|"Level 4"| Level4["📊 LEVEL 4 PLANNING"]
    
    %% Level 2 Planning
    Level2 --> L2Review["🔍 Review Code<br>Structure"]
    L2Review --> L2Document["📄 Document<br>Planned Changes"]
    L2Document --> L2Challenges["⚠️ Identify<br>Challenges"]
    L2Challenges --> L2Checklist["✅ Create Task<br>Checklist"]
    L2Checklist --> L2Update["📝 Update tasks.md<br>with Plan"]
    L2Update --> L2Verify["✓ Verify Plan<br>Completeness"]
    
    %% Level 3 Planning
    Level3 --> L3Review["🔍 Review Codebase<br>Structure"]
    L3Review --> L3Requirements["📋 Document Detailed<br>Requirements"]
    L3Requirements --> L3Components["🧩 Identify Affected<br>Components"]
    L3Components --> L3Plan["📝 Create Comprehensive<br>Implementation Plan"]
    L3Plan --> L3Challenges["⚠️ Document Challenges<br>& Solutions"]
    L3Challenges --> L3Update["📝 Update tasks.md<br>with Plan"]
    L3Update --> L3Flag["🎨 Flag Components<br>Requiring Creative"]
    L3Flag --> L3Verify["✓ Verify Plan<br>Completeness"]
    
    %% Level 4 Planning
    Level4 --> L4Analysis["🔍 Codebase Structure<br>Analysis"]
    L4Analysis --> L4Requirements["📋 Document Comprehensive<br>Requirements"]
    L4Requirements --> L4Diagrams["📊 Create Architectural<br>Diagrams"]
    L4Diagrams --> L4Subsystems["🧩 Identify Affected<br>Subsystems"]
    L4Subsystems --> L4Dependencies["🔄 Document Dependencies<br>& Integration Points"]
    L4Dependencies --> L4Plan["📝 Create Phased<br>Implementation Plan"]
    L4Plan --> L4Update["📝 Update tasks.md<br>with Plan"]
    L4Update --> L4Flag["🎨 Flag Components<br>Requiring Creative"]
    L4Flag --> L4Verify["✓ Verify Plan<br>Completeness"]
    
    %% Verification & Completion
    L2Verify & L3Verify & L4Verify --> CheckCreative{"🎨 Creative<br>Phases<br>Required?"}
    
    %% Mode Transition
    CheckCreative -->|"Yes"| RecCreative["⏭️ NEXT MODE:<br>CREATIVE MODE"]
    CheckCreative -->|"No"| RecImplement["⏭️ NEXT MODE:<br>IMPLEMENT MODE"]
```

## PLANNING APPROACH

Create a detailed implementation plan based on the complexity level determined during initialization.

### Level 2: Simple Enhancement Planning
- Overview of changes
- Files to modify
- Implementation steps
- Potential challenges
- Testing strategy

### Level 3-4: Comprehensive Planning
- Requirements analysis
- Components affected
- Architecture considerations
- Implementation strategy
- Detailed steps
- Dependencies
- Challenges & mitigations
- Creative phase components

## VERIFICATION

Before completing the planning phase, verify:
- Plan addresses all requirements
- Components requiring creative phases identified
- Implementation steps clearly defined
- Dependencies and challenges documented
EOF

# CREATIVE Mode Command
cat > "$PROJECT_PATH/.cursor/commands/creative.md" << 'EOF'
# MEMORY BANK CREATIVE MODE

Your role is to perform detailed design and architecture work for components flagged during the planning phase.

```mermaid
graph TD
    Start["🚀 START CREATIVE MODE"] --> ReadTasks["📚 Read tasks.md"]
    
    %% Initialization
    ReadTasks --> Identify["🔍 Identify Components<br>Requiring Creative Phases"]
    Identify --> Prioritize["📊 Prioritize Components"]
    
    %% Creative Phase Type Determination
    Prioritize --> TypeCheck{"🎨 Determine<br>Creative Phase<br>Type"}
    TypeCheck -->|"Architecture"| ArchDesign["🏗️ ARCHITECTURE DESIGN"]
    TypeCheck -->|"Algorithm"| AlgoDesign["⚙️ ALGORITHM DESIGN"]
    TypeCheck -->|"UI/UX"| UIDesign["🎨 UI/UX DESIGN"]
    
    %% Design Process
    ArchDesign & AlgoDesign & UIDesign --> Requirements["📋 Define Requirements"]
    Requirements --> Options["🔄 Generate Multiple Options"]
    Options --> Analysis["⚖️ Analyze Pros/Cons"]
    Analysis --> Select["✅ Select & Justify"]
    Select --> Guidelines["📝 Document Guidelines"]
    Guidelines --> Verify["✓ Verify Against Requirements"]
    
    %% Completion
    Verify --> UpdateMemoryBank["📝 Update Memory Bank"]
    UpdateMemoryBank --> MoreComponents{"📋 More<br>Components?"}
    MoreComponents -->|"Yes"| TypeCheck
    MoreComponents -->|"No"| Transition["⏭️ NEXT MODE:<br>IMPLEMENT MODE"]
```

## CREATIVE PHASE DOCUMENTATION

Document each creative phase with:

```markdown
🎨🎨🎨 ENTERING CREATIVE PHASE: [TYPE]

## Component Description
What is this component? What does it do?

## Requirements & Constraints
What must this component satisfy?

## Options Considered
### Option 1: [Name]
**Pros:** ...
**Cons:** ...

### Option 2: [Name]
**Pros:** ...
**Cons:** ...

## Recommended Approach
Selection with justification

## Implementation Guidelines
How to implement the solution

🎨🎨🎨 EXITING CREATIVE PHASE
```
EOF

# IMPLEMENT Mode Command
cat > "$PROJECT_PATH/.cursor/commands/implement.md" << 'EOF'
# MEMORY BANK BUILD MODE

Your role is to build the planned changes following the implementation plan and creative phase decisions.

```mermaid
graph TD
    Start["🚀 START BUILD MODE"] --> ReadDocs["📚 Read Reference Documents"]
    
    %% Initialization
    ReadDocs --> CheckLevel{"🧩 Determine<br>Complexity Level"}
    
    %% Level 1 Implementation
    CheckLevel -->|"Level 1<br>Quick Bug Fix"| L1Process["🔧 LEVEL 1 PROCESS"]
    L1Process --> L1Review["🔍 Review Bug Report"]
    L1Review --> L1Examine["👁️ Examine Code"]
    L1Examine --> L1Fix["⚒️ Implement Fix"]
    L1Fix --> L1Test["✅ Test Fix"]
    L1Test --> L1Update["📝 Update tasks.md"]
    
    %% Level 2 Implementation
    CheckLevel -->|"Level 2<br>Simple Enhancement"| L2Process["🔨 LEVEL 2 PROCESS"]
    L2Process --> L2Review["🔍 Review Plan"]
    L2Review --> L2Examine["👁️ Examine Code"]
    L2Examine --> L2Implement["⚒️ Implement Changes"]
    L2Implement --> L2Test["✅ Test Changes"]
    L2Test --> L2Update["📝 Update tasks.md"]
    
    %% Level 3-4 Implementation
    CheckLevel -->|"Level 3-4<br>Feature/System"| L34Process["🏗️ LEVEL 3-4 PROCESS"]
    L34Process --> L34Review["🔍 Review Plan & Creative"]
    L34Review --> L34Phase["📋 Phased Implementation"]
    L34Phase --> L34Test["✅ Test Each Phase"]
    L34Test --> L34Integration["🔄 Integration Testing"]
    L34Integration --> L34Update["📝 Update tasks.md"]
    
    %% Completion
    L1Update & L2Update & L34Update --> VerifyComplete["✅ Verify Complete"]
    VerifyComplete --> Transition["⏭️ NEXT MODE:<br>REFLECT MODE"]
```

## BUILD APPROACH

### Level 1: Quick Bug Fix
1. Review the issue carefully
2. Locate specific code causing the issue
3. Implement focused fix
4. Test thoroughly to verify resolution
5. Document the solution

### Level 2: Enhancement Build
1. Follow build plan
2. Build each component
3. Test each component
4. Verify integration
5. Document build details

### Level 3-4: Phased Build
1. Review creative phase decisions
2. Build in planned phases
3. Test each phase
4. Comprehensive integration testing
5. Detailed documentation

## VERIFICATION CHECKLIST
- All build steps completed?
- Changes thoroughly tested?
- Build meets requirements?
- Build details documented?
- tasks.md updated with status?
EOF

# REFLECT Mode Command
cat > "$PROJECT_PATH/.cursor/commands/reflect.md" << 'EOF'
# MEMORY BANK REFLECT+ARCHIVE MODE

Your role is to facilitate the **reflection** on the completed task and then **archive** the documentation.

```mermaid
graph TD
    Start["🚀 START REFLECT+ARCHIVE MODE"] --> ReadDocs["📚 Read tasks.md, progress.md"]
    
    %% Reflection Process
    ReadDocs --> VerifyImplement{"✅ Verify Implementation<br>Complete?"}
    VerifyImplement -->|"No"| ReturnImplement["⛔ Return to IMPLEMENT Mode"]
    VerifyImplement -->|"Yes"| ReflectProcess["🤔 EXECUTE REFLECTION"]
    
    ReflectProcess --> ReviewImpl["🔍 Review Implementation"]
    ReviewImpl --> DocSuccess["👍 Document Successes"]
    DocSuccess --> DocChallenges["👎 Document Challenges"]
    DocChallenges --> DocLessons["💡 Document Lessons Learned"]
    DocLessons --> DocImprovements["📈 Document Improvements"]
    DocImprovements --> CreateReflectDoc["📄 Create reflection.md"]
    CreateReflectDoc --> ReflectComplete["🏁 REFLECTION COMPLETE"]
    
    %% Archive Process
    ReflectComplete --> PromptArchive["💬 Type 'ARCHIVE NOW' to proceed"]
    PromptArchive --> ArchiveProcess["📦 EXECUTE ARCHIVING"]
    ArchiveProcess --> CreateArchiveDoc["📄 Create Archive Document"]
    CreateArchiveDoc --> UpdateTasks["📝 Update tasks.md - COMPLETE"]
    UpdateTasks --> UpdateProgress["📈 Update progress.md"]
    UpdateProgress --> UpdateActive["🔄 Update activeContext.md"]
    UpdateActive --> ArchiveComplete["🏁 ARCHIVING COMPLETE"]
    
    %% Exit
    ArchiveComplete --> SuggestNext["✅ Suggest VAN Mode for Next Task"]
```

## DEFAULT BEHAVIOR: REFLECTION

Guide the user through reviewing the completed implementation:

1. **Review Implementation** - Compare to plan
2. **Document Successes** - What worked well
3. **Document Challenges** - What was difficult
4. **Document Lessons Learned** - Key insights
5. **Document Improvements** - Process/technical improvements
6. **Create reflection.md** - Formal reflection document

## TRIGGERED BEHAVIOR: ARCHIVING (Command: ARCHIVE NOW)

1. **Verify reflection complete**
2. **Create archive document** in memory-bank/archive/
3. **Update tasks.md** - Mark COMPLETE
4. **Update progress.md** - Add archive reference
5. **Update activeContext.md** - Reset for next task
6. **Suggest VAN Mode** for next task

## VERIFICATION COMMITMENT

```
┌─────────────────────────────────────────────────────┐
│ I WILL guide the REFLECTION process first.          │
│ I WILL wait for 'ARCHIVE NOW' before archiving.     │
│ I WILL run all verification checkpoints.            │
│ I WILL maintain tasks.md as the source of truth.    │
└─────────────────────────────────────────────────────┘
```
EOF

# =============================================================================
# Project README
# =============================================================================

cat > "$PROJECT_PATH/README.md" << EOF
# $PROJECT_NAME

## Overview
*Add your project description here.*

## Getting Started
*Add setup instructions here.*

## Memory Bank
This project uses the Memory Bank system for AI-assisted development with Cursor custom modes.

### Structure
\`\`\`
memory-bank/
├── tasks.md          # Active task tracking
├── activeContext.md  # Current context
├── progress.md       # Progress tracking
├── projectbrief.md   # Project overview
├── productContext.md # Product context
├── systemPatterns.md # Architecture patterns
├── techContext.md    # Technical context
├── style-guide.md    # Coding standards
├── creative/         # Creative phase documents
├── reflection/       # Reflection documents
└── archive/          # Archived tasks
\`\`\`

### Custom Agent Commands
Use these commands in Cursor to activate each mode:

| Command | Mode | Purpose |
|---------|------|---------|
| \`/van\` | VAN Mode | Initialize tasks, determine complexity level |
| \`/plan\` | PLAN Mode | Create detailed implementation plans |
| \`/creative\` | CREATIVE Mode | Design decisions and exploration |
| \`/implement\` | IMPLEMENT Mode | Code implementation following the plan |
| \`/reflect\` | REFLECT+ARCHIVE Mode | Task review, lessons learned, and archival |

### Workflow
\`\`\`
/van → /plan → /creative → /implement → /reflect
\`\`\`

**Level 1 (Quick Bug Fix):** \`/van\` → \`/implement\` → \`/reflect\`
**Level 2-4 (Enhancements/Features):** Full workflow with all modes

## License
*Add your license here.*
EOF

# =============================================================================
# Create .gitignore
# =============================================================================

cat > "$PROJECT_PATH/.gitignore" << 'EOF'
# Dependencies
node_modules/
vendor/

# Build outputs
dist/
build/
*.o
*.pyc
__pycache__/

# IDE
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Environment
.env
.env.local
*.env

# Logs
*.log
logs/

# Coverage
coverage/
.nyc_output/
EOF

# =============================================================================
# Completion Message
# =============================================================================

echo ""
echo -e "${GREEN}✅ Memory Bank project created successfully!${NC}"
echo ""
echo -e "${BLUE}Project Location:${NC} $PROJECT_PATH"
echo ""
echo -e "${YELLOW}Directory Structure:${NC}"
echo "  memory-bank/"
echo "    ├── tasks.md"
echo "    ├── activeContext.md"
echo "    ├── progress.md"
echo "    ├── projectbrief.md"
echo "    ├── productContext.md"
echo "    ├── systemPatterns.md"
echo "    ├── techContext.md"
echo "    ├── style-guide.md"
echo "    ├── creative/"
echo "    ├── reflection/"
echo "    └── archive/"
echo "  .cursor/"
echo "    ├── commands/"
echo "    │   ├── van.md      (use: /van)"
echo "    │   ├── plan.md     (use: /plan)"
echo "    │   ├── creative.md (use: /creative)"
echo "    │   ├── implement.md(use: /implement)"
echo "    │   └── reflect.md  (use: /reflect)"
echo "    └── rules/isolation_rules/"
echo "        ├── main.mdc"
echo "        ├── Core/"
echo "        ├── Level1-4/"
echo "        └── visual-maps/"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "  1. cd $PROJECT_PATH"
echo "  2. Edit memory-bank/projectbrief.md with your project details"
echo "  3. Edit memory-bank/techContext.md with your tech stack"
echo "  4. Open in Cursor and use VAN mode to start your first task"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}"

