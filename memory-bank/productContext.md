# Product Context

## Products in This Repository

### 1. setup-memory-bank.sh

**Type**: Developer Utility / Project Scaffolding Tool

#### Description
A bash script that creates new development projects pre-configured with a "Memory Bank" AI-assisted workflow system for Cursor IDE. Generates complete directory structures, documentation templates, and custom agent commands.

#### Target Users
- Developers using Cursor IDE
- Teams wanting standardized project structure
- Anyone using AI-assisted development workflows

#### Key Features
1. **One-Command Setup**: `./setup-memory-bank.sh project-name`
2. **Memory Bank Structure**: 8 documentation templates for context management
3. **Custom Agent Commands**: `/van`, `/plan`, `/creative`, `/implement`, `/reflect`
4. **Visual Process Maps**: Mermaid diagrams for each workflow mode
5. **4-Level Complexity System**: Adapts workflow to task complexity
6. **Cross-Platform Support**: Command mappings for Windows/Unix

#### Value Proposition
Eliminates manual setup time and ensures consistent project structure optimized for AI-pair-programming workflows.

---

### 2. amazon-fullscreen-enhancer.user.js

**Type**: Browser Userscript

#### Description
A Tampermonkey userscript that enhances Amazon Prime Video's fullscreen experience by making the video player fill the available screen space while maintaining aspect ratio.

#### Target Users
- Amazon Prime Video subscribers
- Users who prefer browser fullscreen over player fullscreen
- Anyone frustrated by excessive letterboxing

#### Key Features
1. **Automatic Detection**: Activates when browser enters fullscreen
2. **Aspect Ratio Preservation**: No stretching or distortion
3. **Dynamic Content Support**: Works with SPAs and lazy-loaded videos
4. **Debug Mode**: Logging for troubleshooting
5. **Multiple URL Support**: Works on amazon.com and primevideo.com

#### Value Proposition
Better viewing experience with larger video display in browser fullscreen mode.

---

## User Flows

### setup-memory-bank.sh
```
1. User runs script with project name
2. Script creates ~/git/<project-name>/
3. Script populates all Memory Bank files
4. Script creates Cursor rules and commands
5. User opens project in Cursor
6. User starts workflow with /van command
```

### amazon-fullscreen-enhancer.user.js
```
1. User installs script in Tampermonkey
2. User navigates to Amazon Prime Video
3. User starts playing video
4. User enters browser fullscreen (F11)
5. Script automatically enhances video size
6. User enjoys larger video display
```

---

## Success Metrics

### setup-memory-bank.sh
- Projects created without errors
- Time saved vs manual setup
- Consistency of project structure

### amazon-fullscreen-enhancer.user.js
- Video fills screen as expected
- No interference with playback controls
- Works across different browsers

---

*Last Updated: 2026-01-07*
