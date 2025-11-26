import 'dart:html';
import '../src/core/k_element.dart';

/// A Grid component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Grid(
///   cols: 3,
///   children: [card1, card2, card3],
/// )
/// ```
class Grid extends KElement {
  Grid({
    required int cols,
    List<KElement> children = const [],
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Add dynamic grid columns class
    this.classes.add('grid-cols-$cols');

    // Apply user overrides
    this.classes.addAll(classes);

    // Append children
    for (final child in children) {
      element.append(child.element);
    }
  }

  static const List<String> _defaultClasses = [
    'grid',
    'gap-12',
  ];
}

