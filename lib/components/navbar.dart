import 'dart:html';
import '../src/core/k_element.dart';

/// A Navbar component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Navbar(
///   title: "KothariUI",
///   actions: [
///     Button(title: "Login", classes: ["bg-blue-500"]),
///   ],
/// )
/// ```
class Navbar extends KElement {
  Navbar({
    required String title,
    List<KElement> actions = const [],
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);

    // Create title element
    final titleElement = KElement(HeadingElement.h1())
      ..element.text = title
      ..classes.addAll(['text-xl', 'font-weight-700', 'text-slate-900']);

    element.append(titleElement.element);

    // Create actions container
    if (actions.isNotEmpty) {
      final actionsContainer = KElement(DivElement())
        ..classes.addAll(['flex', 'gap-12', 'items-center']);

      for (final action in actions) {
        actionsContainer.element.append(action.element);
      }

      element.append(actionsContainer.element);
    }
  }

  static const List<String> _defaultClasses = [
    'w-full',
    'bg-white',
    'shadow-md',
    'px-20',
    'py-16',
    'flex',
    'justify-between',
    'items-center',
  ];
}

