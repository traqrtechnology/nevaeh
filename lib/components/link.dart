import 'dart:html';
import '../src/core/k_element.dart';

/// A Link component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Link(
///   href: "/about",
///   text: "About Us",
///   classes: ["text-blue-500", "hover:underline"],
/// )
/// ```
class Link extends KElement {
  Link({
    required String href,
    required String text,
    String? target,
    List<String> classes = const [],
  }) : super(AnchorElement()) {
    final anchor = element as AnchorElement;
    anchor.href = href;
    anchor.text = text;
    
    if (target != null) {
      anchor.target = target;
    }

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'text-blue-500',
    'hover:text-blue-600',
    'hover:underline',
    'transition-colors',
    'duration-300',
    'cursor-pointer',
  ];
}

