#!/usr/bin/env dart

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:archive/archive.dart';
import 'package:nevaeh_ui/generators/view_generator.dart';
import 'package:nevaeh_ui/generators/layout_generator.dart';
import 'package:nevaeh_ui/generators/route_generator.dart';
import 'package:nevaeh_ui/generators/project_generator.dart';
import 'package:nevaeh_ui/utils/html_generator.dart';
import 'package:nevaeh_ui/src/core/css_builder.dart';

/// Nevaeh UI CLI Tool
/// 
/// Usage:
///   nevaeh create <name>  - Create a new Nevaeh UI project
///   nevaeh new <name>     - Alias for create (Rails-style)
///   nevaeh fonts          - Download and install Kothari UI fonts
///   nevaeh build          - Build CSS from Dart files
///   nevaeh compile        - Compile Dart to JavaScript
///   nevaeh dev            - Build CSS and compile JS (full dev workflow)
///   nevaeh generate view  - Generate a new view (Dart + HTML files)
void main(List<String> args) async {
  if (args.isEmpty) {
    _printUsage();
    exit(0);
  }

  final command = args[0];

  switch (command) {
    case 'create':
    case 'new':
      if (args.length < 2) {
        _printErrorBanner();
        print('❌ Usage: nevaeh create <project_name>');
        print('   or:    nevaeh new <project_name>');
        exit(1);
      }
      await ProjectGenerator.create(args[1]);
      break;
    case 'fonts':
      _printFontsBanner();
      await _downloadFonts();
      break;
    case 'build':
      _printBuildBanner();
      await _buildCSS();
      break;
    case 'compile':
      _printCompileBanner();
      await _compileJS();
      break;
    case 'analyze':
      _printAnalyzeBanner();
      await _analyzeCode(args.length > 1 ? args.sublist(1) : []);
      break;
    case 'dev':
      _printDevBanner();
      await _ensureDependencies();
      await RouteGenerator.generate();
      await _buildCSS();
      await _ensureLayoutExists();
      await _generateIndexHtml();
      await _compileJS();
      _printSuccessBanner();
      print('   Run: python3 -m http.server 8080');
      print('   Then open: http://localhost:8080');
      break;
    case 'generate':
      if (args.length < 2) {
        _printErrorBanner();
        print('❌ Usage: nevaeh generate view <name> [--path <folder>]');
        exit(1);
      }
      await _handleGenerate(args.sublist(1));
      break;
    case 'server':
    case 'serve':
      _printServerBanner();
      await _ensureDependencies();
      await RouteGenerator.generate();
      await _buildCSS();
      await _ensureLayoutExists();
      await _generateIndexHtml();
      await _compileJS();
      await _startServer();
      break;
    case 'update':
      _printUpdateBanner();
      await _updateNevaehUi();
      break;
    case 'version':
    case '--version':
    case '-v':
      _printVersion();
      break;
    case 'help':
    case '--help':
    case '-h':
      _printUsage();
      break;
    default:
      _printErrorBanner();
      print('❌ Unknown command: $command');
      print('');
      _printUsage();
      exit(1);
  }
}

// ... Banners and Helper Functions ...

// ANSI Color Codes
const String reset = '\x1B[0m';
const String bright = '\x1B[1m';
const String red = '\x1B[31m';
const String green = '\x1B[32m';
const String yellow = '\x1B[33m';
const String blue = '\x1B[34m';
const String magenta = '\x1B[35m';
const String cyan = '\x1B[36m';
const String white = '\x1B[37m';

