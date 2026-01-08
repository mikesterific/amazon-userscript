# Amazon Prime Video Fullscreen Enhancer

A Tampermonkey userscript that makes Amazon Prime Video fill the available screen space when in browser fullscreen mode, while maintaining the video's aspect ratio.

## Problem

When using browser fullscreen mode (F11 or right-click → "Enter Fullscreen") on Amazon Prime Video, the video player often appears small and doesn't utilize the full screen space, resulting in excessive black bars or letterboxing.

## Solution

This userscript automatically detects when you enter fullscreen mode and scales the video player to fill the available screen space while preserving the original aspect ratio.

## Features

- ✅ Automatically detects fullscreen mode changes
- ✅ Scales video to fill available screen space
- ✅ Maintains aspect ratio (no stretching/distortion)
- ✅ Works on Amazon Prime Video watch pages
- ✅ Handles dynamically loaded video elements
- ✅ Smooth transitions when entering/exiting fullscreen
- ✅ No interference with playback controls

## Installation

### Prerequisites

1. Install [Tampermonkey](https://www.tampermonkey.net/) browser extension:
   - [Chrome](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
   - [Firefox](https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/)
   - [Edge](https://microsoftedge.microsoft.com/addons/detail/tampermonkey/iikmkjmpaadaobahmlepeloendndfphd)
   - [Safari](https://apps.apple.com/app/tampermonkey/id1482490089)

### Install the Userscript

**Option 1: Direct Install**
1. Click on the Tampermonkey icon in your browser
2. Select "Create a new script..."
3. Delete any existing code
4. Copy and paste the contents of `amazon-fullscreen-enhancer.user.js`
5. Press `Ctrl+S` (or `Cmd+S` on Mac) to save

**Option 2: From File**
1. Open Tampermonkey Dashboard (click icon → Dashboard)
2. Go to the "Utilities" tab
3. Under "Import from file", select `amazon-fullscreen-enhancer.user.js`
4. Confirm the installation

## Usage

1. Navigate to Amazon Prime Video and start watching a video
2. Enter browser fullscreen mode:
   - Press `F11` on your keyboard, or
   - Right-click on the page and select "Enter Fullscreen"
3. The video will automatically scale to fill the screen
4. Exit fullscreen with `F11` or `Esc`

**Note:** This works with *browser* fullscreen mode, not the video player's built-in fullscreen button.

## Supported Sites

- `https://www.amazon.com/gp/video/*`
- `https://www.amazon.com/*/dp/*`
- `https://www.primevideo.com/*`

## Configuration

You can enable debug logging by setting `debug: true` in the CONFIG object at the top of the script:

```javascript
const CONFIG = {
    debug: true,  // Enable console logging
    // ...
};
```

## Troubleshooting

**Video doesn't scale in fullscreen:**
- Make sure the userscript is enabled in Tampermonkey
- Refresh the page after installing the script
- Check the browser console for any error messages

**Controls are hidden:**
- The script preserves Amazon's native controls; they should appear on mouse movement
- If controls are missing, try disabling and re-enabling the script

**Script doesn't work on certain videos:**
- Some Amazon video pages may use different DOM structures
- Enable debug mode and check the console for details
- Report issues with the specific video URL

## Technical Details

The script works by:
1. Injecting CSS styles that target video elements in fullscreen mode
2. Listening for fullscreen change events
3. Applying inline styles to ensure video fills the viewport
4. Using `object-fit: contain` to maintain aspect ratio
5. Observing DOM mutations to handle dynamically loaded videos

## License

MIT License - feel free to modify and distribute.

---

## Memory Bank

This project uses the Memory Bank system for AI-assisted development with Cursor custom modes.

### Structure
```
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
```

### Custom Agent Commands
Use these commands in Cursor to activate each mode:

| Command | Mode | Purpose |
|---------|------|---------|
| `/van` | VAN Mode | Initialize tasks, determine complexity level |
| `/plan` | PLAN Mode | Create detailed implementation plans |
| `/creative` | CREATIVE Mode | Design decisions and exploration |
| `/implement` | IMPLEMENT Mode | Code implementation following the plan |
| `/reflect` | REFLECT+ARCHIVE Mode | Task review, lessons learned, and archival |
