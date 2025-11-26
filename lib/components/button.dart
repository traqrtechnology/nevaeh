import 'dart:html';
import '../src/core/k_element.dart';

/// A Button component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Button(
///   title: "Click me",
///   classes: ["p-3", "bg-blue-500"],
/// )
/// ```
class Button extends KElement {
  Button({
    required String title,
    List<String> classes = const [],
  }) : super(ButtonElement()) {
    // Set button text
    element.text = title;

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'px-16',
    'py-8',
    'rounded-8',
    'bg-blue-500',
    'text-white',
    'font-weight-600',
    'cursor-pointer',
    'transition-all',
    'duration-300',
    'hover:bg-blue-600',
    'active:scale-95',
  ];
}

