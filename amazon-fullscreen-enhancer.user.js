// ==UserScript==
// @name         Amazon Prime Video Fullscreen Enhancer
// @namespace    https://github.com/michaeljones/amazon-userscript
// @version      1.0.0
// @description  Makes Amazon Prime Video fill the screen in browser fullscreen mode while maintaining aspect ratio
// @author       Michael Jones
// @match        https://www.amazon.com/gp/video/*
// @match        https://www.amazon.com/*/dp/*
// @match        https://www.primevideo.com/*
// @grant        GM_addStyle
// @run-at       document-idle
// ==/UserScript==

(function() {
    'use strict';

    // Configuration
    const CONFIG = {
        // Enable debug logging
        debug: false,
        // Polling interval for video element detection (ms)
        pollInterval: 500,
        // Maximum polling attempts
        maxPollAttempts: 60,
        // CSS transition duration for smooth scaling
        transitionDuration: '0.2s'
    };

    // Debug logger
    const log = (...args) => {
        if (CONFIG.debug) {
            console.log('[Amazon Fullscreen Enhancer]', ...args);
        }
    };

    // CSS styles for fullscreen video enhancement
    const fullscreenStyles = `
        /* Fullscreen enhancement styles */
        :fullscreen video,
        ::backdrop video,
        *:fullscreen video {
            width: 100vw !important;
            height: 100vh !important;
            max-width: 100vw !important;
            max-height: 100vh !important;
            object-fit: contain !important;
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            z-index: 2147483647 !important;
        }

        /* Target Amazon's video player containers in fullscreen */
        :fullscreen .webPlayerContainer,
        :fullscreen .cascadesContainer,
        :fullscreen .rendererContainer,
        :fullscreen [data-testid="video-player"],
        :fullscreen .atvwebplayersdk-overlays-container,
        :fullscreen .atvwebplayersdk-player-container {
            width: 100vw !important;
            height: 100vh !important;
            max-width: 100vw !important;
            max-height: 100vh !important;
        }

        /* Ensure video wrapper fills container */
        :fullscreen .webPlayerElement,
        :fullscreen .rendererContainer video {
            width: 100% !important;
            height: 100% !important;
            object-fit: contain !important;
        }

        /* Fix for nested containers */
        :fullscreen .webPlayerSDKContainer,
        :fullscreen .webPlayerSDKUiContainer {
            width: 100% !important;
            height: 100% !important;
        }

        /* Smooth transition when entering/exiting fullscreen */
        video {
            transition: all ${CONFIG.transitionDuration} ease-in-out;
        }
    `;

    // Apply base styles
    function injectStyles() {
        GM_addStyle(fullscreenStyles);
        log('Styles injected');
    }

    // Find video element with polling
    function findVideoElement(callback, attempts = 0) {
        const video = document.querySelector('video');
        
        if (video) {
            log('Video element found');
            callback(video);
            return;
        }

        if (attempts < CONFIG.maxPollAttempts) {
            setTimeout(() => findVideoElement(callback, attempts + 1), CONFIG.pollInterval);
        } else {
            log('Video element not found after max attempts');
        }
    }

    // Apply direct styles to video element
    function applyVideoStyles(video) {
        if (document.fullscreenElement) {
            video.style.cssText = `
                width: 100vw !important;
                height: 100vh !important;
                max-width: 100vw !important;
                max-height: 100vh !important;
                object-fit: contain !important;
                position: fixed !important;
                top: 0 !important;
                left: 0 !important;
            `;
            log('Applied fullscreen styles to video');
        }
    }

    // Remove direct styles from video element
    function removeVideoStyles(video) {
        video.style.cssText = '';
        log('Removed fullscreen styles from video');
    }

    // Handle fullscreen change
    function handleFullscreenChange(video) {
        if (document.fullscreenElement) {
            log('Entered fullscreen');
            applyVideoStyles(video);
            
            // Also style parent containers
            styleParentContainers(video);
        } else {
            log('Exited fullscreen');
            removeVideoStyles(video);
        }
    }

    // Style parent containers for better fullscreen support
    function styleParentContainers(video) {
        let parent = video.parentElement;
        const maxDepth = 10;
        let depth = 0;

        while (parent && depth < maxDepth) {
            if (parent.classList.contains('webPlayerContainer') ||
                parent.classList.contains('cascadesContainer') ||
                parent.classList.contains('rendererContainer') ||
                parent.hasAttribute('data-testid')) {
                
                parent.style.cssText = `
                    width: 100vw !important;
                    height: 100vh !important;
                    max-width: 100vw !important;
                    max-height: 100vh !important;
                `;
                log('Styled parent container:', parent.className || parent.tagName);
            }
            parent = parent.parentElement;
            depth++;
        }
    }

    // Set up fullscreen event listeners
    function setupFullscreenListeners(video) {
        // Standard fullscreen change event
        document.addEventListener('fullscreenchange', () => handleFullscreenChange(video));
        
        // Webkit prefix (Safari)
        document.addEventListener('webkitfullscreenchange', () => handleFullscreenChange(video));
        
        // Mozilla prefix (older Firefox)
        document.addEventListener('mozfullscreenchange', () => handleFullscreenChange(video));
        
        // MS prefix (older IE/Edge)
        document.addEventListener('MSFullscreenChange', () => handleFullscreenChange(video));

        log('Fullscreen listeners attached');
    }

    // Watch for new video elements being added to the DOM
    function setupVideoObserver() {
        const observer = new MutationObserver((mutations) => {
            for (const mutation of mutations) {
                for (const node of mutation.addedNodes) {
                    if (node.nodeName === 'VIDEO') {
                        log('New video element detected');
                        setupFullscreenListeners(node);
                        if (document.fullscreenElement) {
                            applyVideoStyles(node);
                        }
                    } else if (node.querySelector) {
                        const video = node.querySelector('video');
                        if (video) {
                            log('Video element found in added node');
                            setupFullscreenListeners(video);
                            if (document.fullscreenElement) {
                                applyVideoStyles(video);
                            }
                        }
                    }
                }
            }
        });

        observer.observe(document.body, {
            childList: true,
            subtree: true
        });

        log('Video observer set up');
    }

    // Initialize the script
    function init() {
        log('Initializing Amazon Prime Video Fullscreen Enhancer');
        
        // Inject CSS styles
        injectStyles();
        
        // Set up observer for dynamically added videos
        setupVideoObserver();
        
        // Find and set up existing video element
        findVideoElement((video) => {
            setupFullscreenListeners(video);
            
            // Check if already in fullscreen
            if (document.fullscreenElement) {
                applyVideoStyles(video);
            }
        });

        log('Initialization complete');
    }

    // Run initialization
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();