void _printUsage() {
  print('');
  print('${bright}${magenta}╔═══════════════════════════════════════════════════════════════╗${reset}');
  print('${bright}${magenta}║${reset}                                                               ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}  ${bright}${cyan}   _   _                     _        _   _ ___ ${reset}  ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}  ${bright}${cyan}  | \ | | _____   ____ _  ___| |__     | | | |_ _|${reset}  ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}  ${bright}${cyan}  |  \| |/ _ \ \ / / _` |/ _ \ `_ \    | | | || | ${reset}  ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}  ${bright}${cyan}  | |\  |  __/\ V / (_| |  __/ | | |   | |_| || | ${reset}  ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}  ${bright}${cyan}  |_| \_|\___| \_/ \__,_|\___|_| |_|    \___/|___|${reset}  ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}                                                               ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}  ${bright}${white}The Complete Dart Web Framework${reset}                        ${bright}${magenta}║${reset}');
  print('${bright}${magenta}║${reset}                                                               ${bright}${magenta}║${reset}');
  print('${bright}${magenta}╚═══════════════════════════════════════════════════════════════╝${reset}');
  print('');
  print('${bright}${cyan}Commands:${reset}');
  print('  ${green}nevaeh create <name>${reset}   ${yellow}🚀${reset} Create a new project');
  print('  ${green}nevaeh new <name>${reset}       ${yellow}🚀${reset} Alias for create');
  print('  ${green}nevaeh serve${reset}           ${yellow}🌐${reset} Start dev server');
  print('  ${green}nevaeh generate view${reset}   ${yellow}📄${reset} Generate a new view');
  print('  ${green}nevaeh build${reset}           ${yellow}🎨${reset} Build CSS');
  print('  ${green}nevaeh compile${reset}         ${yellow}⚡${reset} Compile JS');
  print('  ${green}nevaeh fonts${reset}           ${yellow}✨${reset} Download fonts');
  print('  ${green}nevaeh update${reset}          ${yellow}🔄${reset} Update nevaeh_ui to latest');
  print('  ${green}nevaeh version${reset}         ${yellow}📦${reset} Show installed version');
  print('');
}

void _printFontsBanner() => print('${bright}${cyan}🎨 Downloading Nevaeh UI Fonts...${reset}\n');
void _printBuildBanner() => print('${bright}${blue}🎨 Building CSS...${reset}\n');
void _printCompileBanner() => print('${bright}${green}⚡ Compiling JavaScript...${reset}\n');
void _printDevBanner() => print('${bright}${cyan}🚀 Starting Dev Workflow...${reset}\n');
void _printServerBanner() => print('${bright}${green}🌐 Starting Server...${reset}\n');
void _printErrorBanner() => print('${bright}${red}❌ Error Occurred${reset}\n');
void _printAnalyzeBanner() => print('${bright}${cyan}🔍 Analyzing Code...${reset}\n');
void _printGenerateBanner() => print('${bright}${magenta}📄 Generating...${reset}\n');
void _printSuccessBanner() => print('${bright}${green}✨ Done!${reset}\n');
void _printUpdateBanner() => print('${bright}${cyan}🔄 Updating Nevaeh UI...${reset}\n');

void _printVersion() {
  // Read version from pubspec.yaml in the nevaeh_ui package
  try {
    // Try to find pubspec.yaml in common locations
    final possiblePaths = [
      'pubspec.yaml',
      '../pubspec.yaml',
      '../../pubspec.yaml',
    ];
    
    for (final path in possiblePaths) {
      final pubspecFile = File(path);
      if (pubspecFile.existsSync()) {
        final content = pubspecFile.readAsStringSync();
        final nameMatch = RegExp(r'^name:\s*nevaeh_ui', multiLine: true).hasMatch(content);
        if (nameMatch) {
          final versionMatch = RegExp(r'^version:\s*([\d.]+)', multiLine: true).firstMatch(content);
          if (versionMatch != null) {
            print('${bright}${green}Nevaeh UI version: ${versionMatch.group(1)}${reset}');
            return;
          }
        }
      }
    }
  } catch (e) {
    // Fall through to default
  }
  
  // If we can't find it, show how to check
  print('${bright}${green}Nevaeh UI CLI${reset}');
  print('   Check installed version: ${green}dart pub global list | grep nevaeh${reset}');
}

Future<void> _buildCSS() async {
  // Use the library's CssBuilder directly
  try {
    CssBuilder.build('web/kothari.css');
  } catch (e) {
    print('${red}Error building CSS: $e${reset}');
    exit(1);
  }
}

Future<void> _ensureDependencies() async {
  if (!await File('pubspec.yaml').exists()) {
    return; // Not in a Dart project
  }
  
  print('   Checking dependencies...');
  final result = await Process.run('dart', ['pub', 'get'], runInShell: false);
  
  if (result.exitCode != 0) {
    print('   ${yellow}⚠️ Warning: dart pub get had issues${reset}');
    stderr.write(result.stderr);
  } else {
    print('   ${green}✓ Dependencies ready${reset}');
  }
}

