import 'dart:io';

/// Scans all Dart files in the project for utility class names.
/// Example matches:
/// "text-32", 'sm:text-80', "bg-#ff00aa"
List<String> scanForUtilities() {
  final List<String> utilities = [];

  // SAFE REGEX (no raw strings, no bracket issues)
  // Updated to support 2xl: breakpoint, state variants, container queries, arbitrary variants, and more patterns
  final RegExp utilityRegex = RegExp(
     r'''["']((?:sm:|md:|lg:|xl:|2xl:)?(?:@container(?:\/[a-zA-Z0-9_-]+)?:)?(?:\[[^\]]+\]:)?(?:hover:|focus:|focus-within:|focus-visible:|active:|visited:|target:|first:|last:|only:|odd:|even:|first-of-type:|last-of-type:|only-of-type:|empty:|disabled:|enabled:|checked:|indeterminate:|default:|required:|valid:|invalid:|in-range:|out-of-range:|placeholder-shown:|autofill:|read-only:|read-write:|open:)?(?:!)?(?:[A-Za-z0-9\-\#\[\]\(\),\/]+))["']''',
     multiLine: true,
);



  void scanDirectory(Directory dir) {
    for (final entity in dir.listSync()) {
      if (entity is File && entity.path.endsWith('.dart')) {
        final content = entity.readAsStringSync();
        final matches = utilityRegex.allMatches(content);

        for (final match in matches) {
          final found = match.group(1)!;

          if (looksLikeUtility(found)) {
            utilities.add(found);
          }
        }
        } else if (entity is Directory) {
            scanDirectory(entity);
        }
    }
  }

  scanDirectory(Directory.current);
  return utilities.toSet().toList();
}

