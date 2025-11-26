import 'dart:html';
import '../src/core/k_element.dart';

/// A Divider component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Divider()
/// ```
class Divider extends KElement {
  Divider({
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'w-full',
    'h-1',
    'bg-slate-200',
  ];
}

