import 'dart:html';
import 'package:nevaeh_ui/nevaeh_ui.dart';

void main() {
  // Initialize KothariCSS
  KothariCSS();

  final app = DivElement()..id = 'app';
  document.body!.append(app);

  final btn = Button(title: "Click Me");
  btn.element.onClick.listen((_) => print("Clicked!"));

  final container = Container(
    children: [
      Heading(text: "Nevaeh UI Example", level: 1),
      Alert(message: "This is an example alert!", type: "success"),
      btn,
      Accordion(
        headers: ["Section 1", "Section 2"],
        contents: ["Content 1", "Content 2"],
      ),
      Avatar(src: "https://i.pravatar.cc/150"),
    ],
  );

  app.append(container.element);
}