Future<void> _compileJS() async {
  if (!await File('web/main.dart').exists()) {
    print('${red}Error: web/main.dart not found.${reset}');
    print('${yellow}   Server will start, but JavaScript won\'t work.${reset}\n');
    return;
  }
  
  print('   Running dart compile js...');
  final result = await Process.run('dart', [
    'compile',
    'js',
    'web/main.dart',
    '-o',
    'web/main.js'
  ], runInShell: false);
  
  if (result.exitCode != 0) {
    print('${red}   ❌ Compilation failed:${reset}');
    stderr.write(result.stderr);
    stdout.write(result.stdout);
    print('');
    print('${yellow}   ⚠️  Server will still start, but JavaScript may not work.${reset}');
    print('   ${yellow}   Fix errors above and run: nevaeh compile${reset}\n');
  } else {
    print('   ${green}✓ Compilation successful${reset}');
  }
}

Future<void> _generateIndexHtml() async {
  try {
    await HtmlGenerator.writeHtmlFile(
      outputPath: 'web/index.html',
      dartFileName: 'main.dart',
      relativePath: 'main.js',
    );
    print('   ${green}✓ Generated web/index.html${reset}');
  } catch (e) {
    print('   ${yellow}⚠️ Warning: Could not generate index.html: $e${reset}');
  }
}

Future<void> _ensureLayoutExists() async {
  final layoutFile = File('web/layouts/application.dart');
  if (!await layoutFile.exists()) {
    print('   Generating application layout...');
    await LayoutGenerator.generateApplicationLayout();
  }
}

Future<void> _handleGenerate(List<String> args) async {
  final subcommand = args[0];
  
  if (subcommand == 'view') {
    if (args.length < 2) {
      print('❌ Usage: nevaeh generate view <name> [--path <folder>]');
      exit(1);
    }
    
    String? customPath;
    String viewName = args[1];
    
    for (int i = 2; i < args.length; i++) {
      if (args[i] == '--path' && i + 1 < args.length) {
        customPath = args[i + 1];
        break;
      }
    }
    
    _printGenerateBanner();
    await _ensureLayoutExists();
    await ViewGenerator.generate(
      viewName: viewName,
      basePath: customPath,
    );
    print('');
    print('${bright}${green}✨ View generated successfully!${reset}');
  } else {
    print('❌ Unknown generate subcommand: $subcommand');
    exit(1);
  }
}

Future<void> _startServer({int port = 8080}) async {
  try {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
    print('${bright}${green}✅ Server running at: http://localhost:$port${reset}');
    print('   Serving directory: ${Directory.current.path}');
    print('${bright}${cyan}   Press Ctrl+C to stop${reset}\n');

    await for (HttpRequest request in server) {
      // Basic CORS
      request.response.headers.add('Access-Control-Allow-Origin', '*');
      
      if (request.method == 'OPTIONS') {
        request.response.close();
        continue;
      }

      var pathString = request.uri.path;
      
      // Serve index.html for root
      if (pathString == '/' || pathString == '/index.html') {
         final indexFile = File('web/index.html');
         if (await indexFile.exists()) {
           request.response.headers.contentType = ContentType.html;
           await indexFile.openRead().pipe(request.response);
         } else {
           request.response.statusCode = HttpStatus.notFound;
           request.response.write('404: web/index.html not found. Run nevaeh dev.');
           await request.response.close();
         }
         continue;
      }

      if (pathString.startsWith('/')) pathString = pathString.substring(1);
      
      var file = File(pathString);
      if (!await file.exists()) {
        final webFile = File('web/$pathString');
        if (await webFile.exists()) {
          file = webFile;
        }
      }

      if (await file.exists()) {
        final ext = path.extension(file.path).toLowerCase();
        final mimeTypes = {
          '.html': 'text/html',
          '.js': 'application/javascript',
          '.css': 'text/css',
          '.png': 'image/png',
          '.jpg': 'image/jpeg',
          '.jpeg': 'image/jpeg',
          '.svg': 'image/svg+xml',
          '.woff2': 'font/woff2',
          '.json': 'application/json',
        };
        
        request.response.headers.contentType = ContentType.parse(mimeTypes[ext] ?? 'application/octet-stream');
        await file.openRead().pipe(request.response);
      } else {
        request.response.statusCode = HttpStatus.notFound;
        request.response.write('404 Not Found');
        await request.response.close();
      }
    }
  } catch (e) {
    print('${bright}${red}❌ Failed to start server: $e${reset}');
    exit(1);
  }
}

