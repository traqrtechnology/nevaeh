import 'dart:html';
import '../src/core/k_element.dart';

/// A FlexRow component with default KothariUI styling.
///
/// Example:
/// ```dart
/// FlexRow(
///   children: [button1, button2],
///   classes: ["justify-between"],
/// )
/// ```
class FlexRow extends KElement {
  FlexRow({
    List<KElement> children = const [],
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);

    // Append children
    for (final child in children) {
      element.append(child.element);
    }
  }

  static const List<String> _defaultClasses = [
    'flex',
    'flex-row',
    'gap-12',
  ];
}

/// A FlexCol component with default KothariUI styling.
///
/// Example:
/// ```dart
/// FlexCol(
///   children: [text1, text2],
/// )
/// ```
class FlexCol extends KElement {
  FlexCol({
    List<KElement> children = const [],
    List<String> classes = const [],
  }) : super(DivElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);

    // Append children
    for (final child in children) {
      element.append(child.element);
    }
  }

  static const List<String> _defaultClasses = [
    'flex',
    'flex-col',
    'gap-12',
  ];
}

