import 'dart:html';
import '../src/core/k_element.dart';

/// A CodeBlock component for code blocks with default KothariUI styling.
///
/// Example:
/// ```dart
/// CodeBlock(
///   code: "function hello() {\n  console.log('Hello');\n}",
///   language: "javascript",
///   classes: [],
/// )
/// ```
class CodeBlock extends KElement {
  CodeBlock({
    required String code,
    String? language,
    List<String> classes = const [],
  }) : super(PreElement()) {
    final preElement = element as PreElement;
    
    // Create code element inside pre
    final codeElement = Element.tag('code')
      ..text = code;
    
    if (language != null) {
      codeElement.classes.add('language-$language');
    }
    
    preElement.append(codeElement);

    // Apply default classes first
    this.classes.addAll(_defaultClasses);

    // Apply user overrides
    this.classes.addAll(classes);
  }

  static const List<String> _defaultClasses = [
    'font-mono',
    'bg-slate-900',
    'text-green-400',
    'p-16',
    'rounded-8',
    'overflow-x-auto',
    'text-sm',
    'whitespace-pre',
  ];
}

