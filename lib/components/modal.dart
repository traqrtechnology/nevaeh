import 'dart:html';
import '../src/core/k_element.dart';

/// A Modal component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Modal(
///   open: isOpen,
///   child: Text("Hello"),
/// )
/// ```
class Modal extends KElement {
  final KElement _overlay;
  final KElement _content;

  Modal({
    required bool open,
    required KElement child,
    List<String> classes = const [],
  }) : _overlay = KElement(DivElement()),
        _content = KElement(DivElement()),
        super(DivElement()) {
    // Apply wrapper classes
    this.classes.addAll(_wrapperClasses);

    // Apply user overrides to wrapper
    this.classes.addAll(classes);

    // Setup overlay
    _overlay.classes.addAll(_overlayClasses);

    // Setup content
    _content.classes.addAll(_contentClasses);
    _content.element.append(child.element);

    // Append overlay and content
    element.append(_overlay.element);
    element.append(_content.element);

    // Handle open/close state
    if (!open) {
      this.classes.add('hidden');
    }
  }

  static const List<String> _wrapperClasses = [
    'fixed',
    'inset-0',
    'bg-black/50',
    'flex',
    'justify-center',
    'items-center',
    'z-50',
  ];

  static const List<String> _overlayClasses = [
    'absolute',
    'inset-0',
    'bg-black/50',
  ];

  static const List<String> _contentClasses = [
    'bg-white',
    'rounded-12',
    'shadow-lg',
    'p-24',
    'w-1/3',
    'relative',
    'z-10',
  ];
}

