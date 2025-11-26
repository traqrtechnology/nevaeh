import 'dart:io';
import 'package:path/path.dart' as path;
import '../utils/html_generator.dart';

/// View generator for creating Dart views and HTML files
class ViewGenerator {
  /// Generate a view
  /// 
  /// [viewName] - Name of the view (e.g., 'users/index' or 'home')
  /// [basePath] - Base path for views (default: 'web/views')
  static Future<void> generate({
    required String viewName,
    String? basePath,
  }) async {
    final viewsPath = basePath ?? 'web/views';
    final viewParts = viewName.split('/');
    final fileName = viewParts.last;
    final dirParts = viewParts.length > 1 
        ? viewParts.sublist(0, viewParts.length - 1)
        : <String>[];
    
    // Create directory structure
    Directory viewDir;
    if (dirParts.isEmpty) {
      viewDir = Directory(viewsPath);
    } else {
      var viewDirPath = viewsPath;
      for (final part in dirParts) {
        viewDirPath = path.join(viewDirPath, part);
      }
      viewDir = Directory(viewDirPath);
    }
    
    viewDir.createSync(recursive: true);
    
    // Generate Dart file
    final dartFilePath = path.join(viewDir.path, '$fileName.dart');
    await _generateDartFile(dartFilePath, viewName, dirParts);
    
    // Generate HTML file
    final htmlFilePath = path.join(viewDir.path, '$fileName.html');
    // Calculate relative path from HTML file to web root
    // If view is at web/views/users/index.html, need to go up 2 levels to reach web/
    final depth = dirParts.length + (viewsPath.split('/').length - 1); // +1 for views folder
    final relativePath = depth == 0 
        ? 'main.js'
        : '../' * depth + 'main.js';
    
    await HtmlGenerator.writeHtmlFile(
      outputPath: htmlFilePath,
      dartFileName: '$fileName.dart',
      relativePath: relativePath,
    );
    
    // Auto-register route
    await _registerRoute(viewName);
    
    print('✅ Generated view: $viewName');
    print('   Dart: $dartFilePath');
    print('   HTML: $htmlFilePath');
  }
  
  static Future<void> _generateDartFile(
    String filePath,
    String viewName,
    List<String> dirParts,
  ) async {
    // Calculate relative path to layout
    // Layout is at web/layouts/, views are at web/views/, so go up one level from views
    final depth = dirParts.length + 2; // +1 for views, +1 for web
    final layoutPath = '../' * (depth - 1) + 'layouts/application.dart';
    
    final viewNameParts = viewName.split('/');
    final routePath = '/${viewNameParts.join('/')}';
    
    final content = '''import 'dart:html';
import 'dart:convert';
import 'package:nevaeh_ui/nevaeh_ui.dart';
import '$layoutPath';

// ============================================================================
// METADATA - Edit these values to customize page metadata
// ============================================================================
void _setMetadata() {
  Metadata.title = '${viewNameParts.map((p) => p[0].toUpperCase() + p.substring(1)).join(' ')} - KothariUI';
  Metadata.description = 'Page description for $viewName';
  Metadata.keywords = 'dart, ui, framework';
  // Metadata.author = 'Your Name';
  // Metadata.ogImage = 'https://example.com/image.jpg';
  // Metadata.ogUrl = 'https://example.com$routePath';
  // Metadata.twitterTitle = 'Custom Twitter Title';
  // Metadata.twitterDescription = 'Custom Twitter Description';
}
// ============================================================================

/// View: $viewName
/// Route: $routePath
/// 
/// This view's content will be rendered inside the ApplicationLayout
Future<KElement> render() async {
  // Set metadata for this page
  _setMetadata();
  
  // Fetch JSON data from API
  try {
    final data = await fetchJson('/api${routePath}');
    
    // Render UI components with JSON data
    // Return the content element (it will be inserted into layout)
    return _renderContent(data);
  } catch (e) {
    print('Error loading data: \$e');
    return _renderError(e.toString());
  }
}

KElement _renderContent(dynamic data) {
  // TODO: Implement your view rendering logic here
  // This content will be inserted into the ApplicationLayout's yield area
  // Example:
  // return Container(
  //   children: [
  //     Text(
  //       'View: $viewName',
  //       classes: ['text-2xl', 'font-bold', 'mb-4'],
  //     ),
  //     // Add more components based on data
  //   ],
  //   classes: ['p-8'],
  // );
  
  // Placeholder
  return Container(
    children: [
      Text(
        'View: $viewName',
        classes: ['text-2xl', 'font-bold', 'mb-4', 'text-slate-900'],
      ),
      Text(
        'Data: \${data.toString()}',
        classes: ['text-slate-600'],
      ),
    ],
    classes: ['p-8', 'max-w-4xl', 'mx-auto'],
  );
}

KElement _renderError(String error) {
  return Container(
    children: [
      Text(
        'Error loading view',
        classes: ['text-xl', 'font-bold', 'mb-2', 'text-red-600'],
      ),
      Text(
        error,
        classes: ['text-red-500'],
      ),
    ],
    classes: ['p-8', 'bg-red-50', 'border', 'border-red-200', 'rounded-8'],
  );
}
''';
    
    final file = File(filePath);
    await file.writeAsString(content);
  }
  
  static Future<void> _registerRoute(String viewName) async {
    final routesFile = File('lib/routes.dart');
    
    if (!await routesFile.exists()) {
      // Routes file doesn't exist, create it
      await routesFile.writeAsString('''
/// Routes configuration file
/// 
/// This file is auto-generated and updated by the nevaeh generate command
/// You can also manually add routes here
/// 
/// NOTE: This file should only be imported in browser context (web/main.dart)
/// It uses dart:html which is not available in CLI/server contexts

// Browser-only imports - only use this file in web context
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:convert';
import 'routing/router.dart';

final router = Router();

// Route definitions
void setupRoutes() {
  // Auto-generated routes
}
''');
    }
    
    // Read existing routes file
    final content = await routesFile.readAsString();
    
    // Check if route already exists
    final routePath = '/${viewName.replaceAll('/', '/')}';
    if (content.contains("get('$routePath'")) {
      print('⚠️  Route already exists: $routePath');
      return;
    }
    
    // Find the setupRoutes function and add route
    final routeLine = "  router.get('$routePath', (params) => renderView('$viewName', params: params));";
    
    // Insert before the closing brace of setupRoutes
    final setupRoutesEnd = content.lastIndexOf('}');
    if (setupRoutesEnd != -1) {
      final before = content.substring(0, setupRoutesEnd);
      final after = content.substring(setupRoutesEnd);
      
      final newContent = before + routeLine + '\n' + after;
      await routesFile.writeAsString(newContent);
      print('✅ Registered route: $routePath');
    }
  }
}

