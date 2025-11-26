import 'dart:html';
import '../src/core/k_element.dart';

/// A ListGroup component with default KothariUI styling.
///
/// Example:
/// ```dart
/// ListGroup(
///   items: ["Item 1", "Item 2", "Item 3"],
/// )
/// ```
class ListGroup extends KElement {
  ListGroup({
    required List<String> items,
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Create list items
    for (int i = 0; i < items.length; i++) {
      final item = KElement(DivElement())
        ..element.text = items[i]
        ..classes.addAll(_itemClasses);

      // Remove border from last item
      if (i == items.length - 1) {
        item.classes.add('last:border-b-0');
      }

      element.append(item.element);
    }
  }

  static const List<String> _defaultClasses = [
    'flex',
    'flex-col',
    'border',
    'border-slate-200',
    'rounded-8',
    'overflow-hidden',
  ];

  static const List<String> _itemClasses = [
    'p-12',
    'border-b',
    'border-slate-200',
  ];
}

