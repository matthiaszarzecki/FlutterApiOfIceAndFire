# Flutter Api Of Ice And Fire

![Bitrise Status](https://app.bitrise.io/app/35c80e8e-6ee4-46ee-9a9e-6ec560f2b6c4/status.svg?token=cTzzZ6qrkULBgNlCYFbzRg&branch=main) ![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg) [![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://twitter.com/matthias_code) [![License: CC BY-SA 3.0](https://img.shields.io/badge/License-CC%20BY--SA%203.0-red.svg)](https://creativecommons.org/licenses/by-sa/3.0/) [![Twitter Follow](https://img.shields.io/twitter/follow/matthias_code?style=social)](https://twitter.com/matthias_code) [![Mastodon Follow](https://img.shields.io/mastodon/follow/109324799475945668?domain=https%3A%2F%2Fmastodon.cloud&style=social)](https://mastodon.cloud/@matthias_code) [![Youtube Subscribe](https://img.shields.io/youtube/channel/subscribers/UCvMdsKesM05bIG0eq7M5z1g?style=social)](https://www.youtube.com/channel/UCvMdsKesM05bIG0eq7M5z1g?sub_confirmation=1)

A Flutter-App that lists the houses in A Song of Ice and Fire, taken from the [API of Ice And Fire](https://anapioficeandfire.com/). Also created separately [natively for iOS](https://github.com/matthiaszarzecki/SwiftUIApiOfIceAndFire/).

| _ | _ |
:-------------------------:|:-------------------------:
<img src="media/screenshot_01.png">|<img src="media/screenshot_02.png">|

### Contains:
- Native API Calls
- Nested Calls
- Pagination
- Graceful Failure - elements that do not exist (yet) are not shown instead of showing empty elements or errors
- Detailed House-View
- List of all Houses
- Elegant in-view error-handling on SingleHouse (no popups!)
- Small Screen Support
- Continuous Integration with BitRise
- Icons on iOS
- Unit Tests
- Error Handling

### TODO:
- Icons on Android
- Improved Accessibility Features
- Character View
- Linked nested house views
- Timeouts during calls
- Error handling for faulty json parsing
- Error handling for faulty url

### Nice to Have:
- Fastlane function to create screenshots for this readme
- CodeCov integration in CICD
- Monkey-Tests
- Fetch nested data for Characters
- UI-Tests
- Dark Color Scheme & scheme switching
- Automated tests for error-handling
- Data Caching
- Welcome Tab with House of the Day View
- Info View
- Major Houses View

### See Also
[SwiftUI Api of Ice and Fire](https://github.com/matthiaszarzecki/SwiftUIApiOfIceAndFire/)

Created by Matthias Zarzecki, 2023-06
