import 'dart:html';
import '../src/core/k_element.dart';
import 'button.dart';

/// A Pagination component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Pagination(
///   page: 1,
///   total: 10,
/// )
/// ```
class Pagination extends KElement {
  Pagination({
    required int page,
    required int total,
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Previous button
    final prevButton = Button(
      title: 'Previous',
      classes: page == 1 ? ['opacity-50', 'cursor-not-allowed'] : [],
    );

    // Page numbers
    for (int i = 1; i <= total; i++) {
      final isActive = i == page;
      final pageButton = Button(
        title: i.toString(),
        classes: [
          if (isActive) 'bg-blue-600' else 'bg-transparent',
          if (isActive) 'text-white' else 'text-slate-700',
        ],
      );
      element.append(pageButton.element);
    }

    // Next button
    final nextButton = Button(
      title: 'Next',
      classes: page == total ? ['opacity-50', 'cursor-not-allowed'] : [],
    );

    // Insert prev at start and next at end
    element.insertBefore(prevButton.element, element.firstChild);
    element.append(nextButton.element);
  }

  static const List<String> _defaultClasses = [
    'flex',
    'gap-4',
    'items-center',
  ];
}

