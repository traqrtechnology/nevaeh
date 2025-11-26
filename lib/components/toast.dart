import 'dart:html';
import '../src/core/k_element.dart';

/// A Toast component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Toast(
///   message: "Saved successfully!",
///   type: "success",
/// )
/// ```
class Toast extends KElement {
  Toast({
    required String message,
    String type = "info", // "info" | "success" | "warning" | "danger"
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Get type-specific classes
    final typeClasses = _getTypeClasses(type);

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply type-specific classes
    this.classes.addAll(typeClasses);

    // Apply user overrides
    this.classes.addAll(classes);

    // Add message text
    element.text = message;
  }

  static List<String> _getTypeClasses(String type) {
    switch (type) {
      case 'success':
        return ['bg-green-500', 'text-white'];
      case 'warning':
        return ['bg-yellow-500', 'text-slate-900'];
      case 'danger':
        return ['bg-red-500', 'text-white'];
      case 'info':
      default:
        return ['bg-blue-500', 'text-white'];
    }
  }

  static const List<String> _defaultClasses = [
    'fixed',
    'top-4',
    'right-4',
    'p-16',
    'rounded-8',
    'shadow-lg',
    'z-50',
    'min-w-64',
  ];
}

