# Technical Context

## Technology Stack
- **Language**: JavaScript (ES6+)
- **Platform**: Tampermonkey browser extension
- **Target**: Amazon Prime Video web player
- **Browser**: Chrome (primary), should work in Firefox with Greasemonkey

## Key Technologies

### Tampermonkey
- Userscript manager for browsers
- Allows custom JavaScript injection on web pages
- Uses special metadata headers for configuration

### Fullscreen API
- `document.fullscreenElement` - detects fullscreen state
- `fullscreenchange` event - monitors fullscreen transitions

### CSS Transforms
- `object-fit: contain` - maintains aspect ratio
- `transform: scale()` - scales video element
- `width/height: 100%` - fills container

## Development Environment
- Workspace: `/Users/michaeljones/git/amazon-userscript`
- Testing: Chrome browser with Tampermonkey installed

## Technical Constraints
- Must work within Tampermonkey's sandbox
- Cannot modify Amazon's server-side code
- Must handle dynamic DOM changes (React/SPA)

---

*Last Updated: 2026-01-07*
