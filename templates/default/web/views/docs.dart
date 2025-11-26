import 'dart:html';
import 'dart:convert';
import 'package:nevaeh_ui/nevaeh_ui.dart';



import '../layouts/application.dart';


// ============================================================================
// METADATA
// ============================================================================
void _setMetadata() {
  Metadata.title = 'Documentation - Nevaeh UI';
  Metadata.description = 'Learn how to use Nevaeh UI';
}

/// View: docs
/// Route: /docs
Future<KElement> render() async {
  _setMetadata();
  return _renderContent();
}

KElement _renderContent() {
  return Container(
    children: [
      _buildHeader(),
      _buildDocSection(
        'Getting Started',
        'Nevaeh UI is a modern, type-safe framework for Dart web applications. It combines the power of Tailwind-like utility classes with a robust component system.',
      ),
      _buildDocSection(
        'Installation',
        'Add `nevaeh_ui` to your `pubspec.yaml` dependencies or run `dart pub add nevaeh_ui`.',
      ),
      _buildBackButton(),
    ],
    classes: ['flex', 'flex-col', 'gap-12', 'max-w-4xl', 'mx-auto', 'pt-32', 'px-6', 'pb-20', 'w-full'],
  );
}

KElement _buildHeader() {
  return Container(
    children: [
      Text(
        'Documentation 📚',
        classes: [
          'text-5xl',
          'font-black',
          'text-transparent',
          'bg-clip-text',
          'bg-gradient-to-r',
          'from-rose-500',
          'to-violet-600',
          'mb-4',
        ],
      ),
      Text(
        'Everything you need to know about building with Nevaeh UI.',
        classes: ['text-xl', 'text-slate-600'],
      ),
    ],
    classes: ['text-center', 'mb-8'],
  );
}

KElement _buildDocSection(String title, String content) {
  return Container(
    children: [
      Text(
        title,
        classes: ['text-2xl', 'font-bold', 'text-slate-800', 'mb-4'],
      ),
      Container(
        children: [
          Text(
            content,
            classes: ['text-slate-600', 'leading-relaxed', 'text-lg'],
          ),
        ],
        classes: [
          'bg-white/60',
          'backdrop-blur-md',
          'p-8',
          'rounded-2xl',
          'border',
          'border-white/50',
          'shadow-lg',
        ],
      ),
    ],
  );
}

KElement _buildBackButton() {
  final button = Button(
    title: '← Back to Home',
    classes: [
      'bg-white',
      'text-slate-700',
      'border',
      'border-slate-200',
      'hover:bg-slate-50',
      'shadow-sm',
      'self-center', // Center in flex column
    ],
  );
  
  // Add click handler for navigation
  button.element.onClick.listen((e) {
    e.preventDefault();
    Router().navigate('/');
  });
  
  return button;
}
