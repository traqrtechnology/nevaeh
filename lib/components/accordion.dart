import 'dart:html';
import '../src/core/k_element.dart';

/// An Accordion component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Accordion(
///   headers: ["Section 1", "Section 2"],
///   contents: ["Content 1", "Content 2"],
/// )
/// ```
class Accordion extends KElement {
  /// Creates a new [Accordion] instance.
  Accordion({
    required List<String> headers,
    required List<String> contents,
    List<String> classes = const [],
  }) : super(DivElement()) {
    if (headers.length != contents.length) {
      throw ArgumentError('Headers and contents must have the same length');
    }

    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Create accordion items
    for (int i = 0; i < headers.length; i++) {
      final item = _createAccordionItem(headers[i], contents[i]);
      element.append(item.element);
    }
  }

  KElement _createAccordionItem(String header, String content) {
    final item = KElement(DivElement())
      ..classes.addAll(['border-b', 'border-slate-200', 'last:border-b-0']);

    // Create header
    final headerElement = KElement(DivElement())
      ..classes.addAll(_headerClasses)
      ..element.text = header;

    // Create content (initially hidden)
    final contentElement = KElement(DivElement())
      ..classes.addAll(_contentClasses)
      ..classes.add('hidden')
      ..element.text = content;

    // Add click handler to toggle content
    headerElement.element.onClick.listen((e) {
      if (contentElement.element.classes.contains('hidden')) {
        contentElement.element.classes.remove('hidden');
      } else {
        contentElement.classes.add('hidden');
      }
    });

    item.element.append(headerElement.element);
    item.element.append(contentElement.element);

    return item;
  }

  static const List<String> _defaultClasses = [
    'flex',
    'flex-col',
    'border',
    'border-slate-200',
    'rounded-8',
    'overflow-hidden',
  ];

  static const List<String> _headerClasses = [
    'p-16',
    'bg-slate-50',
    'cursor-pointer',
    'flex',
    'justify-between',
    'items-center',
    'hover:bg-slate-100',
    'transition-all',
    'duration-300',
  ];

  static const List<String> _contentClasses = [
    'p-16',
    'border-t',
    'border-slate-200',
  ];
}

