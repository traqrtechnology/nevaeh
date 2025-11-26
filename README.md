# 🚀 Nevaeh UI - The Complete Dart Web Framework

**A powerful, modern web framework built entirely in Dart. Combines Tailwind-style utility CSS with React-style components, all compiled to blazing-fast JavaScript.**

---

## 📋 Table of Contents

- [🌟 Overview](#-overview)
- [📦 Installation](#-installation)
- [🧠 Core Concepts](#-core-concepts)
- [🧩 Component Library](#-component-library)
- [📡 JSON Helpers](#-json-helpers)
- [🛣️ Routing System](#️-routing-system)
- [🎨 Layouts](#-layouts)
- [📝 Metadata Management](#-metadata-management)
- [🛠️ CLI Commands](#️-cli-commands)
- [📁 Project Structure](#-project-structure)
- [💡 Examples](#-examples)

---

## 🌟 Overview

Nevaeh UI is a full-featured web framework that brings together:

- **🎨 Tailwind-Style CSS**: Utility-first CSS generation with full Tailwind compatibility
- **⚛️ React-Style Components**: Composable, reusable UI components
- **🚀 Zero Runtime Overhead**: CSS generated at build time, Dart compiled to optimized JavaScript
- **📡 JSON-First Architecture**: Built-in JSON helpers for API-driven development
- **🛣️ Rails-Like Routing**: RESTful routing with hash-based navigation
- **📱 Responsive by Default**: Mobile-first responsive utilities
- **🛠️ Powerful CLI**: Generate views, build CSS, compile JS, and serve your app

### About the Name

**Nevaeh UI** is named with love and purpose. Created by **shaquel kothari**, founder of **traqr**, this framework is inspired by his daughter Nevaeh—symbolizing the speed, power, and elegance that define both the framework and the inspiration behind it. Just as Nevaeh represents something beautiful and fast-moving, this framework delivers blazing-fast performance with a developer experience that feels effortless.

### Why Dart?

- **Fast JavaScript Output**: Dart compiles to highly optimized JavaScript
- **Type Safety**: Catch errors at compile time, not runtime
- **No Virtual DOM**: Direct DOM manipulation for maximum performance
- **No Bundlers**: Just `dart compile js` - simple and fast
- **Cross-Platform**: Same language for web, mobile (Flutter), and backend

---

## 📦 Installation

### Install from GitHub

Add Nevaeh UI to your `pubspec.yaml`:

```yaml
dependencies:
  nevaeh_ui:
    git:
      url: https://github.com/traqrtechnology/nevaeh.git
      ref: main
```

Then install dependencies:

```bash
dart pub get
```

### Install via Pub.dev (Coming Soon)

Once published to pub.dev:

```yaml
dependencies:
  nevaeh_ui: ^1.0.12
```

### Quick Start

1. **Add Nevaeh UI to your project** (see installation methods above)

2. **Install dependencies**:
   ```bash
   dart pub get
   ```

3. **Install the Nevaeh CLI globally** (optional, for project generation):
   ```bash
   dart pub global activate --source git https://github.com/traqrtechnology/nevaeh.git
   ```

4. **Create a new project** (if using CLI):
   ```bash
   nevaeh new my_app
   cd my_app
   ```

5. **Download fonts (optional)**:
   ```bash
   nevaeh fonts
   ```

6. **Start development server**:
   ```bash
   nevaeh server
   ```

7. **Open your browser**:
   ```
   http://localhost:8080
   ```

### Prerequisites

- Dart SDK 3.10.1 or higher
- Python 3 (for development server, optional)

---

## 🧠 Core Concepts

### KElement - The Foundation

`KElement` is the base class for all components. It wraps a native DOM element and provides utility class management. We've added helpers for common HTML tags to make it even smoother.

**Old Syntax:**
```dart
final heading = KElement(HeadingElement.h1())
  ..element.text = "Hello, World!"
  ..classes.addAll([
    "text-6xl",
    "font-bold",
    "text-blue-500",
    "text-center"
  ]);
```

**New Smoother Syntax:**
```dart
h1(
  text: "Hello, World!", 
  classes: ["text-6xl", "text-center"]
);

// Or with cascade
h1()
  ..text = "Hello, World!"
  ..classes.addAll(["text-6xl", "text-center"]);
```

### KClasses - Utility Class Management

`KClasses` automatically tracks utility classes for CSS generation:

```dart
final container = div()
  ..classes.add("p-20")           // Add single class
  ..classes.addAll([              // Add multiple classes
    "bg-white",
    "rounded-10",
    "shadow-lg"
  ]);
```

### CSS Generation

The framework automatically scans your Dart files and generates CSS for only the classes you use:

```dart
// In your Dart code
final card = div(
  classes: [
    "bg-blue-500",
    "p-20",
    "rounded-10",
    "hover:bg-blue-600"
  ]
);

// Run: nevaeh build
// Generates: web/kothari.css with only the classes you use
```

### Supported Utility Types

#### Colors
```dart
"bg-blue-500"        // Tailwind palette
"text-red-300"
"bg-slate-900"
"text-white"         // Named colors
"bg-#ff00aa"         // HEX colors
"bg-[rgb(20,20,20)]" // Arbitrary values
```

#### Spacing
```dart
"p-20"    // padding: 20px
"pt-10"   // padding-top: 10px
"mx-8"    // margin-left & right: 8px
"gap-4"   // gap: 4px
```

#### Typography
```dart
"text-32"           // font-size: 32px
"font-weight-600"   // font-weight: 600
"text-center"       // text-align: center
```

#### Responsive
```dart
"sm:text-80"       // Small screens: text-80
"md:bg-blue-300"   // Medium screens: bg-blue-300
"lg:w-1/2"         // Large screens: width 50%
"xl:rounded-20"    // Extra large: rounded-20
```

#### Layout
```dart
"flex"              // display: flex
"flex-col"          // flex-direction: column
"grid"              // display: grid
"grid-cols-3"       // grid-template-columns: repeat(3, 1fr)
"w-1/2"             // width: 50%
"h-full"            // height: 100%
```

---

## 🧩 Component Library

Nevaeh UI includes a comprehensive component library. All components extend `KElement` and can be customized with utility classes.

### Import Components

```dart
import 'lib/components/components.dart';
```

### Basic Components

#### Container

A flexible container component with default padding and max-width:

```dart
final container = Container(
  children: [
    p(text: "Hello"),
    Button(title: "Click me"),
  ],
  classes: [
    "bg-white",
    "rounded-lg",
    "shadow-md"
  ],
);
```

#### Text Helpers

Simple HTML text helpers:

```dart
// Headings
h1(text: "Heading 1", classes: ["text-4xl"]);
h2(text: "Heading 2", classes: ["text-3xl"]);
h3(text: "Heading 3", classes: ["text-2xl"]);

// Paragraph
p(
  text: "This is a paragraph.",
  classes: ["text-slate-600", "leading-relaxed"]
);

// Span
span(text: "inline text", classes: ["font-bold"]);

// Link
a(
  href: "/home",
  text: "Go Home",
  classes: ["text-blue-500", "underline"]
);
```

#### Button

Interactive button component:

```dart
final button = Button(
  title: "Click Me",
  classes: [
    "bg-blue-500",
    "hover:bg-blue-600",
    "text-white",
    "rounded-full",
    "px-10",
    "py-4"
  ],
);

// Add click handler
button.element.onClick.listen((e) {
  print("Button clicked!");
  Router().navigate("/home");
});
```

### Layout Components

#### FlexRow

Horizontal flex container:

```dart
final row = FlexRow(
  children: [
    Button(title: "Left"),
    Button(title: "Center"),
    Button(title: "Right"),
  ],
  classes: [
    "gap-4",
    "justify-between",
    "items-center"
  ],
);
```

#### FlexCol

Vertical flex container:

```dart
final col = FlexCol(
  children: [
    p(text: "Item 1"),
    p(text: "Item 2"),
    p(text: "Item 3"),
  ],
  classes: [
    "gap-6",
    "items-center"
  ],
);
```

#### Grid

CSS Grid container:

```dart
final grid = Grid(
  cols: 3,  // Number of columns
  children: [
    _buildCard("Card 1"),
    _buildCard("Card 2"),
    _buildCard("Card 3"),
  ],
  classes: [
    "gap-8",
    "grid-cols-1",
    "md:grid-cols-3"
  ],
);
```

#### FeatureBox (New!)

A styled box for highlighting features or code snippets:

```dart
featureBox(
  title: "Awesome Feature", 
  codeSnippet: "feature()"
);
```

### Form Components

#### Input

Text input field:

```dart
final input = Input(
  placeholder: "Enter your name",
  classes: [
    "w-full",
    "p-4",
    "border",
    "border-slate-300",
    "rounded-lg",
    "focus:border-blue-500",
    "focus:ring-2",
    "focus:ring-blue-200"
  ],
);

// Get value
final value = (input.element as InputElement).value;

// Set value
(input.element as InputElement).value = "Default text";
```

#### Textarea

Multi-line text input:

```dart
final textarea = Textarea(
  placeholder: "Enter your message",
  rows: 5,
  classes: [
    "w-full",
    "p-4",
    "border",
    "rounded-lg"
  ],
);
```

#### Select

Dropdown select:

```dart
final select = Select(
  options: [
    SelectOption(value: "1", label: "Option 1"),
    SelectOption(value: "2", label: "Option 2"),
    SelectOption(value: "3", label: "Option 3"),
  ],
  classes: [
    "w-full",
    "p-4",
    "border",
    "rounded-lg"
  ],
);
```

#### Checkbox

Checkbox input:

```dart
final checkbox = Checkbox(
  label: "I agree to the terms",
  checked: false,
  classes: ["text-slate-700"],
);

// Get checked state
final isChecked = (checkbox.element as CheckboxInputElement).checked;
```

#### Radio

Radio button group:

```dart
final radio = Radio(
  name: "choice",
  options: [
    RadioOption(value: "a", label: "Option A"),
    RadioOption(value: "b", label: "Option B"),
  ],
  classes: ["gap-4"],
);
```

### Content Components

#### Image Helper

Image component:

```dart
final image = img(
  src: "https://example.com/image.jpg",
  alt: "Description",
  classes: [
    "w-full",
    "rounded-lg",
    "shadow-md"
  ]
);
```

#### Code

Inline code:

```dart
final code = Code(
  text: "const x = 10;",
  classes: [
    "bg-slate-100",
    "px-2",
    "py-1",
    "rounded",
    "text-sm",
    "font-mono"
  ],
);
```

#### CodeBlock

Code block with syntax highlighting:

```dart
final codeBlock = CodeBlock(
  code: '''
void main() {
  print("Hello, World!");
}
''',
  language: "dart",
  classes: [
    "bg-slate-900",
    "text-white",
    "p-6",
    "rounded-lg",
    "text-sm"
  ],
);
```

### Feedback Components

#### Alert

Alert message:

```dart
final alert = Alert(
  message: "Success! Your changes have been saved.",
  type: AlertType.success,  // success, error, warning, info
  classes: ["mb-4"],
);
```

#### Badge

Small badge/tag:

```dart
final badge = Badge(
  text: "New",
  classes: [
    "bg-blue-500",
    "text-white",
    "px-3",
    "py-1",
    "rounded-full",
    "text-xs",
    "font-bold"
  ],
);
```

#### Toast

Toast notification (requires manual display):

```dart
final toast = Toast(
  message: "Operation completed!",
  type: ToastType.success,
  duration: 3000,  // milliseconds
);

// Show toast
toast.show();
```

#### Spinner

Loading spinner:

```dart
final spinner = Spinner(
  size: 40,  // pixels
  classes: ["text-blue-500"],
);
```

#### Progress

Progress bar:

```dart
final progress = Progress(
  value: 75,  // 0-100
  max: 100,
  classes: [
    "w-full",
    "h-4",
    "bg-slate-200",
    "rounded-full",
    "overflow-hidden"
  ],
);
```

### Complex Components

#### Modal

Modal dialog:

```dart
final modal = Modal(
  title: "Confirm Action",
  content: p(text: "Are you sure you want to proceed?"),
  footer: [
    Button(title: "Cancel", classes: ["bg-gray-500"]),
    Button(title: "Confirm", classes: ["bg-blue-500"]),
  ],
  classes: ["max-w-md"],
);

// Show modal
modal.show();

// Hide modal
modal.hide();
```

#### Dropdown

Dropdown menu:

```dart
final dropdown = Dropdown(
  trigger: Button(title: "Menu"),
  items: [
    DropdownItem(text: "Option 1", onTap: () => print("1")),
    DropdownItem(text: "Option 2", onTap: () => print("2")),
    DropdownItem.divider(),
    DropdownItem(text: "Option 3", onTap: () => print("3")),
  ],
  classes: ["relative"],
);
```

#### Tabs

Tabbed interface:

```dart
final tabs = Tabs(
  items: [
    TabItem(label: "Tab 1", content: p(text: "Content 1")),
    TabItem(label: "Tab 2", content: p(text: "Content 2")),
    TabItem(label: "Tab 3", content: p(text: "Content 3")),
  ],
  classes: ["w-full"],
);
```

#### Accordion

Collapsible accordion:

```dart
final accordion = Accordion(
  items: [
    AccordionItem(
      title: "Section 1",
      content: p(text: "Content for section 1"),
    ),
    AccordionItem(
      title: "Section 2",
      content: p(text: "Content for section 2"),
    ),
  ],
  classes: ["w-full"],
);
```

### Data Display Components

#### Table

Data table:

```dart
final table = Table(
  headers: ["Name", "Email", "Role"],
  rows: [
    ["John Doe", "john@example.com", "Admin"],
    ["Jane Smith", "jane@example.com", "User"],
  ],
  classes: [
    "w-full",
    "border-collapse",
    "border",
    "border-slate-300"
  ],
);
```

#### Avatar

User avatar:

```dart
final avatar = Avatar(
  src: "https://i.pravatar.cc/150?u=1",
  size: 64,  // pixels
  classes: [
    "rounded-full",
    "border-4",
    "border-white",
    "shadow-md"
  ],
);
```

#### Breadcrumb

Navigation breadcrumb:

```dart
final breadcrumb = Breadcrumb(
  items: ["Home", "Products", "Details"],
  classes: ["mb-4"],
);
```

#### Pagination

Pagination controls:

```dart
final pagination = Pagination(
  currentPage: 1,
  totalPages: 10,
  onPageChange: (page) {
    print("Page changed to: $page");
  },
  classes: ["flex", "gap-2"],
);
```

---

## 📡 JSON Helpers

Nevaeh UI includes a Ruby-like JSON helper for making HTTP requests. It's simple, elegant, and handles all the boilerplate.

### Import JSON Helper

```dart
import 'lib/utils/json_client.dart';
// or
import 'lib/components/components.dart';  // Exports Json
```

### Basic Usage

#### GET Request

```dart
// Simple GET
final users = await Json.get('https://api.example.com/users');

// With headers
final user = await Json.get(
  'https://api.example.com/users/1',
  headers: {'X-Custom-Header': 'value'},
);
```

#### POST Request

```dart
// POST with body
final newPost = await Json.post(
  'https://api.example.com/posts',
  {
    'title': 'My Post',
    'body': 'Content here',
    'userId': 1,
  },
);

// POST with headers
final result = await Json.post(
  'https://api.example.com/posts',
  {'title': 'Post'},
  headers: {'Authorization': 'Bearer token'},
);
```

#### PUT Request

```dart
final updated = await Json.put(
  'https://api.example.com/posts/1',
  {
    'title': 'Updated Title',
    'body': 'Updated content',
  },
);
```

#### PATCH Request

```dart
final patched = await Json.patch(
  'https://api.example.com/posts/1',
  {'title': 'New Title'},
);
```

#### DELETE Request

```dart
await Json.delete('https://api.example.com/posts/1');
```

### Global Configuration

#### Bearer Token

Set a global bearer token for all requests:

```dart
// Set once at app startup
Json.bearerToken = 'your-secret-token';

// Now all requests include Authorization header
final data = await Json.get('https://api.example.com/protected');
```

#### Global Headers

Set headers that apply to all requests:

```dart
Json.globalHeaders = {
  'X-API-Key': 'your-api-key',
  'X-Client-Version': '1.0.0',
};

// All requests now include these headers
final data = await Json.get('https://api.example.com/data');
```

### Error Handling

```dart
try {
  final user = await Json.get('https://api.example.com/users/1');
  print('User: ${user['name']}');
} on HttpException catch (e) {
  print('HTTP Error ${e.statusCode}: ${e.message}');
} catch (e) {
  print('Error: $e');
}
```

### Real-World Example

```dart
Future<KElement> render() async {
  // Fetch data from API
  List<dynamic> posts;
  try {
    posts = await Json.get('https://jsonplaceholder.typicode.com/posts');
  } catch (e) {
    // Fallback to empty list
    posts = [];
  }

  // Render UI with data
  return Container(
    children: posts.take(10).map((post) {
      return Card(
        children: [
          h2(text: post['title']),
          p(text: post['body']),
        ],
        classes: ['mb-4'],
      );
    }).toList(),
    classes: ['p-6'],
  );
}
```

---

## 🛣️ Routing System

Nevaeh UI includes a Rails-like routing system with hash-based navigation.

### Basic Routing

```dart
import 'lib/routing/router.dart';

final router = Router();

// Define routes
router.get('/', (params) async {
  final view = await home_view.render();
  ApplicationLayout.render(view);
});

router.get('/users', (params) async {
  final view = await users_index_view.render();
  ApplicationLayout.render(view);
});

router.get('/users/:id', (params) async {
  final userId = params['id'];
  final view = await users_show_view.render(userId: userId);
  ApplicationLayout.render(view);
});

// Initialize router
router.init();
```

### HTTP Methods

```dart
// GET
router.get('/posts', (params) async {
  // Handle GET request
});

// POST
router.post('/posts', (params) async {
  // Handle POST request
});

// PUT
router.put('/posts/:id', (params) async {
  // Handle PUT request
});

// DELETE
router.delete('/posts/:id', (params) async {
  // Handle DELETE request
});
```

### RESTful Resources

```dart
// Creates: GET /users, GET /users/:id, POST /users, etc.
router.resources('users',
  index: (params) async {
    final view = await users_index_view.render();
    ApplicationLayout.render(view);
  },
  show: (params) async {
    final userId = params['id'];
    final view = await users_show_view.render(userId: userId);
    ApplicationLayout.render(view);
  },
);
```

### Navigation

```dart
// Navigate programmatically
Router().navigate('/users/1');

// Navigate with parameters
Router().navigate('/users/1', params: {'tab': 'profile'});
```

### Route Parameters

```dart
router.get('/users/:id/posts/:postId', (params) async {
  final userId = params['id'];        // "1"
  final postId = params['postId'];    // "42"
  
  // Fetch and render
});
```

### Auto-Generated Routes

Routes are auto-generated when you create views:

```bash
nevaeh generate view products/show
```

This automatically adds a route in `lib/routes.dart`.

---

## 🎨 Layouts

Layouts wrap your views with common elements like navbars and footers.

### ApplicationLayout

The main layout for your application:

```dart
import 'web/layouts/application.dart';

// In your view
Future<KElement> render() async {
  // Your view content
  return Container(
    children: [
      p(text: "Page content"),
    ],
  );
}

// In router
router.get('/home', (params) async {
  final view = await home_view.render();
  ApplicationLayout.render(view);  // Wraps with navbar/footer
});
```

### Custom Layouts

Create custom layouts by extending the pattern:

```dart
// web/layouts/admin.dart
class AdminLayout {
  static void render(KElement viewContent) {
    document.body?.children.clear();
    
    final layout = Container(
      children: [
        _buildAdminNavbar(),
        viewContent,
        _buildAdminFooter(),
      ],
      classes: ['min-h-screen', 'flex', 'flex-col'],
    );
    
    layout.appendToBody();
  }
  
  static KElement _buildAdminNavbar() {
    // Admin-specific navbar
  }
}
```

---

## 📝 Metadata Management

Set page metadata for SEO and social sharing:

```dart
import 'lib/config/metadata.dart';

// In your view
void _setMetadata() {
  Metadata.title = 'Home - My App';
  Metadata.description = 'Welcome to my amazing app';
  Metadata.keywords = 'dart, web, framework';
  Metadata.isRoot = true;  // Makes this the root path '/'
  
  // Open Graph (Facebook)
  Metadata.ogTitle = 'My App Home';
  Metadata.ogDescription = 'Welcome to my app';
  Metadata.ogImage = 'https://example.com/og-image.jpg';
  Metadata.ogUrl = 'https://example.com';
  
  // Twitter Card
  Metadata.twitterCard = 'summary_large_image';
  Metadata.twitterTitle = 'My App';
  Metadata.twitterDescription = 'Welcome!';
  Metadata.twitterImage = 'https://example.com/twitter-image.jpg';
  1048|}
  1049|
  1050|Future<KElement> render() async {
  1051|  _setMetadata();  // Set before rendering
  1052|  return Container(/* ... */);
  1053|}
  1054|```
  1055|
  1056|---
  1057|
  1058|## 🛠️ CLI Commands
  1059|
  1060|The `nevaeh` CLI provides powerful commands:
  1061|
  1062|### Server
  1063|
  1064|Start development server (builds CSS, compiles JS, serves app):
  1065|
  1066|```bash
  1067|nevaeh server
  1068|```
  1069|
  1070|### Build CSS
  1071|
  1072|Generate CSS from your Dart files:
  1073|
  1074|```bash
  1075|nevaeh build
  1076|```
  1077|
  1078|### Compile JavaScript
  1079|
  1080|Compile Dart to JavaScript:
  1081|
  1082|```bash
  1083|nevaeh compile
  1084|```
  1085|
  1086|### Development Workflow
  1087|
  1088|Full dev workflow (build + compile):
  1089|
  1090|```bash
  1091|nevaeh dev
  1092|```
  1093|
  1094|### Generate View
  1095|
  1096|Create a new view with boilerplate:
  1097|
  1098|```bash
  1099|nevaeh generate view products/show
  1100|nevaeh generate view users/index --path web/views
  1101|```
  1102|
  1103|### Analyze Code
  1104|
  1105|Check for errors and warnings:
  1106|
  1107|```bash
  1108|nevaeh analyze
  1109|nevaeh analyze lib/ web/
  1110|nevaeh analyze --errors-only
  1111|```
  1112|
  1113|### Download Fonts
  1114|
  1115|Download and self-host fonts:
  1116|
  1117|```bash
  1118|nevaeh fonts
  1119|```
  1120|
  1121|---
  1122|
  1123|## 📁 Project Structure
  1124|
  1125|```
  1126|project/
  1127|├── bin/
  1128|│   └── kothari.dart          # CLI entry point
  1129|├── lib/
  1130|│   ├── components/           # Component library
  1131|│   │   ├── button.dart
  1132|│   │   ├── container.dart
  1133|│   │   ├── input.dart
  1134|│   │   └── components.dart   # Main export
  1135|│   │   └── feature_box.dart  # New feature box helper
  1136|│   ├── config/
  1137|│   │   └── metadata.dart     # Metadata management
  1138|│   ├── generators/           # Code generators
  1139|│   ├── routing/
  1140|│   │   └── router.dart       # Router implementation
  1141|│   ├── utils/
  1142|│   │   └── json_client.dart  # JSON helpers
  1143|│   └── routes.dart           # Auto-generated routes
  1144|├── web/
  1145|│   ├── layouts/
  1146|│   │   └── application.dart  # Main layout
  1147|│   ├── views/
  1148|│   │   ├── home.dart         # Example view
  1149|│   │   └── users/
  1150|│   │       └── index.dart    # Nested view
  1151|│   ├── main.dart             # Entry point
  1152|│   ├── main.js               # Compiled JavaScript
  1153|│   ├── kothari.css           # Generated CSS
  1154|│   └── index.html            # HTML template
  1155|├── k_element.dart            # Core KElement class
  1156|├── k_classes.dart            # Utility class manager
  1157|├── kothari_css.dart          # CSS engine
  1158|├── kothari_scanner.dart      # Class scanner
  1159|├── styles.dart               # CSS build script
  1160|└── pubspec.yaml              # Dependencies
  1161|```
  1162|
  1163|---
  1164|
  1165|## 💡 Examples
  1166|
  1167|### Complete View Example
  1168|
  1169|```dart
  1170|// web/views/users/show.dart
  1171|import 'dart:html';
  1172|import '../../k_element.dart';
  1173|import '../../lib/components/components.dart';
  1174|import '../../lib/routing/router.dart';
  1175|import '../layouts/application.dart';
  1176|import '../../lib/config/metadata.dart';
  1177|
  1178|void _setMetadata() {
  1179|  Metadata.title = 'User Profile - My App';
  1180|  Metadata.description = 'View user profile';
  1181|}
  1182|
  1183|Future<KElement> render({String? userId}) async {
  1184|  _setMetadata();
  1185|  
  1186|  // Fetch user data
  1187|  dynamic user;
  1188|  try {
  1189|    user = await Json.get('https://api.example.com/users/$userId');
  1190|  } catch (e) {
  1191|    user = {'name': 'Unknown User'};
  1192|  }
  1193|  
  1194|  return Container(
  1195|    children: [
  1196|      Breadcrumb(
  1197|        items: ['Home', 'Users', user['name']],
  1198|        classes: ['mb-6'],
  1199|      ),
  1200|      Card(
  1201|        children: [
  1202|          FlexRow(
  1203|            children: [
  1204|              Avatar(
  1205|                src: user['avatar'] ?? 'https://i.pravatar.cc/150',
  1206|                size: 128,
  1207|                classes: ['rounded-full'],
  1208|              ),
  1209|              FlexCol(
  1210|                children: [
  1211|                  h1(text: user['name']),
  1212|                  p(text: user['email'] ?? 'No email'),
  1213|                  Badge(text: user['role'] ?? 'User'),
  1214|                ],
  1215|                classes: ['gap-4'],
  1216|              ),
  1217|            ],
  1218|            classes: ['gap-8', 'items-center'],
  1219|          ),
  1220|        ],
  1221|        classes: ['p-8'],
  1222|      ),
  1223|    ],
  1224|    classes: ['p-6', 'max-w-4xl', 'mx-auto'],
  1225|  );
  1226|}
  1227|```
  1228|
  1229|### Form Example
  1230|
  1231|```dart
  1232|KElement _buildForm() {
  1233|  final form = Form(
  1234|    children: [
  1235|      Input(
  1236|        placeholder: "Name",
  1237|        classes: ["w-full", "mb-4"],
  1238|      ),
  1239|      Textarea(
  1240|        placeholder: "Message",
  1241|        rows: 5,
  1242|        classes: ["w-full", "mb-4"],
  1243|      ),
  1244|      Button(
  1245|        title: "Submit",
  1246|        classes: ["w-full", "bg-blue-500"],
  1247|      ),
  1248|    ],
  1249|    classes: ["max-w-md", "mx-auto"],
  1250|  );
  1251|  
  1252|  // Handle form submission
  1253|  (form.element as FormElement).onSubmit.listen((e) {
  1254|    e.preventDefault();
  1255|    // Handle submission
  1256|  });
  1257|  
  1258|  return form;
  1259|}
  1260|```
  1261|
  1262|### API Integration Example
  1263|
  1264|```dart
  1265|Future<KElement> render() async {
  1266|  // Set global auth token
  1267|  Json.bearerToken = 'your-api-token';
  1268|  
  1269|  // Fetch data
  1270|  List<dynamic> items;
  1271|  try {
  1272|    items = await Json.get('https://api.example.com/items');
  1273|  } catch (e) {
  1274|    items = [];
  1275|  }
  1276|  
  1277|  // Render list
  1278|  return Container(
  1279|    children: items.isEmpty
  1280|      ? [p(text: "No items found")]
  1281|      : items.map((item) {
  1282|          return Card(
  1283|            children: [
  1284|              h3(text: item['title']),
  1285|              p(text: item['description']),
  1286|              Button(
  1287|                title: "Delete",
  1288|                classes: ["bg-red-500", "mt-4"],
  1289|              )..element.onClick.listen((e) async {
  1290|                  try {
  1291|                    await Json.delete('https://api.example.com/items/${item['id']}');
  1292|                    // Refresh page or update UI
  1293|                  } catch (e) {
  1294|                    Alert(message: "Failed to delete").show();
  1295|                  }
  1296|                }),
  1297|            ],
  1298|            classes: ["mb-4"],
  1299|          );
  1300|        }).toList(),
  1301|    classes: ["p-6"],
  1302|  );
  1303|}
  1304|```
  1305|
  1306|### Responsive Layout Example
  1307|
  1308|```dart
  1309|KElement _buildResponsiveGrid() {
  1310|  return Grid(
  1311|    cols: 3,
  1312|    children: [
  1313|      _buildCard("Card 1"),
  1314|      _buildCard("Card 2"),
  1315|      _buildCard("Card 3"),
  1316|    ],
  1317|    classes: [
  1318|      "grid-cols-1",      // Mobile: 1 column
  1319|      "sm:grid-cols-2",   // Small: 2 columns
  1320|      "md:grid-cols-3",   // Medium: 3 columns
  1321|      "lg:grid-cols-4",   // Large: 4 columns
  1322|      "gap-6",
  1323|      "p-6",
  1324|    ],
  1325|  );
  1326|}
  1327|```
  1328|
  1329|---
  1330|
  1331|## 🤝 Contributing
  1332|
  1333|Contributions are welcome! Please:
  1334|
  1335|1. Fork the repository
  1336|2. Create a feature branch
  1337|3. Make your changes
  1338|4. Submit a pull request
  1339|
  1340|---
  1341|
  1342|## 📄 License
  1343|
  1344|MIT License - Copyright (c) 2024 traqr  
Created by shaquel kothari, founder of traqr
  1345|
  1346|---
  1347|
  1348|## 💖 Made with Love
  1349|
  1350|Nevaeh UI is built with passion and purpose. Created by **shaquel kothari**, founder of **traqr**, this framework is a testament to speed, power, and the love that drives innovation. Named after his daughter Nevaeh, this framework embodies the same qualities: fast, powerful, and built to make a difference.

Enjoy building amazing web applications with Nevaeh UI! 🚀
  1351|
  1352|---
  1353|
  1354|**Happy Coding! 🚀**
  1355|# nevaeh
# nevaeh
# nevaeh
# nevaeh
# nevaeh
# nevaeh
