import 'dart:html';
import '../src/core/k_element.dart';

/// An Avatar component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Avatar(
///   src: "profile.jpg",
///   size: 64,
///   classes: ["border-2", "border-blue-500"],
/// )
/// ```
class Avatar extends KElement {
  /// Creates a new [Avatar] instance.
  Avatar({
    required String src,
    int size = 48,
    List<String> classes = const [],
  }) : super(ImageElement()) {
    // Set image source
    (element as ImageElement).src = src;
    (element as ImageElement).alt = 'Avatar';

    // Set size
    element.style.width = '${size}px';
    element.style.height = '${size}px';

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'rounded-full',
    'overflow-hidden',
    'object-cover',
  ];
}

