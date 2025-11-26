## 1.0.12

- Enhanced default home page with comprehensive welcome/onboarding experience:
  - Beautiful hero section with working interactive button
  - Complete Quick Start Guide with 3 sections:
    1. How to create views (`nevaeh generate view`)
    2. How routes work (auto-generated, hash-based)
    3. How to write your first code (with examples)
  - Code examples showing actual syntax
  - Clear, actionable instructions for new developers
  - Professional design that demonstrates Nevaeh UI capabilities

## 1.0.11

- Enhanced default home page - now shows a beautiful welcome/onboarding page with:
  - Nevaeh UI branding and description
  - Clear next steps for developers
  - Instructions on how to create views and start building
  - Links to documentation
- Improved first-time user experience

## 1.0.10

- Fixed `nevaeh version` command - now properly included in published package
- Version command reads from pubspec.yaml and displays current version

## 1.0.9

- Added `nevaeh version` command - check installed version (`nevaeh version`, `nevaeh --version`, or `nevaeh -v`)
- Version command reads from pubspec.yaml and displays current version

## 1.0.8

- Fixed route generator - now creates `setupRoutes()` function that matches `main.dart`
- Fixed compilation errors when no views exist - creates default welcome route
- Route generator now works correctly with 0 views (shows helpful message)

## 1.0.7

- Added `nevaeh update` command - easily update nevaeh_ui to latest version
- Fixed nested `web/web/` folder issue - prevents duplicate web directories
- Fixed `nevaeh serve` command - now automatically installs dependencies and starts server
- Improved error handling - compilation errors no longer block server startup
- Added automatic `dart pub get` before compilation
- Cleaned up documentation - removed maintainer-only files
- Improved README navigation and structure
- Fixed CLI activation and path resolution

## 1.0.6

- Fixed `nevaeh new app` command - now works correctly
- Updated project generator to use nevaeh_ui ^1.0.5
- Updated wrapper scripts to reference correct bin/nevaeh.dart
- Improved CLI error handling and help messages

## 1.0.0

- Initial version.
