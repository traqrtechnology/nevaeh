import 'dart:html';
import '../src/core/k_element.dart';

/// A Spinner component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Spinner()
/// ```
class Spinner extends KElement {
  Spinner({
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'w-8',
    'h-8',
    'border-4',
    'border-slate-200',
    'border-t-blue-500',
    'rounded-full',
    'animate-spin',
  ];
}

