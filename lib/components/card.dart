import 'dart:html';
import '../src/core/k_element.dart';

/// A Card component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Card(
///   children: [
///     Text("Welcome", classes: ["text-32"]),
///     Button(title: "Start"),
///   ],
/// )
/// ```
class Card extends KElement {
  Card({
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
    'bg-white',
    'rounded-12',
    'shadow-md',
    'p-20',
    'flex',
    'flex-col',
    'gap-12',
  ];
}