// Re-implement analyze and download fonts logic or keep minimal for now. 
// To save space, I'll omit the full implementation of analyze/fonts unless requested, 
// but assuming we want to keep feature parity:

Future<void> _downloadFonts() async {
  print('${bright}${cyan}🎨 Downloading Nevaeh UI Fonts...${reset}\n');

  final latoDir = Directory(path.join('web', 'fonts', 'lato'));
  final jetbrainsDir = Directory(path.join('web', 'fonts', 'jetbrains-mono'));

  // Create directories
  latoDir.createSync(recursive: true);
  jetbrainsDir.createSync(recursive: true);

  print('📁 Created font directories\n');

  // Download JetBrains Mono
  print('📥 Downloading JetBrains Mono...');
  try {
    await _downloadJetBrainsMono(jetbrainsDir);
    print('✅ JetBrains Mono downloaded successfully!\n');
  } catch (e) {
    print('⚠️  Failed to download JetBrains Mono: $e');
    print('   Please download manually from: https://www.jetbrains.com/lp/mono/\n');
  }

  // Download Lato
  print('📥 Downloading Lato...');
  try {
    await _downloadLato(latoDir);
    print('✅ Lato downloaded successfully!\n');
  } catch (e) {
    print('⚠️  Failed to download Lato: $e');
    print('   Please download manually from: https://fonts.google.com/specimen/Lato\n');
  }

  print('✨ Font setup complete!');
  print('   Fonts are now self-hosted and will load fast from your domain.');
  print('   No external dependencies required!');
}

Future<void> _downloadJetBrainsMono(Directory targetDir) async {
  // JetBrains Mono GitHub release
  const version = '2.304';
  final url =
      'https://github.com/JetBrains/JetBrainsMono/releases/download/v$version/JetBrainsMono-$version.zip';

  print('   Fetching from GitHub...');
  final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) {
    throw Exception('Failed to download: HTTP ${response.statusCode}');
  }

  print('   Extracting archive...');
  final archive = ZipDecoder().decodeBytes(response.bodyBytes);

  final requiredFiles = [
    'JetBrainsMono-Regular.woff2',
    'JetBrainsMono-Medium.woff2',
    'JetBrainsMono-SemiBold.woff2',
    'JetBrainsMono-Bold.woff2',
  ];

  int found = 0;
  for (final file in archive) {
    if (file.isFile) {
      final fileName = path.basename(file.name);
      if (requiredFiles.contains(fileName)) {
        final outputFile = File(path.join(targetDir.path, fileName));
        outputFile.writeAsBytesSync(file.content as List<int>);
        print('   ✓ $fileName');
        found++;
      }
    }
  }

  if (found < requiredFiles.length) {
    throw Exception('Not all required JetBrains Mono files were found in archive');
  }
}

