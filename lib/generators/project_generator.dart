import 'dart:io';
import 'package:path/path.dart' as path;

class ProjectGenerator {
  static Future<void> create(String projectName) async {
    final projectDir = Directory(projectName);
    if (await projectDir.exists()) {
      print('❌ Directory $projectName already exists');
      exit(1);
    }

    print('🚀 Creating new project: $projectName');
    await projectDir.create();

    // Create directory structure
    final dirs = [
      'web',
      'web/views',
      'web/layouts',
      'web/fonts',
    ];

    for (final dir in dirs) {
      await Directory(path.join(projectName, dir)).create(recursive: true);
    }

    // Create files
    await _createFile(projectName, 'pubspec.yaml', _pubspecContent(projectName));
    await _createFile(projectName, 'analysis_options.yaml', _analysisOptionsContent);
    await _createFile(projectName, 'web/index.html', _indexHtmlContent);
    await _createFile(projectName, 'web/main.dart', _mainDartContent);
    await _createFile(projectName, 'web/routes.dart', _routesDartContent);
    await _createFile(projectName, 'web/layouts/application.dart', _applicationLayoutContent);
    await _createFile(projectName, 'web/views/home.dart', _homeViewContent);
    await _createFile(projectName, 'README.md', _readmeContent(projectName));
    await _createFile(projectName, '.gitignore', _gitignoreContent);

    print('✅ Project created successfully!');
    print('');
    print('Run the following commands to get started:');
    print('  cd $projectName');
    print('  dart pub get');
    print('  nevaeh fonts');
    print('  nevaeh dev');
  }

  static Future<void> _createFile(String projectDir, String fileName, String content) async {
    final file = File(path.join(projectDir, fileName));
    await file.writeAsString(content);
    print('  Created $fileName');
  }

  static String _pubspecContent(String name) => '''
name: $name
description: A new Nevaeh UI project.
version: 1.0.0
publish_to: 'none'

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  nevaeh_ui: ^1.0.12
  http: ^1.2.0

dev_dependencies:
  lints: ^2.0.0
''';

  static const _analysisOptionsContent = '''
include: package:lints/recommended.yaml

linter:
  rules:
    avoid_print: false
    prefer_const_constructors: true
    prefer_const_literals_to_create_immutables: true
''';

  static const _gitignoreContent = '''
.dart_tool/
.packages
.pub/
build/
.DS_Store
*.js.deps
*.js.map
web/kothari.css
''';

  static String _readmeContent(String name) => '''
# $name

A web application built with [Nevaeh UI](https://github.com/kotharidev/nevaeh_ui).

## Getting Started

1. Install dependencies:
   ```bash
   dart pub get
   ```

2. Download fonts:
   ```bash
   nevaeh fonts
   ```

3. Start development server:
   ```bash
   nevaeh dev
   ```
''';

  static const _indexHtmlContent = '''
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nevaeh UI App</title>
    <link rel="stylesheet" href="kothari.css">
    <script defer src="main.js"></script>
</head>
<body class="bg-slate-50 text-slate-900">
    <div id="app"></div>
</body>
</html>
''';

  static const _mainDartContent = '''
import 'dart:html';
import 'package:nevaeh_ui/nevaeh_ui.dart';
import 'layouts/application.dart';
import 'routes.dart';

void main() {
  // Initialize CSS engine FIRST - must be done before creating any HTML elements
  KothariCSS();
  
  // Initialize router - setup routes
  setupRoutes();
  
  // Initialize router and handle initial route
  Router().init();
  
  // Ensure initial route is handled (in case hash is empty)
  // Router().init() already handles this, but this ensures it works
  Future.microtask(() {
    if (window.location.hash.isEmpty) {
      Router().navigate('/');
    }
  });
}
''';

  static const _routesDartContent = '''
// Browser-only imports - only use this file in web context
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:nevaeh_ui/nevaeh_ui.dart';
import 'layouts/application.dart';
import 'views/home.dart' as view_home;

void setupRoutes() {
  final router = Router();
  
  router.get('/', (params) async {
    final content = await view_home.render();
    ApplicationLayout.render(content, params: params);
  });
  
  // Add more routes here
  // router.get('/about', (params) async { ... });
}
''';

  static const _applicationLayoutContent = '''
import 'dart:html';
import 'package:nevaeh_ui/nevaeh_ui.dart';

class ApplicationLayout {
  static void render(KElement viewContent, {Map<String, String>? params}) {
    // Initialize CSS engine
    KothariCSS();
    
    document.body?.children.clear();
    
    // Set body styles to prevent horizontal scrolling
    document.body?.style.margin = '0';
    document.body?.style.padding = '0';
    document.body?.style.overflowX = 'hidden';
    document.body?.style.width = '100%';
    document.body?.style.maxWidth = '100%';
    
    // Simple layout - just render the view content centered
    final layout = Container(
      children: [viewContent],
      classes: ['min-h-screen', 'flex', 'items-center', 'justify-center', 'bg-gradient-to-br', 'from-pink-50', 'via-rose-50', 'to-fuchsia-50', 'p-4', 'md:p-8', 'w-full', 'max-w-full', 'overflow-x-hidden'],
    );
    
    layout.appendToBody();
  }
}
''';

  static const _homeViewContent = '''
import 'dart:html';
import 'package:nevaeh_ui/nevaeh_ui.dart';

void _setMetadata() {
  Metadata.title = 'Home - Nevaeh UI App';
  Metadata.description = 'Welcome to your Nevaeh UI application';
  Metadata.isRoot = true;
}

Future<KElement> render() async {
  _setMetadata();
  
  // Get port from URL
  final port = window.location.port.isEmpty ? '8080' : window.location.port;
  
  return Container(
    children: [
      h1(
        text: "✨ Nevaeh UI",
        classes: ['text-3xl', 'sm:text-4xl', 'md:text-5xl', 'lg:text-6xl', 'xl:text-7xl', 'font-bold', 'mb-3', 'sm:mb-4', 'text-transparent', 'bg-clip-text', 'bg-gradient-to-r', 'from-blue-500', 'via-purple-500', 'to-pink-500', 'text-center', 'px-4']
      ),
      p(
        text: "Your app is running! 🎉",
        classes: ['text-base', 'sm:text-lg', 'md:text-xl', 'lg:text-2xl', 'text-slate-700', 'mb-2', 'text-center', 'font-medium', 'px-4']
      ),
      p(
        text: "A powerful, modern web framework built entirely in Dart",
        classes: ['text-sm', 'sm:text-base', 'md:text-lg', 'lg:text-xl', 'text-slate-600', 'mb-6', 'sm:mb-8', 'max-w-2xl', 'text-center', 'mx-auto', 'px-4']
      ),
      Container(
        children: [
          p(
            text: "Running on port: \${port}",
            classes: ['text-xs', 'sm:text-sm', 'md:text-base', 'text-slate-500', 'mb-2', 'font-mono']
          ),
          p(
            text: "Page source: web/views/home.dart",
            classes: ['text-xs', 'sm:text-sm', 'md:text-base', 'text-slate-500', 'font-mono']
          ),
        ],
        classes: ['text-center', 'mt-6', 'sm:mt-8', 'px-4'],
      ),
    ],
    classes: ['flex', 'flex-col', 'items-center', 'justify-center', 'min-h-[60vh]', 'w-full', 'max-w-full', 'overflow-x-hidden', 'px-2', 'sm:px-4'],
  );
}
''';
}

