# Kothari UI Fonts

This directory contains self-hosted fonts for maximum performance.

## Required Fonts

### Lato (UI/Body Font)
Download from: https://fonts.google.com/specimen/Lato

Required files:
- `Lato-Light.woff2` (weight: 300)
- `Lato-Regular.woff2` (weight: 400)
- `Lato-Bold.woff2` (weight: 700)
- `Lato-Black.woff2` (weight: 900)

Place in: `web/fonts/lato/`

### JetBrains Mono (Code Font)
Download from: https://www.jetbrains.com/lp/mono/

Required files:
- `JetBrainsMono-Regular.woff2` (weight: 400)
- `JetBrainsMono-Medium.woff2` (weight: 500)
- `JetBrainsMono-SemiBold.woff2` (weight: 600)
- `JetBrainsMono-Bold.woff2` (weight: 700)

Place in: `web/fonts/jetbrains-mono/`

## Quick Setup

Use the Nevaeh UI CLI to download fonts automatically:

```bash
./nevaeh fonts
```

Or using Dart directly:

```bash
dart run bin/kothari.dart fonts
```

This will automatically:
- Download JetBrains Mono from GitHub releases
- Download Lato from Google Fonts
- Extract and place all required .woff2 files in the correct directories

## Fallback Behavior

If fonts are not present, the framework will automatically fall back to system fonts:
- Lato → System sans-serif fonts
- JetBrains Mono → System monospace fonts

This ensures your app works immediately, even without fonts installed.

