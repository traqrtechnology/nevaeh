import 'dart:html';
import '../src/core/k_element.dart';

/// A Breadcrumb component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Breadcrumb(
///   items: ["Home", "Products", "Details"],
/// )
/// ```
class Breadcrumb extends KElement {
  Breadcrumb({
    required List<String> items,
    List<String> classes = const [],
  }) : super(Element.tag('nav')) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Create breadcrumb items
    for (int i = 0; i < items.length; i++) {
      final item = KElement(SpanElement())
        ..element.text = items[i]
        ..classes.addAll(_itemClasses);

      element.append(item.element);

      // Add separator (except for last item)
      if (i < items.length - 1) {
        final separator = KElement(SpanElement())
          ..element.text = ' / '
          ..classes.addAll(['text-slate-400', 'mx-4']);
        element.append(separator.element);
      }
    }
  }

  static const List<String> _defaultClasses = [
    'flex',
    'gap-4',
    'items-center',
    'text-sm',
  ];

  static const List<String> _itemClasses = [
    'text-slate-700',
    'hover:text-blue-500',
    'transition-colors',
    'duration-200',
  ];
}

