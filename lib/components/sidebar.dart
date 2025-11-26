import 'dart:html';
import '../src/core/k_element.dart';

/// A Sidebar component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Sidebar(
///   items: [
///     Button(title: "Dashboard"),
///     Button(title: "Settings"),
///   ],
/// )
/// ```
class Sidebar extends KElement {
  Sidebar({
    required List<KElement> items,
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Append items
    for (final item in items) {
      element.append(item.element);
    }
  }

  static const List<String> _defaultClasses = [
    'w-64',
    'bg-white',
    'shadow-md',
    'p-20',
    'flex',
    'flex-col',
    'gap-8',
    'h-full',
  ];
}

