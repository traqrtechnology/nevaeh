# 🚀 Nevaeh UI: Framework Restructuring & CLI Plan

This document outlines the roadmap for converting the current codebase into a proper Dart package (`nevaeh`) and implementing the `nevaeh new` project generator.

## 📋 Phase 1: Restructure for Packaging

To make "Nevaeh" a reusable `dart pub` package, we must move the core source code into `lib/` so it can be imported by other projects.

1.  **Move Core Files**:
    - Move `k_classes.dart` → `lib/core/k_classes.dart`
    - Move `k_element.dart` → `lib/core/k_element.dart`
    - Move `kothari_css.dart` → `lib/core/css_generator.dart`
    - Move `kothari_scanner.dart` → `lib/core/scanner.dart`
    - Move logic from `styles.dart` → `lib/core/styles.dart`

2.  **Create Main Export**:
    - Create `lib/nevaeh.dart` that exports these files.
    - Users will import: `import 'package:nevaeh/nevaeh.dart';`

3.  **Fix Internal Imports**:
    - Update all references in `bin/` and `web/` to point to the new `lib/` locations.

---

## 🛠️ Phase 2: CLI Updates

1.  **Rename Entry Point**:
    - Rename `bin/kothari.dart` → `bin/nevaeh.dart`.
    - This ensures the command name matches the package.

2.  **Update `pubspec.yaml`**:
    - Add the `executables` entry:
      ```yaml
      executables:
        nevaeh:
      ```
    - This allows users to install it via: `dart pub global activate nevaeh`

---

## ✨ Phase 3: Implement `nevaeh new` Command

The `nevaeh new <project_name>` command will bootstrap a fresh project.

### **Command Logic:**
1.  **Create Directory**: Create a folder named `<project_name>`.
2.  **Generate `pubspec.yaml`**:
    ```yaml
    name: <project_name>
    description: A new Nevaeh UI project.
    version: 1.0.0
    environment:
      sdk: ^3.0.0
    dependencies:
      nevaeh: ^1.0.0
      http: ^1.0.0
    ```
3.  **Scaffold Directory Structure**:
    - `web/main.dart`: Entry point calling `nevaeh.dart`.
    - `web/index.html`: HTML host file.
    - `web/views/home.dart`: A starter view component.
    - `web/layouts/application.dart`: A starter layout.
    - `.gitignore`: Standard Dart ignore file.

4.  **Install Dependencies**:
    - Run `dart pub get` inside the new folder.

5.  **Setup Assets**:
    - Run `nevaeh fonts` internally to download default fonts.

---

## ⚙️ Phase 4: Update Build Process

1.  **Internalize CSS Generation**:
    - Update `nevaeh build` to use the library's internal CSS generator by default.
    - It should no longer require a `styles.dart` file in the user's project root unless they want to customize utilities.

---

## 📝 Example Usage (Future State)

```bash
# 1. Install the framework globally
dart pub global activate nevaeh

# 2. Create a new project
nevaeh new my_app

# 3. Start developing
cd my_app
nevaeh dev
```

