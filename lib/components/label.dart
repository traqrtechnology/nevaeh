import 'dart:html';
import '../src/core/k_element.dart';

/// A Label component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Label(
///   text: "Email Address",
///   forId: "email",
///   classes: [],
/// )
/// ```
class Label extends KElement {
  Label({
    required String text,
    String? forId,
    List<String> classes = const [],
  }) : super(LabelElement()) {
    // Set label text
    element.text = text;

    // Set for attribute if provided
    if (forId != null) {
      (element as LabelElement).htmlFor = forId;
    }

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'block',
    'text-sm',
    'font-weight-600',
    'text-slate-700',
    'mb-4',
  ];
}

