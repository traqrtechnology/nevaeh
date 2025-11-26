import 'dart:html';
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
      classes: [
        'min-h-screen',
        'flex',
        'flex-col',
        // Body Background: Glassmorphism gradient
        'bg-gradient-to-br',
        'from-rose-50',
        'via-fuchsia-50',
        'to-violet-100',
      ],
    );
    
    (mainContainer as KElement).appendToBody();
  }
  
  /// Build the navbar
  static KElement _buildNavbar({Map<String, String>? params}) {
    // Logo
    final logo = KElement(HeadingElement.h1())
      ..element.text = 'Nevaeh UI'
      ..classes.addAll([
        'text-2xl',
        'font-black',
        'text-transparent',
        'bg-clip-text',
        'bg-gradient-to-r',
        'from-rose-500',
        'to-violet-600',
        'm-0',
      ]);

    // Links
    final links = ['Home', 'Docs', 'Components'].map((text) {
      return KElement(AnchorElement(href: '#'))
        ..element.text = text
        ..classes.addAll([
          'text-slate-600',
          'hover:text-rose-500',
          'font-bold',
          'transition-colors',
          'no-underline',
          'cursor-pointer',
        ]);
    }).toList();

    final navContent = FlexRow(
      children: [
        logo,
        FlexRow(
          children: links,
          classes: ['gap-8', 'items-center'],
        ),
      ],
      classes: ['justify-between', 'items-center', 'w-full'],
    );
    
    final navbar = Container(
      children: [navContent],
      classes: [
        'sticky',
        'top-0',
        'z-50',
        'backdrop-blur-lg',
        'bg-white/70',
        'border-b',
        'border-white/20',
        'px-6',
        'md:px-10',
        'py-4',
        'w-full',
      ],
    );
    
    return navbar as KElement;
  }
  
  /// Build the yield area where view content is inserted
  static KElement _buildYieldArea(KElement viewContent) {
    final container = Container(
      children: [viewContent],
      classes: ['flex-1'],
    );
    _yieldContainer = container as KElement;
    return container as KElement;
  }
  
  /// Build the footer
  static KElement _buildFooter() {
    final footer = Container(
      children: [
        Text(
          'Made with 💖 and Dart',
          classes: ['text-slate-500', 'font-medium', 'text-sm'],
        ),
      ],
      classes: [
        'w-full',
        'py-8',
        'flex',
        'justify-center',
        'items-center',
      ],
    );
    return footer as KElement;
  }
}
