# Active Tasks

## Current Task

## Task: Amazon Prime Video Fullscreen Enhancer
**Task ID**: TASK-2026-01-07-AMAZON-FULLSCREEN
**Complexity**: Level 2 (Simple Enhancement)
**Status**: In Progress

### Description
Create a Tampermonkey userscript that makes the Amazon Prime Video player fill the available screen space when in browser fullscreen mode, while maintaining the video's aspect ratio.

### Problem Statement
When using browser fullscreen mode on Amazon Prime Video, the video player appears small and doesn't utilize the full screen space, resulting in excessive black bars or letterboxing.

### Acceptance Criteria
- [ ] Userscript installs correctly in Tampermonkey
- [ ] Video fills available screen space in fullscreen mode
- [ ] Aspect ratio is maintained (no stretching/distortion)
- [ ] Works on Amazon Prime Video watch pages
- [ ] No interference with normal playback controls

### Implementation Checklist
- [ ] Create userscript with proper Tampermonkey headers
- [ ] Implement fullscreen detection
- [ ] Apply CSS scaling to video element
- [ ] Test on Amazon Prime Video
- [ ] Document installation instructions

### Files to Create
- `amazon-fullscreen-enhancer.user.js` - Main userscript file

### Notes
- Need to inspect Amazon's video player DOM structure
- May need to handle different video container elements
- Should work with both movies and TV shows

## Task Queue
*No additional tasks queued.*

---

*Last Updated: 2026-01-07*
