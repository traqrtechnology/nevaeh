import 'dart:html';
import '../src/core/k_element.dart';

/// A Table component with default KothariUI styling.
///
/// Example:
/// ```dart
/// Table(
///   headers: ["Name", "Email", "Role"],
///   rows: [
///     ["John", "john@example.com", "Admin"],
///     ["Jane", "jane@example.com", "User"],
///   ],
/// )
/// ```
class Table extends KElement {
  Table({
    required List<String> headers,
    required List<List<String>> rows,
    List<String> classes = const [],
  }) : super(TableElement()) {
    // Apply default classes
    this.classes.addAll(_defaultClasses);
    this.classes.addAll(classes);

    final table = element as TableElement;

    // Create header row
    final thead = table.createTHead();
    final headerRow = TableRowElement();

    for (final header in headers) {
      final th = Element.tag('th') as TableCellElement;
      th.text = header;
      th.classes.addAll(_headerCellClasses);
      headerRow.append(th);
    }

    thead.append(headerRow);

    // Create body rows
    final tbody = table.createTBody();

    for (final row in rows) {
      final tr = TableRowElement();

      for (final cell in row) {
        final td = Element.tag('td') as TableCellElement;
        td.text = cell;
        td.classes.addAll(_cellClasses);
        tr.append(td);
      }

      tbody.append(tr);
    }
  }

  static const List<String> _defaultClasses = [
    'w-full',
    'border-collapse',
  ];

  static const List<String> _headerCellClasses = [
    'bg-slate-100',
    'font-weight-600',
    'text-left',
    'p-12',
  ];

  static const List<String> _cellClasses = [
    'p-12',
    'border-b',
    'border-slate-200',
  ];
}

