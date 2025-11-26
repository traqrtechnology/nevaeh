import 'dart:html';
import '../src/core/k_element.dart';

/// A Container component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Container(
///   children: [
///     Text("Content"),
///   ],
/// )
/// ```
class Container extends KElement {
  Container({
    List<KElement> children = const [],
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);

    // Append children
    for (final child in children) {
      element.append(child.element);
    }
  }

  static const List<String> _defaultClasses = [
    'px-6',
    'sm:px-10',
    'md:px-16',
    'lg:px-20',
    'mx-auto',
    'w-full',
    'max-w-5xl',
  ];
}

