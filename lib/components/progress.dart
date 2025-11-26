import 'dart:html';
import '../src/core/k_element.dart';

/// A Progress component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Progress(
///   value: 0.65, // 65%
/// )
/// ```
class Progress extends KElement {
  final KElement _bar;

  Progress({
    required double value, // 0.0 to 1.0
    List<String> classes = const [],
  }) : _bar = KElement(DivElement()),
        super(DivElement()) {
    // Clamp value between 0.0 and 1.0
    final clampedValue = value.clamp(0.0, 1.0);
    final percentage = (clampedValue * 100).toStringAsFixed(0);

    // Apply default classes to container
    this.classes.addAll(_defaultContainerClasses);
    this.classes.addAll(classes);

    // Apply default classes to bar
    _bar.classes.addAll(_defaultBarClasses);

    // Set bar width based on value
    _bar.element.style.width = '$percentage%';

    // Append bar to container
    element.append(_bar.element);
  }

  static const List<String> _defaultContainerClasses = [
    'w-full',
    'h-4',
    'bg-slate-200',
    'rounded-full',
    'overflow-hidden',
  ];

  static const List<String> _defaultBarClasses = [
    'h-full',
    'bg-blue-500',
    'transition-all',
    'duration-300',
  ];
}

