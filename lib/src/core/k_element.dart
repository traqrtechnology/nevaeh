import 'dart:html';
import 'k_classes.dart';

class KElement {
  final Element element;
  late KClasses classes;

  KElement(this.element) {
    classes = KClasses(element);
  }

  /// Helper to set inner text
  set text(String value) => element.text = value;
  
  /// Helper to get inner text
  String get text => element.text ?? "";

  void appendToBody() {
    document.body!.append(element);
  }
}
