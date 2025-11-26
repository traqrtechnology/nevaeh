import 'dart:io';
import 'package:path/path.dart' as path;

class RouteGenerator {
  static Future<void> generate() async {
    print('⚙️  Generating routes from views...');
    
    final viewsDir = Directory('web/views');
    if (!await viewsDir.exists()) {
      print('⚠️  web/views directory not found');
      return;
    }
    
    final routes = <_RouteDefinition>[];
    
    await for (final entity in viewsDir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        final content = await entity.readAsString();
        final relativePath = path.relative(entity.path, from: 'web');
        // Convert path to import style (forward slashes)
        final importPath = relativePath.replaceAll(r'\', '/');
        
        // Get the filename
        final fileName = path.basenameWithoutExtension(entity.path);
        
        // Try to find Metadata.title, fallback to filename if not found
        final titleMatch = RegExp(r"Metadata\.title\s*=\s*['\x22]([^'\x22]+)['\x22]").firstMatch(content);
        final title = titleMatch?.group(1) ?? fileName;
        final slug = _slugify(title);
        
        // Check for Metadata.isRoot = true
        final isRootMatch = RegExp(r"Metadata\.isRoot\s*=\s*true").hasMatch(content);
        // Default to home being root if no explicit root is set
        final isHome = isRootMatch || fileName == 'home';
        
        routes.add(_RouteDefinition(
          slug: slug,
          importPath: importPath,
          viewName: fileName,
          isHome: isHome,
        ));
      }
    }
    
    await _writeRoutesFile(routes);
  }
  
  static String _slugify(String title) {
    return title
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9\s-]'), '') // Remove special chars
      .replaceAll(RegExp(r'\s+'), '-')         // Replace spaces with hyphens
      .replaceAll(RegExp(r'-+'), '-')          // Collapse hyphens
      .trim(); 
  }
  
  static Future<void> _writeRoutesFile(List<_RouteDefinition> routes) async {
    final buffer = StringBuffer();
    
    buffer.writeln("// Browser-only imports - only use this file in web context");
    buffer.writeln("// ignore: avoid_web_libraries_in_flutter");
    buffer.writeln("import 'dart:html';");
    buffer.writeln("import 'package:nevaeh_ui/nevaeh_ui.dart';");
    buffer.writeln("import 'layouts/application.dart';");
    
    // Imports
    for (final route in routes) {
      buffer.writeln("import '${route.importPath}' as view_${route.viewName};");
    }
    
    buffer.writeln("");
    buffer.writeln("void setupRoutes() {");
    buffer.writeln("  final router = Router();");
    buffer.writeln("");
    
    if (routes.isEmpty) {
      // If no views found, create a default home route
      buffer.writeln("  // No views found. Create a view with: nevaeh generate view home");
      buffer.writeln("  router.get('/', (params) async {");
      buffer.writeln("    ApplicationLayout.render(");
      buffer.writeln("      Container(");
      buffer.writeln("        children: [");
      buffer.writeln("          h1(text: 'Welcome to Nevaeh UI', classes: ['text-4xl', 'font-bold', 'mb-4']),");
      buffer.writeln("          p(text: 'Create your first view: nevaeh generate view home', classes: ['text-lg']),");
      buffer.writeln("        ],");
      buffer.writeln("        classes: ['p-8', 'text-center'],");
      buffer.writeln("      ),");
      buffer.writeln("    );");
      buffer.writeln("  });");
    } else {
      for (final route in routes) {
        // Register slug route
        buffer.writeln("  router.get('/${route.slug}', (params) async {");
        buffer.writeln("    final content = await view_${route.viewName}.render();");
        buffer.writeln("    ApplicationLayout.render(content, params: params);");
        buffer.writeln("  });");
        
        // If it's home/root, also register root '/'
        if (route.isHome) {
          buffer.writeln("  router.get('/', (params) async {");
          buffer.writeln("    final content = await view_${route.viewName}.render();");
          buffer.writeln("    ApplicationLayout.render(content, params: params);");
          buffer.writeln("  });");
        }
        
        // Also register filename route for backward compatibility/predictability
        // e.g. /home, /docs
        // Only if it differs from slug
        if (route.slug != route.viewName) {
           buffer.writeln("  router.get('/${route.viewName}', (params) async {");
           buffer.writeln("    final content = await view_${route.viewName}.render();");
           buffer.writeln("    ApplicationLayout.render(content, params: params);");
           buffer.writeln("  });");
        }
      }
    }
    
    buffer.writeln("}");
    
    final file = File('web/routes.dart');
    await file.writeAsString(buffer.toString());
    print('✅ Generated web/routes.dart with ${routes.length} views');
  }
}

class _RouteDefinition {
  final String slug;
  final String importPath;
  final String viewName;
  final bool isHome;
  
  _RouteDefinition({
    required this.slug,
    required this.importPath,
    required this.viewName,
    required this.isHome,
  });
}
