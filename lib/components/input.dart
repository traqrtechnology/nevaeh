import 'dart:html';
import '../src/core/k_element.dart';

/// An Input component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Input(
///   placeholder: "Email",
///   classes: ["w-full"],
/// )
/// ```
class Input extends KElement {
  Input({
    String placeholder = "",
    List<String> classes = const [],
  }) : super(InputElement()) {
    // Set placeholder
    (element as InputElement).placeholder = placeholder;

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
  ];
}

