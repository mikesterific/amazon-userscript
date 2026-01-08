# Technical Context

## Technology Stack

### Shell Script: setup-memory-bank.sh
A bash script utility for project scaffolding.

**Language**: Bash  
**Size**: 1510 lines  
**Dependencies**: None (standard Unix tools)

#### Key Bash Features Used
- Heredocs (`<< 'EOF'`) for multi-line file creation
- Color escape codes for terminal output
- Argument validation (`$1`, `-z`)
- Directory existence checks (`-d`)
- `set -e` for fail-fast execution

### Userscript: amazon-fullscreen-enhancer.user.js
A Tampermonkey userscript for Amazon Prime Video.

**Runtime**: Tampermonkey/Greasemonkey  
**Language**: JavaScript (ES6+)  
**APIs Used**:
- `GM_addStyle` - CSS injection
- Fullscreen API - Browser fullscreen detection
- MutationObserver - Dynamic DOM monitoring

## Development Environment

### Requirements
- Bash shell (macOS/Linux/WSL)
- Text editor or IDE
- Browser with Tampermonkey extension (for userscript)

### Project Structure
```
amazon-userscript/
├── setup-memory-bank.sh          # Project scaffolding tool
├── amazon-fullscreen-enhancer.user.js  # Browser userscript
├── memory-bank/                  # Documentation hub
│   ├── tasks.md
│   ├── activeContext.md
│   ├── progress.md
│   ├── projectbrief.md
│   ├── productContext.md
│   ├── systemPatterns.md
│   ├── techContext.md
│   ├── style-guide.md
│   ├── creative/
│   ├── reflection/
│   └── archive/
├── README.md
└── .gitignore
```

## Build Process

### setup-memory-bank.sh
No build required - executable bash script.
```bash
chmod +x setup-memory-bank.sh
./setup-memory-bank.sh <project-name>
```

### Userscript
No build required - installed directly in Tampermonkey.

## Testing

### Shell Script Testing
- Run with test project name
- Verify all files created correctly
- Test on different shells (bash, zsh)

### Userscript Testing
- Install in Tampermonkey
- Navigate to Amazon Prime Video
- Enter fullscreen mode
- Verify video fills screen

---

*Last Updated: 2026-01-07*
