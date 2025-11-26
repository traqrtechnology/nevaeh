import 'dart:html';
import '../src/core/k_element.dart';

/// A Tooltip component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Tooltip(
///   child: Button(title: "Hover me"),
///   text: "This is a tooltip",
/// )
/// ```
class Tooltip extends KElement {
  final KElement _tooltip;

  Tooltip({
    required KElement child,
    required String text,
    List<String> classes = const [],
  }) : _tooltip = KElement(DivElement()),
        super(DivElement()) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Setup tooltip
    _tooltip.classes.addAll(_tooltipClasses);
    _tooltip.element.text = text;
    _tooltip.classes.add('hidden'); // Initially hidden

    // Add hover handlers
    element.onMouseEnter.listen((e) {
      _tooltip.element.classes.remove('hidden');
    });

    element.onMouseLeave.listen((e) {
      _tooltip.classes.add('hidden');
    });

    // Append child and tooltip
    element.append(child.element);
    element.append(_tooltip.element);
  }

  static const List<String> _defaultClasses = [
    'relative',
    'inline-block',
  ];

  static const List<String> _tooltipClasses = [
    'absolute',
    'bottom-full',
    'left-1/2',
    'transform',
    '-translate-x-1/2',
    'mb-4',
    'px-12',
    'py-8',
    'bg-slate-900',
    'text-white',
    'text-sm',
    'rounded-6',
    'whitespace-nowrap',
    'z-50',
  ];
}

