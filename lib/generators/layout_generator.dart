import 'dart:io';
import 'package:path/path.dart' as path;

/// Layout generator for creating layout files
class LayoutGenerator {
  /// Generate the default application layout
  static Future<void> generateApplicationLayout() async {
    final layoutsDir = Directory('web/layouts');
    layoutsDir.createSync(recursive: true);
    
    final layoutFile = File(path.join(layoutsDir.path, 'application.dart'));
    
    // Check if layout already exists
    if (await layoutFile.exists()) {
      print('⚠️  Layout already exists: web/layouts/application.dart');
      return;
    }
    
    final content = '''import 'dart:html';
import 'package:nevaeh_ui/nevaeh_ui.dart';

/// Application layout - main wrapper for all views
/// 
/// This is the Rails-like application.html.erb equivalent
/// Contains common elements like navbar, footer, and a yield area
/// where view content is inserted
class ApplicationLayout {
  static KElement? _yieldContainer;
  
  /// Render the layout with view content
  /// 
  /// [viewContent] - The KElement(s) from the view to be inserted
  /// [params] - Route parameters (useful for conditional rendering)
  static void render(KElement viewContent, {Map<String, String>? params}) {
    // Initialize KothariCSS if not already done
    KothariCSS();
    
    // Clear existing content
    document.body?.children.clear();
    
    // Create main container
    final mainContainer = Container(
      children: [
        _buildNavbar(params: params),
        _buildYieldArea(viewContent),
        _buildFooter(),
      ],
      classes: ['min-h-screen', 'flex', 'flex-col'],
    );
    
    mainContainer.appendToBody();
  }
  
  /// Build the navbar
  /// 
  /// You can customize this based on user login status, etc.
  /// Example: if (userLoggedIn) show user menu, else show login button
  static KElement _buildNavbar({Map<String, String>? params}) {
    // Example: Check if user is logged in
    // final isLoggedIn = _checkUserLoggedIn();
    
    return Navbar(
      title: 'KothariUI',
      actions: [
        // Example conditional rendering:
        // if (isLoggedIn)
        //   Button(title: 'Dashboard', ...),
        // else
        //   Button(title: 'Login', ...),
        
        Button(
          title: 'Docs',
          classes: [
            'bg-transparent',
            'text-slate-700',
            'hover:bg-slate-100',
            'shadow-none',
            'text-sm',
            'md:text-base',
          ],
        ),
        Button(
          title: 'Get Started',
          classes: [
            'bg-blue-500',
            'hover:bg-blue-600',
            'text-sm',
            'md:text-base',
          ],
        ),
      ],
      classes: [
        'border-b',
        'border-slate-200',
        'bg-white',
        'px-10',
        'md:px-20',
        'py-12',
        'md:py-16',
      ],
    );
  }
  
  /// Build the yield area where view content is inserted
  static KElement _buildYieldArea(KElement viewContent) {
    _yieldContainer = Container(
      children: [viewContent],
      classes: ['flex-1'],
    );
    return _yieldContainer!;
  }
  
  /// Build the footer
  static KElement _buildFooter() {
    return Container(
      children: [
        Divider(),
        FlexRow(
          children: [
            Text(
              'Built with KothariUI',
              classes: ['text-slate-600', 'text-xs', 'md:text-sm'],
            ),
            Text(
              '•',
              classes: ['text-slate-400', 'mx-4', 'md:mx-8'],
            ),
            Text(
              'Pure Dart',
              classes: ['text-slate-600', 'text-xs', 'md:text-sm'],
            ),
            Text(
              '•',
              classes: ['text-slate-400', 'mx-4', 'md:mx-8'],
            ),
            Text(
              'Zero Bundlers',
              classes: ['text-slate-600', 'text-xs', 'md:text-sm'],
            ),
          ],
          classes: [
            'justify-center',
            'items-center',
            'py-12',
            'md:py-20',
          ],
        ),
      ],
      classes: ['bg-white', 'px-10'],
    );
  }
  
  /// Helper method to check if user is logged in
  /// You can customize this based on your auth system
  static bool _checkUserLoggedIn() {
    // Example: Check localStorage, cookies, etc.
    // return window.localStorage['auth_token'] != null;
    return false;
  }
}
''';
    
    await layoutFile.writeAsString(content);
    print('✅ Generated layout: web/layouts/application.dart');
  }
}

