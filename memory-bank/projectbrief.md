# Project Brief

## Overview
A Tampermonkey userscript that enhances the Amazon Prime Video player by making it fill the available screen space when in browser fullscreen mode, while maintaining the video's aspect ratio.

## Objectives
- Create a userscript that detects Amazon Prime Video pages
- Scale the video player to fill available screen space in fullscreen mode
- Maintain video aspect ratio to prevent distortion
- Provide a seamless viewing experience without black bars

## Scope
**In Scope:**
- Tampermonkey userscript for Amazon Prime Video
- CSS-based video scaling
- Aspect ratio preservation
- Browser fullscreen mode detection

**Out of Scope:**
- Other streaming platforms
- Video quality modifications
- Playback controls modifications

## Architecture
Single JavaScript file (userscript) that:
1. Runs on Amazon Prime Video pages
2. Monitors for fullscreen state changes
3. Applies CSS transformations to scale video

## Timeline
Single session implementation

## Stakeholders
- User: Personal use for improved Amazon Prime Video viewing experience

---

*Last Updated: 2026-01-07*
