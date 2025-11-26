import 'dart:html';
import '../src/core/k_element.dart';

/// A Code component for inline code with default KothariUI styling.
///
/// Example:
/// ```dart
/// Code(
///   text: "const x = 5;",
///   classes: [],
/// )
/// ```
class Code extends KElement {
  Code({
    required String text,
    List<String> classes = const [],
  }) : super(Element.tag('code')) {
    element.text = text;

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'font-mono',
    'bg-slate-100',
    'text-red-600',
    'px-6',
    'py-2',
    'rounded-4',
    'text-sm',
  ];
}

