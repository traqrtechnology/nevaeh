import 'dart:io';
import 'package:path/path.dart' as path;
import '../config/metadata.dart';

/// HTML boilerplate generator
/// 
/// Generates HTML files with proper metadata tags and structure
class HtmlGenerator {
  /// Generate HTML boilerplate with metadata
  /// 
  /// [dartFileName] - The name of the Dart file (e.g., 'main.dart')
  /// [outputPath] - Where to write the HTML file
  /// [relativePath] - Relative path from HTML to main.js (for script src)
  static String generateBoilerplate({
    required String dartFileName,
    String? relativePath,
  }) {
    final jsFileName = dartFileName.replaceAll('.dart', '.js');
    final cssPath = relativePath != null 
        ? path.join(path.dirname(relativePath), 'kothari.css').replaceAll('\\', '/')
        : 'kothari.css';
    final jsPath = relativePath != null
        ? path.join(path.dirname(relativePath), jsFileName).replaceAll('\\', '/')
        : jsFileName;
    
    // Calculate relative path to web root for fonts
    final fontPath = relativePath != null
        ? _calculateFontPath(relativePath)
        : 'fonts';
    
    return '''<!DOCTYPE html>
<html lang="${Metadata.lang}">
  <head>
    <meta charset="${Metadata.charset}">
    <meta name="viewport" content="${Metadata.viewport}">
    
    <!-- ============================================================================ -->
    <!-- METADATA - Edit these values in your Dart files using Metadata class -->
    <!-- Example: Metadata.title = 'My Page Title'; -->
    <!-- ============================================================================ -->
    <title>${_escapeHtml(Metadata.title)}</title>
    
    ${_generateBasicMetaTags()}
    ${_generateOpenGraphTags()}
    ${_generateTwitterTags()}
    ${_generateAdditionalTags()}
    <!-- ============================================================================ -->
    
    <link rel="stylesheet" href="$cssPath">
    
    <!-- Kothari UI Default Fonts (Self-hosted, fast loading) -->
    <!-- Fonts are loaded via @font-face in kothari.css -->
    <!-- If fonts are not in $fontPath/, system fonts will be used automatically -->
    <style>
      body {
        font-family: "Lato", "Source Sans 3", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      code, pre, .font-mono, .font-kothari-mono {
        font-family: "JetBrains Mono", "Fira Code", "SF Mono", Monaco, "Cascadia Code", "Roboto Mono", Consolas, "Courier New", monospace;
      }
    </style>
  </head>

  <body>
    <script src="$jsPath"></script>
  </body>
</html>''';
  }
  
  static String _generateBasicMetaTags() {
    final tags = <String>[];
    
    if (Metadata.description.isNotEmpty) {
      tags.add('    <meta name="description" content="${_escapeHtml(Metadata.description)}">');
    }
    
    if (Metadata.keywords.isNotEmpty) {
      tags.add('    <meta name="keywords" content="${_escapeHtml(Metadata.keywords)}">');
    }
    
    if (Metadata.author.isNotEmpty) {
      tags.add('    <meta name="author" content="${_escapeHtml(Metadata.author)}">');
    }
    
    return tags.join('\n');
  }
  
  static String _generateOpenGraphTags() {
    final tags = <String>[];
    
    if (Metadata.effectiveOgTitle.isNotEmpty) {
      tags.add('    <meta property="og:title" content="${_escapeHtml(Metadata.effectiveOgTitle)}">');
    }
    
    if (Metadata.effectiveOgDescription.isNotEmpty) {
      tags.add('    <meta property="og:description" content="${_escapeHtml(Metadata.effectiveOgDescription)}">');
    }
    
    if (Metadata.ogImage.isNotEmpty) {
      tags.add('    <meta property="og:image" content="${_escapeHtml(Metadata.ogImage)}">');
    }
    
    if (Metadata.ogUrl.isNotEmpty) {
      tags.add('    <meta property="og:url" content="${_escapeHtml(Metadata.ogUrl)}">');
    }
    
    if (Metadata.ogType.isNotEmpty) {
      tags.add('    <meta property="og:type" content="${_escapeHtml(Metadata.ogType)}">');
    }
    
    return tags.join('\n');
  }
  
  static String _generateTwitterTags() {
    final tags = <String>[];
    
    tags.add('    <meta name="twitter:card" content="${_escapeHtml(Metadata.twitterCard)}">');
    
    if (Metadata.effectiveTwitterTitle.isNotEmpty) {
      tags.add('    <meta name="twitter:title" content="${_escapeHtml(Metadata.effectiveTwitterTitle)}">');
    }
    
    if (Metadata.effectiveTwitterDescription.isNotEmpty) {
      tags.add('    <meta name="twitter:description" content="${_escapeHtml(Metadata.effectiveTwitterDescription)}">');
    }
    
    if (Metadata.effectiveTwitterImage.isNotEmpty) {
      tags.add('    <meta name="twitter:image" content="${_escapeHtml(Metadata.effectiveTwitterImage)}">');
    }
    
    return tags.join('\n');
  }
  
  static String _generateAdditionalTags() {
    final tags = <String>[];
    
    if (Metadata.themeColor.isNotEmpty) {
      tags.add('    <meta name="theme-color" content="${_escapeHtml(Metadata.themeColor)}">');
    }
    
    return tags.join('\n');
  }
  
  static String _escapeHtml(String text) {
    return text
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');
  }
  
  static String _calculateFontPath(String relativePath) {
    // Count how many levels deep we are
    final levels = relativePath.split('/').where((p) => p.isNotEmpty && p != '.').length;
    if (levels <= 1) return 'fonts';
    
    // Go up (levels - 1) directories to reach web root
    final upPath = '../' * (levels - 1);
    return path.join(upPath, 'fonts').replaceAll('\\', '/');
  }
  
  /// Write HTML file to disk
  static Future<void> writeHtmlFile({
    required String outputPath,
    required String dartFileName,
    String? relativePath,
  }) async {
    final html = generateBoilerplate(
      dartFileName: dartFileName,
      relativePath: relativePath,
    );
    
    // Normalize path - if outputPath starts with 'web/' and we're already in a 'web' directory,
    // use just the filename part to avoid creating web/web/
    String normalizedPath = outputPath;
    final currentPath = Directory.current.path;
    if (outputPath.startsWith('web/') && 
        (currentPath.endsWith('/web') || currentPath.endsWith('\\web'))) {
      // We're already in web/, so just use the filename
      normalizedPath = outputPath.substring(5); // Remove 'web/' prefix
    }
    
    final file = File(normalizedPath);
    // Ensure parent directory exists
    final parentDir = file.parent;
    if (parentDir.path != '.' && !parentDir.existsSync()) {
      parentDir.createSync(recursive: true);
    }
    await file.writeAsString(html);
  }
}

