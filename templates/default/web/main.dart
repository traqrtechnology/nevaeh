import 'dart:html';

import 'package:nevaeh_ui/nevaeh_ui.dart'; // Import KElement explicitly
 // Import the new helpers (including featureBox)

void main() async {
  KothariCSS(); // Initialize CSS engine

  // Set basic body styles
  document.body!.style.fontFamily = 'sans-serif';
  document.body!.style.margin = '0';

  // ✨ TEST: Using the new Helpers!
  // We are building a page structure directly using div(), h1(), p(), etc.
  
  final page = div(
    classes: ["min-h-screen", "bg-slate-50", "flex", "items-center", "justify-center"],
    children: [
      div(
        classes: ["bg-white", "p-10", "rounded-2xl", "shadow-xl", "max-w-2xl", "w-full"],
        children: [
          // Heading Helper
          h1(
            text: "It Works! 🚀", 
            classes: ["text-5xl", "font-black", "text-transparent", "bg-clip-text", "bg-gradient-to-r", "from-blue-500", "to-purple-600", "mb-6"]
          ),

          // Paragraph Helper
          p(
            text: "You are successfully using the new HTML helpers. This entire card was built without using 'KElement' directly.",
            classes: ["text-slate-600", "text-lg", "mb-8", "leading-relaxed"]
          ),

          // Grid Layout Helper
          div(
            classes: ["grid", "grid-cols-2", "gap-4", "mb-8"],
            children: [
              featureBox(title: "✨ Smoother Syntax", codeSnippet: "h1(text: 'Hi')"),
              featureBox(title: "🎨 Utility Classes", codeSnippet: "classes: ['p-4']"),
              featureBox(title: "🧱 Nesting", codeSnippet: "div(children: [...])"),
              featureBox(title: "🔗 Cascade Support", codeSnippet: "..text = 'Cool'"),
            ]
          ),

          // Link Helper
          div(
            classes: ["flex", "justify-end"],
            children: [
              a(
                href: "https://github.com",
                text: "Learn More →",
                classes: ["text-blue-600", "font-bold", "hover:text-blue-800", "no-underline"]
              )
            ]
          )
        ]
      )
    ]
  );

  // Render to page
  page.appendToBody();
}
