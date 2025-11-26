import 'dart:html';
import '../src/core/k_element.dart';

/// A Textarea component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Textarea(
///   placeholder: "Enter your message",
///   rows: 4,
///   classes: ["w-full"],
/// )
/// ```
class Textarea extends KElement {
  Textarea({
    String placeholder = "",
    int rows = 4,
    List<String> classes = const [],
  }) : super(TextAreaElement()) {
    // Set placeholder
    (element as TextAreaElement).placeholder = placeholder;
    (element as TextAreaElement).rows = rows;

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
    'resize-y',
  ];
}

