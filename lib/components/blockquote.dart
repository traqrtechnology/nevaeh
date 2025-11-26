import 'dart:html';
import '../src/core/k_element.dart';

/// A Blockquote component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Blockquote(
///   text: "The only way to do great work is to love what you do.",
///   author: "Steve Jobs",
///   classes: [],
/// )
/// ```
class Blockquote extends KElement {
  Blockquote({
    required String text,
    String? author,
    List<String> classes = const [],
  }) : super(QuoteElement()) {
    // Create quote text
    final quoteText = ParagraphElement()
      ..text = text
      ..classes.addAll(['text-lg', 'text-slate-700', 'mb-4', 'italic']);
    element.append(quoteText);

    // Add author if provided
    if (author != null) {
      final authorText = ParagraphElement()
        ..text = '— $author'
        ..classes.addAll(['text-sm', 'text-slate-500', 'text-right']);
      element.append(authorText);
    }

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'border-l-4',
    'border-blue-500',
    'pl-16',
    'py-8',
    'bg-slate-50',
    'rounded-r-8',
    'my-12',
  ];
}

