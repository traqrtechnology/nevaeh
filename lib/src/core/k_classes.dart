import 'dart:html';
import 'kothari_css.dart';

class KClasses {
  final Element _element;

  KClasses(this._element);

  void add(String className) {
    _element.classes.add(className);
    KothariCSS.global.collectClass(className);
  }

  void addAll(List<String> classes) {
    for (final c in classes) {
      add(c);
    }
  }

  List<String> get value => _element.classes.toList();
}