Future<void> _downloadLato(Directory targetDir) async {
  // Lato from Google Fonts - fetch CSS and extract woff2 URLs
  print('   Fetching Lato font information from Google Fonts...');

  try {
    // Get the CSS from Google Fonts API
    const cssUrl =
        'https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap';
    final cssResponse = await http.get(Uri.parse(cssUrl));

    if (cssResponse.statusCode != 200) {
      throw Exception('Failed to fetch font CSS (HTTP ${cssResponse.statusCode})');
    }

    final css = cssResponse.body;

    // Parse CSS to extract woff2 URLs
    final woff2Pattern = RegExp(r"url\(([^)]+\.woff2[^)]*)\)");
    final weightPattern = RegExp(r"font-weight:\s*(\d+)");

    final fontMap = <String, String>{};
    final sections = css.split('/*');

    for (final section in sections) {
      final weightMatch = weightPattern.firstMatch(section);
      if (weightMatch != null) {
        final weight = weightMatch.group(1)!;
        final urlMatch = woff2Pattern.firstMatch(section);
        if (urlMatch != null) {
          var url = urlMatch.group(1)!.replaceAll("'", '').replaceAll('"', '');
          // Handle relative URLs
          if (url.startsWith('//')) {
            url = 'https:$url';
          } else if (url.startsWith('/')) {
            url = 'https://fonts.gstatic.com$url';
          }
          fontMap[weight] = url;
        }
      }
    }

    // Download each font file
    final weightNames = {
      '300': 'Lato-Light',
      '400': 'Lato-Regular',
      '700': 'Lato-Bold',
      '900': 'Lato-Black',
    };

    for (final entry in fontMap.entries) {
      final weight = entry.key;
      final url = entry.value;
      final name = weightNames[weight] ?? 'Lato-$weight';

      print('   Downloading $name...');
      try {
        final fontResponse = await http.get(Uri.parse(url));
        if (fontResponse.statusCode == 200) {
          final fileName = '$name.woff2';
          final outputFile = File(path.join(targetDir.path, fileName));
          await outputFile.writeAsBytes(fontResponse.bodyBytes);
          print('   ✓ $fileName');
        } else {
          print('   ⚠️  $name - HTTP ${fontResponse.statusCode}');
        }
      } catch (e) {
        print('   ⚠️  $name - Error: $e');
      }
    }

    if (fontMap.length < 4) {
      print('   ⚠️  Some Lato fonts could not be downloaded automatically.');
      print('      Please download manually from: https://fonts.google.com/specimen/Lato');
    }
  } catch (e) {
    print('   ⚠️  Automatic Lato download failed: $e');
    print('   Please download manually:');
    print('   1. Visit: https://fonts.google.com/specimen/Lato');
    print('   2. Click "Download family"');
    print('   3. Extract .woff2 files to: ${targetDir.path}');
  }
}

Future<void> _analyzeCode(List<String> args) async {
  print('   Running dart analyze...');
  final proc = await Process.start('dart', ['analyze', ...args]);
  stdout.addStream(proc.stdout);
  stderr.addStream(proc.stderr);
  await proc.exitCode;
}

Future<void> _updateNevaehUi() async {
  // Check if we're in a Dart project
  if (!await File('pubspec.yaml').exists()) {
    print('${red}❌ Error: Not in a Dart project.${reset}');
    print('   Run this command from your project directory (where pubspec.yaml is).');
    exit(1);
  }
  
  // Read current pubspec.yaml to check current version
  final pubspec = await File('pubspec.yaml').readAsString();
  final currentVersionMatch = RegExp(r'nevaeh_ui:\s*[\^~]?([\d.]+)').firstMatch(pubspec);
  
  if (currentVersionMatch == null) {
    print('${yellow}⚠️  nevaeh_ui not found in dependencies.${reset}');
    print('   Add it to pubspec.yaml:');
    print('   ${green}dependencies:${reset}');
    print('     ${green}nevaeh_ui: ^1.0.7${reset}');
    exit(1);
  }
  
  print('   Current version: ${currentVersionMatch.group(1)}');
  print('   Updating to latest version...\n');
  
  // Run dart pub upgrade nevaeh_ui
  final result = await Process.run('dart', ['pub', 'upgrade', 'nevaeh_ui'], runInShell: false);
  
  if (result.exitCode != 0) {
    print('${red}❌ Update failed:${reset}');
    stderr.write(result.stderr);
    stdout.write(result.stdout);
    exit(result.exitCode);
  }
  
  // Check new version
  final updatedPubspec = await File('pubspec.yaml').readAsString();
  final newVersionMatch = RegExp(r'nevaeh_ui:\s*[\^~]?([\d.]+)').firstMatch(updatedPubspec);
  
  if (newVersionMatch != null) {
    final newVersion = newVersionMatch.group(1);
    print('${green}✅ Successfully updated nevaeh_ui to version $newVersion${reset}');
    print('');
    print('   Next steps:');
    print('   ${green}1.${reset} Review any breaking changes in CHANGELOG.md');
    print('   ${green}2.${reset} Run ${green}dart pub get${reset} if needed');
    print('   ${green}3.${reset} Test your app: ${green}nevaeh serve${reset}');
  } else {
    print('${yellow}⚠️  Could not determine new version, but update completed.${reset}');
  }
}
