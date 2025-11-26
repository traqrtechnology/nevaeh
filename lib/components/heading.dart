import 'dart:html';
import '../src/core/k_element.dart';

/// A Heading component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Heading(
///   level: 1,
///   text: "Main Title",
///   classes: ["text-center"],
/// )
/// ```
class Heading extends KElement {
  Heading({
    required int level,
    required String text,
    List<String> classes = const [],
  }) : super(_createHeadingElement(level)) {
    element.text = text;

    // Apply default classes first
    this.classes.addAll(_getDefaultClasses(level));

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static Element _createHeadingElement(int level) {
    switch (level) {
      case 1:
        return HeadingElement.h1();
      case 2:
        return HeadingElement.h2();
      case 3:
        return HeadingElement.h3();
      case 4:
        return HeadingElement.h4();
      case 5:
        return HeadingElement.h5();
      case 6:
        return HeadingElement.h6();
      default:
        return HeadingElement.h1();
    }
  }

  static List<String> _getDefaultClasses(int level) {
    switch (level) {
      case 1:
        return ['text-5xl', 'font-weight-700', 'text-slate-900', 'mb-8'];
      case 2:
        return ['text-4xl', 'font-weight-700', 'text-slate-900', 'mb-6'];
      case 3:
        return ['text-3xl', 'font-weight-600', 'text-slate-900', 'mb-4'];
      case 4:
        return ['text-2xl', 'font-weight-600', 'text-slate-900', 'mb-4'];
      case 5:
        return ['text-xl', 'font-weight-600', 'text-slate-900', 'mb-3'];
      case 6:
        return ['text-lg', 'font-weight-600', 'text-slate-900', 'mb-3'];
      default:
        return ['text-3xl', 'font-weight-600', 'text-slate-900', 'mb-4'];
    }
  }
}

