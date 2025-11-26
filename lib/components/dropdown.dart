import 'dart:html';
import '../src/core/k_element.dart';
import 'button.dart';

/// A Dropdown component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Dropdown(
///   label: "Menu",
///   items: [
///     Button(title: "Option 1"),
///     Button(title: "Option 2"),
///   ],
/// )
/// ```
class Dropdown extends KElement {
  final KElement _menu;
  bool _isOpen = false;

  Dropdown({
    required String label,
    required List<KElement> items,
    List<String> classes = const [],
  }) : _menu = KElement(DivElement()),
        super(DivElement()) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    // Create trigger button
    final trigger = Button(
      title: label,
      classes: ['relative'],
    );

    // Setup menu container
    _menu.classes.addAll(_menuClasses);
    _menu.classes.add('hidden'); // Initially hidden

    // Add items to menu
    for (final item in items) {
      _menu.element.append(item.element);
    }

    // Add click handler to toggle menu
    trigger.element.onClick.listen((e) {
      _toggleMenu();
    });

    // Append trigger and menu
    element.append(trigger.element);
    element.append(_menu.element);
  }

  void _toggleMenu() {
    _isOpen = !_isOpen;
    if (_isOpen) {
      // Remove hidden class by manipulating the element directly
      _menu.element.classes.remove('hidden');
    } else {
      _menu.classes.add('hidden');
    }
  }

  static const List<String> _defaultClasses = [
    'relative',
  ];

  static const List<String> _menuClasses = [
    'absolute',
    'top-full',
    'left-0',
    'mt-4',
    'bg-white',
    'rounded-8',
    'shadow-lg',
    'p-8',
    'min-w-48',
    'z-50',
    'flex',
    'flex-col',
    'gap-4',
  ];
}

