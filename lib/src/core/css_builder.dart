import 'dart:io';
import 'kothari_css.dart';
import 'kothari_scanner.dart';

class CssBuilder {
  static void build(String outputPath) {
    print("Running CSS Builder...");
    print("Current directory: ${Directory.current.path}");

    final css = KothariCSS();

    // ======================================================================
    // STANDARD UTILITIES
    // ======================================================================

    // Text Alignment
    css.utility('text-center', {'text-align': 'center'});
    css.utility('text-right', {'text-align': 'right'});
    css.utility('text-left', {'text-align': 'left'});
    css.utility('text-justify', {'text-align': 'justify'});

    // Text Transform
    css.utility('text-transform-uppercase', {'text-transform': 'uppercase'});
    css.utility('text-transform-lowercase', {'text-transform': 'lowercase'});
    css.utility('text-transform-capitalize', {'text-transform': 'capitalize'});

    // Text Decoration
    css.utility('text-decoration-underline', {'text-decoration': 'underline'});
    css.utility('text-decoration-line-through', {'text-decoration': 'line-through'});
    css.utility('text-decoration-none', {'text-decoration': 'none'});

    // White Space
    css.utility('white-space-nowrap', {'white-space': 'nowrap'});
    css.utility('white-space-normal', {'white-space': 'normal'});
    css.utility('white-space-pre', {'white-space': 'pre'});
    css.utility('white-space-pre-line', {'white-space': 'pre-line'});
    css.utility('white-space-pre-wrap', {'white-space': 'pre-wrap'});

    // Direction
    css.utility('direction-ltr', {'direction': 'ltr'});
    css.utility('direction-rtl', {'direction': 'rtl'});

    // Font Style
    css.utility('font-style-italic', {'font-style': 'italic'});
    css.utility('font-style-normal', {'font-style': 'normal'});

    // Font Weight
    css.utility('font-weight-bold', {'font-weight': 'bold'});
    css.utility('font-weight-normal', {'font-weight': 'normal'});
    css.utility('font-weight-light', {'font-weight': '300'});
    css.utility('font-weight-bolder', {'font-weight': 'bolder'});
    css.utility('font-weight-lighter', {'font-weight': 'lighter'});

    // ======================================================================
    // SCAN & BUILD
    // ======================================================================
    
    print("🔍 Scanning Dart project for utilities...");
    final utilities = scanForUtilities();

    print("Found ${utilities.length} utilities.");
    
    // Add utilities to KothariCSS
    for (final u in utilities) {
      css.collectClass(u);
    }

    print("⚙️ Building $outputPath...");
    
    // Normalize path - if outputPath starts with 'web/' and we're already in a 'web' directory,
    // use just the filename part to avoid creating web/web/
    String normalizedPath = outputPath;
    final currentPath = Directory.current.path;
    if (outputPath.startsWith('web/') && 
        (currentPath.endsWith('/web') || currentPath.endsWith('\\web'))) {
      // We're already in web/, so just use the filename
      normalizedPath = outputPath.substring(5); // Remove 'web/' prefix
    }
    
    // Ensure directory exists
    final file = File(normalizedPath);
    final parentDir = file.parent;
    if (parentDir.path != '.' && !parentDir.existsSync()) {
      parentDir.createSync(recursive: true);
    }
    
    final cssContent = css.generateCss();
    File(normalizedPath).writeAsStringSync(cssContent);
    print("✅ Done!");
  }
}

