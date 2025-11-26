import 'dart:html';
import '../src/core/k_element.dart';

/// A Form component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Form(
///   children: [
///     Label(text: "Email", forId: "email"),
///     Input(placeholder: "Enter email"),
///     Button(title: "Submit"),
///   ],
///   onSubmit: (e) => print("Submitted"),
/// )
/// ```
class Form extends KElement {
  Form({
    List<KElement> children = const [],
    void Function(Event)? onSubmit,
    List<String> classes = const [],
  }) : super(FormElement()) {
    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);

    // Add submit handler if provided
    if (onSubmit != null) {
      (element as FormElement).onSubmit.listen(onSubmit);
    }

    // Append children
    for (final child in children) {
      element.append(child.element);
    }
  }

  static const List<String> _defaultClasses = [
    'w-full',
    'flex',
    'flex-col',
    'gap-12',
  ];
}

