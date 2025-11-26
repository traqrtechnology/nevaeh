import 'dart:html';
import '../src/core/k_element.dart';

/// A Badge component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Badge(
///   label: "New",
///   classes: ["bg-blue-500", "text-white"],
/// )
/// ```
class Badge extends KElement {
  Badge({
    required String label,
    List<String> classes = const [],
  }) : super(SpanElement()) {
    // Set label text
    element.text = label;

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'inline-block',
    'px-10',
    'py-4',
    'rounded-6',
    'text-12',
    'font-weight-600',
    'bg-slate-200',
    'text-slate-700',
  ];
}