/// Validate that a string looks like a utility class.
/// Example:
/// text-32, sm:text-80, bg-#ff00aa, border-2, opacity-50, etc.
bool looksLikeUtility(String text) {
  // Allow responsive prefixes (including 2xl:)
  final respMatch = RegExp(r'^(sm:|md:|lg:|xl:|2xl:)').firstMatch(text);
  String core = text;
  if (respMatch != null) {
    core = text.substring(respMatch.group(1)!.length);
  }
  
  // Allow state variant prefixes
  final stateMatch = RegExp(r'^(hover:|focus:|focus-within:|focus-visible:|active:|visited:|target:|first:|last:|only:|odd:|even:|first-of-type:|last-of-type:|only-of-type:|empty:|disabled:|enabled:|checked:|indeterminate:|default:|required:|valid:|invalid:|in-range:|out-of-range:|placeholder-shown:|autofill:|read-only:|read-write:|open:)').firstMatch(core);
  if (stateMatch != null) {
    core = core.substring(stateMatch.group(1)!.length);
  }

  // Tailwind-style colour utilities (text-red-50, bg-blue-300, etc)
  final tailwindColor = RegExp(
    r'^(bg|text|border|shadow|ring|outline|fill|stroke)-[a-z]+-\d{1,3}$'
  );
  if (tailwindColor.hasMatch(core)) return true;

  // Arbitrary values (bg-[rgb(...)] etc)
  final arbitraryColor = RegExp(
    r'^(bg|text|border|shadow|ring|outline|fill|stroke)-\[[^\]]+\]$'
  );
  if (arbitraryColor.hasMatch(core)) return true;

  // Hex colours (bg-#ff00aa, text-#abc)
  final hexColor = RegExp(
    r'^(bg|text|border|shadow|ring|outline|fill|stroke)-#[A-Fa-f0-9]{3,6}$'
  );
  if (hexColor.hasMatch(core)) return true;

  // Font sizes
  if (RegExp(r'^text-\d+$').hasMatch(core)) return true;

  // Font weight
  if (RegExp(r'^font-weight-\d+$').hasMatch(core)) return true;

  // Padding & margin & spacing
  if (RegExp(r'^(p|pt|pr|pb|pl|px|py|m|mt|mr|mb|ml|mx|my)-\d+$').hasMatch(core)) {
    return true;
  }

  // Width / height (including fractions and named values)
  if (RegExp(r'^(w|h)-\d+$').hasMatch(core)) return true;
  if (RegExp(r'^(w|h)-\d+\/\d+$').hasMatch(core)) return true;
  if (RegExp(r'^(w|h)-(auto|full|screen|min|max|fit|px)$').hasMatch(core)) return true;
  
  // Min/Max width/height
  if (RegExp(r'^(min|max)-(w|h)-\d+$').hasMatch(core)) return true;
  if (RegExp(r'^(min|max)-(w|h)-(0|full|screen|min|max|fit|none|xs|sm|md|lg|xl|2xl|3xl|4xl|5xl|6xl|7xl|prose|screen-sm|screen-md|screen-lg|screen-xl|screen-2xl)$').hasMatch(core)) return true;

  // Rounded corners (all variants)
  if (RegExp(r'^rounded(-\d+)?$').hasMatch(core)) return true;
  if (RegExp(r'^rounded-(none|sm|md|lg|xl|2xl|3xl|full)$').hasMatch(core)) return true;
  if (RegExp(r'^rounded-(t|r|b|l|tl|tr|br|bl)(-\d+)?$').hasMatch(core)) return true;

  // Border utilities
  if (RegExp(r'^border(-\d+)?$').hasMatch(core)) return true;
  if (RegExp(r'^border-(0|2|4|8)$').hasMatch(core)) return true;
  if (RegExp(r'^border-(t|r|b|l|x|y)(-\d+)?$').hasMatch(core)) return true;
  if (RegExp(r'^border-(solid|dashed|dotted|double|none)$').hasMatch(core)) return true;

  // Opacity
  if (RegExp(r'^opacity-(0|5|10|20|25|30|40|50|60|70|75|80|90|95|100)$').hasMatch(core)) return true;
  if (RegExp(r'^opacity-\d+$').hasMatch(core)) return true;

  // Shadows
  if (RegExp(r'^shadow(-(sm|md|lg|xl|2xl|inner|none))?$').hasMatch(core)) return true;
  if (RegExp(r'^shadow-\[.+\]$').hasMatch(core)) return true;

  // Filters
  if (RegExp(r'^(filter|filter-none|blur|brightness|contrast|grayscale|hue-rotate|invert|saturate|sepia|drop-shadow)(-\d+)?$').hasMatch(core)) return true;
  if (RegExp(r'^backdrop-(filter|filter-none|blur|brightness|contrast|grayscale|hue-rotate|invert|opacity|saturate|sepia)(-\d+)?$').hasMatch(core)) return true;

  // Aspect ratio
  if (RegExp(r'^aspect-(auto|square|video)$').hasMatch(core)) return true;
  if (RegExp(r'^aspect-\d+\/\d+$').hasMatch(core)) return true;

  // Object fit/position
  if (RegExp(r'^object-(contain|cover|fill|none|scale-down)$').hasMatch(core)) return true;
  if (RegExp(r'^object-(bottom|center|left|right|top|left-bottom|left-top|right-bottom|right-top)$').hasMatch(core)) return true;

  // Overflow
  if (RegExp(r'^overflow(-(x|y))?-(auto|hidden|clip|visible|scroll)$').hasMatch(core)) return true;

  // Typography
  if (RegExp(r'^(text-(xs|sm|base|lg|xl|2xl|3xl|4xl|5xl|6xl|7xl|8xl|9xl))$').hasMatch(core)) return true;
  if (RegExp(r'^(font-(thin|extralight|light|normal|medium|semibold|bold|extrabold|black|sans|serif|mono|kothari|kothari-mono))$').hasMatch(core)) return true;
  if (RegExp(r'^(leading|tracking)-(none|tight|snug|normal|relaxed|loose|tighter|tight|wide|wider|widest)$').hasMatch(core)) return true;
  if (RegExp(r'^(leading|tracking)-\d+(\.\d+)?$').hasMatch(core)) return true;
  if (RegExp(r'^(text-(left|center|right|justify|start|end))$').hasMatch(core)) return true;
  if (RegExp(r'^(underline|overline|line-through|no-underline)$').hasMatch(core)) return true;
  if (RegExp(r'^(uppercase|lowercase|capitalize|normal-case)$').hasMatch(core)) return true;
  if (RegExp(r'^(truncate|text-ellipsis|text-clip)$').hasMatch(core)) return true;
  if (RegExp(r'^whitespace-(normal|nowrap|pre|pre-line|pre-wrap|break-spaces)$').hasMatch(core)) return true;
  if (RegExp(r'^break-(normal|words|all)$').hasMatch(core)) return true;

  // Transitions
  if (RegExp(r'^transition(-(none|all|colors|opacity|shadow|transform))?$').hasMatch(core)) return true;
  if (RegExp(r'^(duration|delay|ease)-(75|100|150|200|300|500|700|1000|linear|in|out|in-out)$').hasMatch(core)) return true;

  // Transforms
  if (RegExp(r'^(scale|rotate|translate-x|translate-y|skew-x|skew-y)(-\d+)?$').hasMatch(core)) return true;
  if (RegExp(r'^scale-(0|50|75|90|95|100|105|110|125|150)$').hasMatch(core)) return true;
  if (RegExp(r'^origin-(center|top|right|bottom|left|top-right|top-left|bottom-right|bottom-left)$').hasMatch(core)) return true;

  // Animation
  if (RegExp(r'^animate-(none|spin|ping|pulse|bounce)$').hasMatch(core)) return true;

  // Display
  if (RegExp(r'^(block|inline|inline-block|flex|inline-flex|grid|hidden|table|table-row|table-cell|contents|list-item)$').hasMatch(core)) return true;

  // Position
  if (RegExp(r'^(static|fixed|absolute|relative|sticky)$').hasMatch(core)) return true;

  // Visibility
  if (RegExp(r'^(visible|invisible)$').hasMatch(core)) return true;

  // Z-index
  if (RegExp(r'^z-(auto|0|10|20|30|40|50|\d+)$').hasMatch(core)) return true;

  // Sizing utilities
  if (RegExp(r'^(w|h)-(auto|full|screen|min|max|fit|0|px)$').hasMatch(core)) return true;

  // Flexbox
  if (RegExp(r'^flex-(row|col|wrap|nowrap|1|auto|initial|none)$').hasMatch(core)) return true;
  if (RegExp(r'^flex-(row|col)-reverse$').hasMatch(core)) return true;
  if (RegExp(r'^(grow|shrink)(-0)?$').hasMatch(core)) return true;
  if (RegExp(r'^items-(start|end|center|baseline|stretch)$').hasMatch(core)) return true;
  if (RegExp(r'^justify-(start|end|center|between|around|evenly)$').hasMatch(core)) return true;
  if (RegExp(r'^gap(-(x|y))?-\d+$').hasMatch(core)) return true;

  // Grid
  if (RegExp(r'^grid-cols-(\d+|none)$').hasMatch(core)) return true;
  if (RegExp(r'^grid-rows-(\d+|none)$').hasMatch(core)) return true;
  if (RegExp(r'^col-span-(\d+|full)$').hasMatch(core)) return true;
  if (RegExp(r'^row-span-(\d+|full)$').hasMatch(core)) return true;
  if (RegExp(r'^grid-flow-(row|col|dense|row-dense|col-dense)$').hasMatch(core)) return true;

  // Interactivity
  if (RegExp(r'^(pointer-events|select|cursor|resize)-(none|auto|text|all)$').hasMatch(core)) return true;
  if (RegExp(r'^cursor-(auto|default|pointer|wait|text|move|help|not-allowed|none|grab|grabbing)$').hasMatch(core)) return true;
  if (RegExp(r'^resize-(none|y|x|both)$').hasMatch(core)) return true;

  // Box model
  if (RegExp(r'^(box-border|box-content)$').hasMatch(core)) return true;
  if (RegExp(r'^(float|clear)-(left|right|both|none)$').hasMatch(core)) return true;

  // Lists
  if (RegExp(r'^list-(none|disc|decimal|inside|outside)$').hasMatch(core)) return true;

  // Tables
  if (RegExp(r'^(border-collapse|border-separate|table-auto|table-fixed)$').hasMatch(core)) return true;

  // Appearance
  if (RegExp(r'^appearance-none$').hasMatch(core)) return true;

  // Scroll
  if (RegExp(r'^scroll-(auto|smooth)$').hasMatch(core)) return true;

  // Isolation
  if (RegExp(r'^(isolate|isolation-auto)$').hasMatch(core)) return true;

  // Helper classes
  if (core == 'text-center' || core == 'text-left' || core == 'text-right' || core == 'text-justify') return true;

  return false;
}
