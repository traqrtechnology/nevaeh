import 'dart:html';
import '../src/core/k_element.dart';
import 'button.dart';

/// A Tabs component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Tabs(
///   labels: ["Home", "About", "Contact"],
///   active: 0,
/// )
/// ```
class Tabs extends KElement {
  Tabs({
    required List<String> labels,
    required int active,
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Create tab buttons container
    final tabsContainer = KElement(DivElement())
      ..classes.addAll(['flex', 'gap-4', 'border-b', 'border-slate-200']);

    // Create tab buttons
    for (int i = 0; i < labels.length; i++) {
      final isActive = i == active;
      final tabButton = Button(
        title: labels[i],
        classes: [
          'rounded-t-8',
          'rounded-b-0',
          'border-b-2',
          if (isActive) 'border-blue-500' else 'border-transparent',
          if (isActive) 'bg-blue-50' else 'bg-transparent',
        ],
      );

      tabsContainer.element.append(tabButton.element);
    }

    element.append(tabsContainer.element);
  }

  static const List<String> _defaultClasses = [
    'flex',
    'gap-4',
    'border-b',
    'border-slate-200',
  ];
}

