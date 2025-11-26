import 'dart:html';
import '../src/core/k_element.dart';

/// An Image component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Image(
///   src: "photo.jpg",
///   alt: "Description",
///   classes: ["rounded-12", "shadow-md"],
/// )
/// ```
class Image extends KElement {
  Image({
    required String src,
    String alt = "",
    String? width,
    String? height,
    List<String> classes = const [],
  }) : super(ImageElement()) {
    final imgElement = element as ImageElement;
    imgElement.src = src;
    imgElement.alt = alt;
    
    if (width != null) imgElement.width = int.tryParse(width) ?? 0;
    if (height != null) imgElement.height = int.tryParse(height) ?? 0;

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'max-w-full',
    'h-auto',
    'object-cover',
  ];
}

