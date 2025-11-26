import 'dart:html';
import 'package:nevaeh_ui/nevaeh_ui.dart';



void main() {
  KothariCSS(); // This MUST run before anything else

  // Apply Kothari UI default font to body and ensure proper reset
  document.body!.style.fontFamily =
      '"Lato", "Source Sans 3", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif';
  document.body!.style.margin = '0';
  document.body!.style.padding = '0';
  document.body!.style.width = '100%';
  document.body!.style.maxWidth = '100%';
  document.body!.style.overflowX = 'hidden';

  // Main container
  final container = Container(
    children: [
      _createHeader(),
      _createButtonsSection(),
      _createCardsSection(),
      _createFormSection(),
      _createFeedbackSection(),
      _createLayoutSection(),
      _createDataDisplaySection(),
      _createComplexComponentsSection(),
    ],
    classes: ['py-12', 'sm:py-16', 'md:py-20'],
  );

  container.appendToBody();
}

KElement _createHeader() {
  return Container(
    children: [
      Text(
        'KothariUI Component Library',
        classes: ['text-3xl', 'sm:text-4xl', 'md:text-5xl', 'lg:text-6xl', 'font-weight-700', 'text-center', 'mb-8'],
      ),
      Text(
        'A complete component library built with Dart and KothariCSS',
        classes: ['text-base', 'sm:text-lg', 'md:text-xl', 'text-center', 'text-slate-600', 'mb-16'],
      ),
      Divider(),
    ],
  );
}

KElement _createButtonsSection() {
  return Card(
    children: [
      Text('Buttons', classes: ['text-2xl', 'sm:text-3xl', 'font-weight-700', 'mb-8']),
      FlexRow(
        children: [
          Button(title: 'Primary'),
          Button(title: 'Secondary', classes: ['bg-slate-600']),
          Button(title: 'Success', classes: ['bg-green-500']),
          Button(title: 'Danger', classes: ['bg-red-500']),
        ],
        classes: ['flex-wrap', 'gap-8'],
      ),
    ],
    classes: ['mb-16'],
  );
}

KElement _createCardsSection() {
  return Card(
    children: [
      Text('Cards', classes: ['text-2xl', 'sm:text-3xl', 'font-weight-700', 'mb-8']),
      Grid(
        cols: 3,
        children: [
          Card(
            children: [
              Text('Card 1', classes: ['text-lg', 'sm:text-xl', 'font-weight-600']),
              Text('This is a card component', classes: ['text-sm', 'sm:text-base', 'text-slate-600']),
            ],
          ),
          Card(
            children: [
              Text('Card 2', classes: ['text-lg', 'sm:text-xl', 'font-weight-600']),
              Text('With default styling', classes: ['text-sm', 'sm:text-base', 'text-slate-600']),
            ],
          ),
          Card(
            children: [
              Text('Card 3', classes: ['text-lg', 'sm:text-xl', 'font-weight-600']),
              Text('And custom classes', classes: ['text-sm', 'sm:text-base', 'text-slate-600']),
            ],
          ),
        ],
      ),
    ],
    classes: ['mb-16'],
  );
}

KElement _createFormSection() {
  return Card(
    children: [
      Text('Form Inputs', classes: ['text-2xl', 'sm:text-3xl', 'font-weight-700', 'mb-8']),
      FlexCol(
        children: [
          Input(placeholder: 'Email address'),
          Input(placeholder: 'Password', classes: ['mt-8']),
          Button(title: 'Submit', classes: ['mt-8', 'w-full']),
        ],
      ),
    ],
    classes: ['mb-16'],
  );
}

KElement _createFeedbackSection() {
  return Card(
    children: [
      Text('Feedback Components', classes: ['text-2xl', 'sm:text-3xl', 'font-weight-700', 'mb-8']),
      FlexCol(
        children: [
          Alert(message: 'This is an info alert', type: 'info'),
          Alert(message: 'This is a success alert', type: 'success', classes: ['mt-8']),
          Alert(message: 'This is a warning alert', type: 'warning', classes: ['mt-8']),
          Alert(message: 'This is a danger alert', type: 'danger', classes: ['mt-8']),
          FlexRow(
            children: [
              Badge(label: 'New'),
              Badge(label: 'Hot', classes: ['bg-red-500', 'text-white']),
              Badge(label: 'Sale', classes: ['bg-green-500', 'text-white']),
            ],
            classes: ['mt-8', 'gap-4'],
          ),
          FlexRow(
            children: [
              Spinner(),
              Progress(value: 0.65, classes: ['flex-1']),
            ],
            classes: ['mt-8', 'items-center', 'gap-8'],
          ),
        ],
      ),
    ],
    classes: ['mb-16'],
  );
}

KElement _createLayoutSection() {
  return Card(
    children: [
      Text('Layout Components', classes: ['text-2xl', 'sm:text-3xl', 'font-weight-700', 'mb-8']),
      Navbar(
        title: 'KothariUI',
        actions: [
          Button(title: 'Login', classes: ['bg-blue-500']),
          Button(title: 'Sign Up', classes: ['bg-green-500']),
        ],
        classes: ['mb-8'],
      ),
      Grid(
        cols: 2,
        children: [
          Card(children: [Text('Grid Item 1')]),
          Card(children: [Text('Grid Item 2')]),
        ],
      ),
    ],
    classes: ['mb-16'],
  );
}

KElement _createDataDisplaySection() {
  return Card(
    children: [
      Text('Data Display', classes: ['text-2xl', 'sm:text-3xl', 'font-weight-700', 'mb-8']),
      Table(
        headers: ['Name', 'Email', 'Role'],
        rows: [
          ['John Doe', 'john@example.com', 'Admin'],
          ['Jane Smith', 'jane@example.com', 'User'],
          ['Bob Johnson', 'bob@example.com', 'Editor'],
        ],
        classes: ['mb-8'],
      ),
      ListGroup(
        items: ['List Item 1', 'List Item 2', 'List Item 3'],
        classes: ['mb-8'],
      ),
      Breadcrumb(
        items: ['Home', 'Products', 'Details'],
        classes: ['mb-8'],
      ),
      FlexRow(
        children: [
          Avatar(src: 'https://via.placeholder.com/64', size: 64),
          Avatar(src: 'https://via.placeholder.com/48', size: 48),
          Avatar(src: 'https://via.placeholder.com/32', size: 32),
        ],
        classes: ['gap-4'],
      ),
    ],
    classes: ['mb-16'],
  );
}

KElement _createComplexComponentsSection() {
  return Card(
    children: [
      Text('Complex Components', classes: ['text-2xl', 'sm:text-3xl', 'font-weight-700', 'mb-8']),
      Tabs(
        labels: ['Home', 'About', 'Contact'],
        active: 0,
        classes: ['mb-8'],
      ),
      Accordion(
        headers: ['Section 1', 'Section 2', 'Section 3'],
        contents: [
          'This is the content for section 1',
          'This is the content for section 2',
          'This is the content for section 3',
        ],
        classes: ['mb-8'],
      ),
      Tooltip(
        child: Button(title: 'Hover for tooltip'),
        text: 'This is a tooltip!',
        classes: ['mb-8'],
      ),
      Pagination(
        page: 1,
        total: 5,
        classes: ['mb-8'],
      ),
    ],
  );
}

