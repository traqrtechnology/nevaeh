import '../src/core/k_element.dart';
import 'html_helpers.dart';

/// A pre-styled feature box component.
/// 
/// Usage:
/// ```dart
/// featureBox(
///   title: "Cool Feature", 
///   codeSnippet: "feature()"
/// )
/// ```
KElement featureBox({
  required String title, 
  required String codeSnippet, 
  List<String>? classes
}) {
  return div(
    classes: [
      "p-4", 
      "bg-slate-50", 
      "rounded-lg", 
      "border", 
      "border-slate-100", 
      ...?classes
    ],
    children: [
      h3(text: title, classes: ["font-bold", "text-slate-800", "mb-2"]),
      code(text: codeSnippet, classes: [
        "text-xs", 
        "font-mono", 
        "text-blue-500", 
        "bg-blue-50", 
        "px-2", 
        "py-1", 
        "rounded"
      ])
    ]
  );
}

