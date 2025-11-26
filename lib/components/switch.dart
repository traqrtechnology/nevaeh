import 'dart:html';
import '../src/core/k_element.dart';

/// A Switch/Toggle component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Switch(
///   checked: true,
///   label: "Enable notifications",
///   classes: [],
/// )
/// ```
class Switch extends KElement {
  Switch({
    bool checked = false,
    String? label,
    List<String> classes = const [],
  }) : super(LabelElement()) {
    // Create hidden checkbox for state
    // Note: CheckboxInputElement already has type='checkbox' by default
    final checkbox = CheckboxInputElement()
      ..checked = checked
      ..classes.add('hidden');

    // Create switch track
    final track = DivElement()
      ..classes.addAll([
        'relative',
        'inline-flex',
        'h-20',
        'w-36',
        'flex-shrink-0',
        'cursor-pointer',
        'rounded-full',
        'border-2',
        'border-transparent',
        'transition-colors',
        'duration-300',
        'ease-in-out',
        checked ? 'bg-blue-500' : 'bg-slate-300',
        'focus:outline-none',
        'focus:ring-2',
        'focus:ring-blue-300',
      ]);

    // Create switch thumb
    final thumb = DivElement()
      ..classes.addAll([
        'pointer-events-none',
        'inline-block',
        'h-16',
        'w-16',
        'transform',
        'rounded-full',
        'bg-white',
        'shadow-lg',
        'ring-0',
        'transition',
        'duration-300',
        'ease-in-out',
        checked ? 'translate-x-16' : 'translate-x-0',
      ]);

    track.append(thumb);

    // Add checkbox and track to label
    element.append(checkbox);
    element.append(track);

    // Add label text if provided
    if (label != null) {
      final labelText = SpanElement()
        ..text = label
        ..classes.addAll(['ml-12', 'text-slate-700', 'cursor-pointer']);
      element.append(labelText);
    }

    // Apply default classes to label container
    this.classes.addAll(_labelDefaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);

    // Add click handler to toggle
    element.onClick.listen((e) {
      final currentChecked = checkbox.checked ?? false;
      checkbox.checked = !currentChecked;
      final newChecked = checkbox.checked ?? false;
      track.classes.removeAll(['bg-blue-500', 'bg-slate-300']);
      track.classes.add(newChecked ? 'bg-blue-500' : 'bg-slate-300');
      thumb.classes.removeAll(['translate-x-16', 'translate-x-0']);
      thumb.classes.add(newChecked ? 'translate-x-16' : 'translate-x-0');
    });
  }

  static const List<String> _labelDefaultClasses = [
    'flex',
    'items-center',
    'cursor-pointer',
  ];
}

