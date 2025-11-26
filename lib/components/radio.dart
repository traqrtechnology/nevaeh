import 'dart:html';
import '../src/core/k_element.dart';
import '../src/core/k_classes.dart';

/// A Radio component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Radio(
///   name: "option",
///   value: "value1",
///   checked: true,
///   label: "Option 1",
///   classes: [],
/// )
/// ```
class Radio extends KElement {
  Radio({
    required String name,
    required String value,
    bool checked = false,
    String? label,
    List<String> classes = const [],
  }) : super(LabelElement()) {
    // Create radio input
    // Note: RadioButtonInputElement already has type='radio' by default
    final radio = RadioButtonInputElement()
      ..name = name
      ..value = value
      ..checked = checked;

    // Apply default classes to radio
    final radioClasses = KClasses(radio);
    radioClasses.addAll(_radioDefaultClasses);

    // Add radio to label
    element.append(radio);

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

  static const List<String> _radioDefaultClasses = [
    'w-16',
    'h-16',
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

