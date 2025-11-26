import 'dart:html';
import '../src/core/k_element.dart';

/// An Alert component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Alert(
///   message: "Operation successful!",
///   type: "success",
/// )
/// ```
class Alert extends KElement {
  /// Creates a new [Alert] instance.
  Alert({
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
        return ['bg-green-500', 'text-white', 'border-green-600'];
      case 'warning':
        return ['bg-yellow-500', 'text-slate-900', 'border-yellow-600'];
      case 'danger':
        return ['bg-red-500', 'text-white', 'border-red-600'];
      case 'info':
      default:
        return ['bg-blue-500', 'text-white', 'border-blue-600'];
    }
  }

  static const List<String> _defaultClasses = [
    'p-16',
    'rounded-8',
    'border-l-4',
  ];
}

