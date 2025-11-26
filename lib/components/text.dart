import 'dart:html';
import '../src/core/k_element.dart';

/// A Text component helper for creating text elements.
///
/// Example:
/// ```dart
/// Text("Welcome", classes: ["text-32"])
/// ```
class Text extends KElement {
  Text(
    String content, {
    List<String> classes = const [],
  }) : super(ParagraphElement()) {
    // Set text content
    element.text = content;

    // Apply user classes
    this.classes.addAll(classes);
  }
}

