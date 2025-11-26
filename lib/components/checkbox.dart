import 'dart:html';
import '../src/core/k_element.dart';
import '../src/core/k_classes.dart';

/// A Checkbox component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Checkbox(
///   checked: true,
///   label: "Accept terms",
///   classes: [],
/// )
/// ```
class Checkbox extends KElement {
  Checkbox({
    bool checked = false,
    String? label,
    List<String> classes = const [],
  }) : super(LabelElement()) {
    // Create checkbox input
    // Note: CheckboxInputElement already has type='checkbox' by default
    final checkbox = CheckboxInputElement()
      ..checked = checked;

    // Apply default classes to checkbox
    final checkboxClasses = KClasses(checkbox);
    checkboxClasses.addAll(_checkboxDefaultClasses);

    // Add checkbox to label
    element.append(checkbox);

    // Add label text if provided
    if (label != null) {
      final labelText = SpanElement()
        ..text = label
        ..classes.addAll(['ml-8', 'text-slate-700', 'cursor-pointer']);
      element.append(labelText);
    }

    // Apply default classes to label container
    this.classes.addAll(_labelDefaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _checkboxDefaultClasses = [
    'w-16',
    'h-16',
    'rounded-4',
    'border-2',
    'border-slate-300',
    'text-blue-500',
    'focus:ring-2',
    'focus:ring-blue-300',
    'cursor-pointer',
    'transition-all',
    'duration-300',
  ];

  static const List<String> _labelDefaultClasses = [
    'flex',
    'items-center',
    'cursor-pointer',
  ];
}

