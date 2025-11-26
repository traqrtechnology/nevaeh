import 'dart:html';
import '../src/core/k_element.dart';

/// Helper for <h1> element
KElement h1({String? text, List<String>? classes}) {
  final el = KElement(HeadingElement.h1());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <h2> element
KElement h2({String? text, List<String>? classes}) {
  final el = KElement(HeadingElement.h2());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <h3> element
KElement h3({String? text, List<String>? classes}) {
  final el = KElement(HeadingElement.h3());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <h4> element
KElement h4({String? text, List<String>? classes}) {
  final el = KElement(HeadingElement.h4());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <h5> element
KElement h5({String? text, List<String>? classes}) {
  final el = KElement(HeadingElement.h5());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <h6> element
KElement h6({String? text, List<String>? classes}) {
  final el = KElement(HeadingElement.h6());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <p> element
KElement p({String? text, List<String>? classes}) {
  final el = KElement(ParagraphElement());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <div> element
KElement div({List<KElement>? children, List<String>? classes}) {
  final el = KElement(DivElement());
  if (children != null) {
    for (var child in children) {
      el.element.append(child.element);
    }
  }
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <span> element
KElement span({String? text, List<String>? classes}) {
  final el = KElement(SpanElement());
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <img> element
KElement img({required String src, String? alt, List<String>? classes}) {
  final el = KElement(ImageElement(src: src));
  if (alt != null) (el.element as ImageElement).alt = alt;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <a> element
KElement a({required String href, String? text, List<String>? classes}) {
  final el = KElement(AnchorElement(href: href));
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}

/// Helper for <code> element
KElement code({String? text, List<String>? classes}) {
  final el = KElement(Element.tag('code'));
  if (text != null) el.text = text;
  if (classes != null) el.classes.addAll(classes);
  return el;
}
