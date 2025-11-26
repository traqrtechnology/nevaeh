import 'dart:html';
import '../src/core/k_element.dart';

/// A Select component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Select(
///   options: ["Option 1", "Option 2", "Option 3"],
///   selectedIndex: 0,
///   classes: ["w-full"],
/// )
/// ```
class Select extends KElement {
  Select({
    required List<String> options,
    int? selectedIndex,
    String? placeholder,
    List<String> classes = const [],
  }) : super(SelectElement()) {
    final selectElement = element as SelectElement;

    // Add placeholder option if provided
    if (placeholder != null) {
      final placeholderOption = OptionElement()
        ..value = ''
        ..text = placeholder
        ..disabled = true
        ..selected = selectedIndex == null;
      selectElement.append(placeholderOption);
    }

    // Add options
    for (int i = 0; i < options.length; i++) {
      final option = OptionElement()
        ..value = options[i]
        ..text = options[i]
        ..selected = i == selectedIndex;
      selectElement.append(option);
    }

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'w-full',
    'p-12',
    'rounded-8',
    'border',
    'border-slate-300',
    'focus:border-blue-500',
    'focus:ring-2',
    'focus:ring-blue-300',
    'outline-none',
    'transition-all',
    'duration-300',
    'bg-white',
    'cursor-pointer',
  ];
}

