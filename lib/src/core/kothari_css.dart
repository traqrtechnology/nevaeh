// Dart IO import removed for web compatibility

//
//======================================================================
// TAILWIND COLOUR PALETTE (EXTEND AS NEEDED)
//======================================================================
//
const Map<String, String> kTailwindColors = {
  // SLATE
  "slate-50": "#f8fafc",
  "slate-100": "#f1f5f9",
  "slate-200": "#e2e8f0",
  "slate-300": "#cbd5e1",
  "slate-400": "#94a3b8",
  "slate-500": "#64748b",
  "slate-600": "#475569",
  "slate-700": "#334155",
  "slate-800": "#1e293b",
  "slate-900": "#0f172a",
  "slate-950": "#020617",

  // GRAY
  "gray-50": "#f9fafb",
  "gray-100": "#f3f4f6",
  "gray-200": "#e5e7eb",
  "gray-300": "#d1d5db",
  "gray-400": "#9ca3af",
  "gray-500": "#6b7280",
  "gray-600": "#4b5563",
  "gray-700": "#374151",
  "gray-800": "#1f2937",
  "gray-900": "#111827",
  "gray-950": "#030712",

  // ZINC
  "zinc-50": "#fafafa",
  "zinc-100": "#f4f4f5",
  "zinc-200": "#e4e4e7",
  "zinc-300": "#d4d4d8",
  "zinc-400": "#a1a1aa",
  "zinc-500": "#71717a",
  "zinc-600": "#52525b",
  "zinc-700": "#3f3f46",
  "zinc-800": "#27272a",
  "zinc-900": "#18181b",
  "zinc-950": "#09090b",

  // NEUTRAL
  "neutral-50": "#fafafa",
  "neutral-100": "#f5f5f5",
  "neutral-200": "#e5e5e5",
  "neutral-300": "#d4d4d4",
  "neutral-400": "#a3a3a3",
  "neutral-500": "#737373",
  "neutral-600": "#525252",
  "neutral-700": "#404040",
  "neutral-800": "#262626",
  "neutral-900": "#171717",
  "neutral-950": "#0a0a0a",

  // STONE
  "stone-50": "#fafaf9",
  "stone-100": "#f5f5f4",
  "stone-200": "#e7e5e4",
  "stone-300": "#d6d3d1",
  "stone-400": "#a8a29e",
  "stone-500": "#78716c",
  "stone-600": "#57534e",
  "stone-700": "#44403c",
  "stone-800": "#292524",
  "stone-900": "#1c1917",
  "stone-950": "#0c0a09",

  // RED
  "red-50": "#fef2f2",
  "red-100": "#fee2e2",
  "red-200": "#fecaca",
  "red-300": "#fca5a5",
  "red-400": "#f87171",
  "red-500": "#ef4444",
  "red-600": "#dc2626",
  "red-700": "#b91c1c",
  "red-800": "#991b1b",
  "red-900": "#7f1d1d",
  "red-950": "#450a0a",

  // ORANGE
  "orange-50": "#fff7ed",
  "orange-100": "#ffedd5",
  "orange-200": "#fed7aa",
  "orange-300": "#fdba74",
  "orange-400": "#fb923c",
  "orange-500": "#f97316",
  "orange-600": "#ea580c",
  "orange-700": "#c2410c",
  "orange-800": "#9a3412",
  "orange-900": "#7c2d12",
  "orange-950": "#431407",

  // AMBER
  "amber-50": "#fffbeb",
  "amber-100": "#fef3c7",
  "amber-200": "#fde68a",
  "amber-300": "#fcd34d",
  "amber-400": "#fbbf24",
  "amber-500": "#f59e0b",
  "amber-600": "#d97706",
  "amber-700": "#b45309",
  "amber-800": "#92400e",
  "amber-900": "#78350f",
  "amber-950": "#451a03",

  // YELLOW
  "yellow-50": "#fefce8",
  "yellow-100": "#fef9c3",
  "yellow-200": "#fef08a",
  "yellow-300": "#fde047",
  "yellow-400": "#facc15",
  "yellow-500": "#eab308",
  "yellow-600": "#ca8a04",
  "yellow-700": "#a16207",
  "yellow-800": "#854d0e",
  "yellow-900": "#713f12",
  "yellow-950": "#422006",

  // LIME
  "lime-50": "#f7fee7",
  "lime-100": "#ecfccb",
  "lime-200": "#d9f99d",
  "lime-300": "#bef264",
  "lime-400": "#a3e635",
  "lime-500": "#84cc16",
  "lime-600": "#65a30d",
  "lime-700": "#4d7c0f",
  "lime-800": "#365314",
  "lime-900": "#1a2e05",
  "lime-950": "#0f1c02",

  // GREEN
  "green-50": "#f0fdf4",
  "green-100": "#dcfce7",
  "green-200": "#bbf7d0",
  "green-300": "#86efac",
  "green-400": "#4ade80",
  "green-500": "#22c55e",
  "green-600": "#16a34a",
  "green-700": "#15803d",
  "green-800": "#166534",
  "green-900": "#14532d",
  "green-950": "#052e16",

  // EMERALD
  "emerald-50": "#ecfdf5",
  "emerald-100": "#d1fae5",
  "emerald-200": "#a7f3d0",
  "emerald-300": "#6ee7b7",
  "emerald-400": "#34d399",
  "emerald-500": "#10b981",
  "emerald-600": "#059669",
  "emerald-700": "#047857",
  "emerald-800": "#065f46",
  "emerald-900": "#064e3b",
  "emerald-950": "#022c22",

  // TEAL
  "teal-50": "#f0fdfa",
  "teal-100": "#ccfbf1",
  "teal-200": "#99f6e4",
  "teal-300": "#5eead4",
  "teal-400": "#2dd4bf",
  "teal-500": "#14b8a6",
  "teal-600": "#0d9488",
  "teal-700": "#0f766e",
  "teal-800": "#115e59",
  "teal-900": "#134e4a",
  "teal-950": "#042f2e",

  // CYAN
  "cyan-50": "#ecfeff",
  "cyan-100": "#cffafe",
  "cyan-200": "#a5f3fc",
  "cyan-300": "#67e8f9",
  "cyan-400": "#22d3ee",
  "cyan-500": "#06b6d4",
  "cyan-600": "#0891b2",
  "cyan-700": "#0e7490",
  "cyan-800": "#155e75",
  "cyan-900": "#164e63",
  "cyan-950": "#083344",

  // SKY
  "sky-50": "#f0f9ff",
  "sky-100": "#e0f2fe",
  "sky-200": "#bae6fd",
  "sky-300": "#7dd3fc",
  "sky-400": "#38bdf8",
  "sky-500": "#0ea5e9",
  "sky-600": "#0284c7",
  "sky-700": "#0369a1",
  "sky-800": "#075985",
  "sky-900": "#0c4a6e",
  "sky-950": "#082f49",

  // BLUE
  "blue-50": "#eff6ff",
  "blue-100": "#dbeafe",
  "blue-200": "#bfdbfe",
  "blue-300": "#93c5fd",
  "blue-400": "#60a5fa",
  "blue-500": "#3b82f6",
  "blue-600": "#2563eb",
  "blue-700": "#1d4ed8",
  "blue-800": "#1e40af",
  "blue-900": "#1e3a8a",
  "blue-950": "#172554",

  // INDIGO
  "indigo-50": "#eef2ff",
  "indigo-100": "#e0e7ff",
  "indigo-200": "#c7d2fe",
  "indigo-300": "#a5b4fc",
  "indigo-400": "#818cf8",
  "indigo-500": "#6366f1",
  "indigo-600": "#4f46e5",
  "indigo-700": "#4338ca",
  "indigo-800": "#3730a3",
  "indigo-900": "#312e81",
  "indigo-950": "#1e1b4b",

  // VIOLET
  "violet-50": "#f5f3ff",
  "violet-100": "#ede9fe",
  "violet-200": "#ddd6fe",
  "violet-300": "#c4b5fd",
  "violet-400": "#a78bfa",
  "violet-500": "#8b5cf6",
  "violet-600": "#7c3aed",
  "violet-700": "#6d28d9",
  "violet-800": "#5b21b6",
  "violet-900": "#4c1d95",
  "violet-950": "#2e1065",

  // PURPLE
  "purple-50": "#faf5ff",
  "purple-100": "#f3e8ff",
  "purple-200": "#e9d5ff",
  "purple-300": "#d8b4fe",
  "purple-400": "#c084fc",
  "purple-500": "#a855f7",
  "purple-600": "#9333ea",
  "purple-700": "#7e22ce",
  "purple-800": "#6b21a8",
  "purple-900": "#581c87",
  "purple-950": "#3b0764",

  // FUCHSIA
  "fuchsia-50": "#fdf4ff",
  "fuchsia-100": "#fae8ff",
  "fuchsia-200": "#f5d0fe",
  "fuchsia-300": "#f0abfc",
  "fuchsia-400": "#e879f9",
  "fuchsia-500": "#d946ef",
  "fuchsia-600": "#c026d3",
  "fuchsia-700": "#a21caf",
  "fuchsia-800": "#86198f",
  "fuchsia-900": "#701a75",
  "fuchsia-950": "#4a044e",

  // PINK
  "pink-50": "#fdf2f8",
  "pink-100": "#fce7f3",
  "pink-200": "#fbcfe8",
  "pink-300": "#f9a8d4",
  "pink-400": "#f472b6",
  "pink-500": "#ec4899",
  "pink-600": "#db2777",
  "pink-700": "#be185d",
  "pink-800": "#9f1239",
  "pink-900": "#831843",
  "pink-950": "#500724",

  // ROSE
  "rose-50": "#fff1f2",
  "rose-100": "#ffe4e6",
  "rose-200": "#fecdd3",
  "rose-300": "#fda4af",
  "rose-400": "#fb7185",
  "rose-500": "#f43f5e",
  "rose-600": "#e11d48",
  "rose-700": "#be123c",
  "rose-800": "#9f1239",
  "rose-900": "#881337",
  "rose-950": "#4c0519",
};

//
//======================================================================
// NAMED COLOURS
//======================================================================
//
const Map<String, String> kNamedColors = {
  "white": "#ffffff",
  "black": "#000000",
  "transparent": "transparent",
  "current": "currentColor",
};

//
//======================================================================
// TAILWIND SPACING SCALE (0–96)
//======================================================================
//
const Map<int, String> kSpacingScale = {
  0: "0px",
  1: "0.25rem",
  2: "0.5rem",
  3: "0.75rem",
  4: "1rem",
  5: "1.25rem",
  6: "1.5rem",
  8: "2rem",
  10: "2.5rem",
  12: "3rem",
  16: "4rem",
  20: "5rem",
  24: "6rem",
  32: "8rem",
  40: "10rem",
  48: "12rem",
  56: "14rem",
  64: "16rem",
  72: "18rem",
  80: "20rem",
  96: "24rem",
};


//
//======================================================================
// KOTHARI CSS ENGINE
//======================================================================
//

class KothariCSS {
  static late KothariCSS global;

  KothariCSS() {
    global = this;
  }

  final Map<String, String> breakpoints = {
    'sm': '640px',
    'md': '768px',
    'lg': '1024px',
    'xl': '1280px',
    '2xl': '1536px',
  };
  
  // Container query names (for @container support)
  final Set<String> containerNames = {};

  final Map<String, Map<String, String>> utilities = {};

  void utility(String className, Map<String, String> styles) {
    utilities[className] = styles;
  }

  void collectClass(String className) {
    utilities.putIfAbsent(className, () => {});
  }

  String generateCss() {
    final buffer = StringBuffer();

    // CSS RESET - Ensure proper centering and no default margins/padding
    buffer.write('''
/* Kothari UI CSS Reset */
*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  margin: 0;
  padding: 0;
  width: 100%;
  max-width: 100%;
  overflow-x: hidden;
}

''');

    // KOTHARI UI FONT FACE DECLARATIONS (self-hosted, fast loading)
    buffer.write(_generateFontFaces());

    // STATIC (direct utilities)
    utilities.forEach((className, styles) {
      if (styles.isNotEmpty) {
        final important = className.startsWith('!');
        final cleanClass = important ? className.substring(1) : className;
        buffer.write('.$cleanClass {');
        styles.forEach((prop, value) {
          buffer.write('$prop: $value${important ? ' !important' : ''};');
        });
        buffer.write('}\n');
      }
    });

    // DYNAMIC UTILITIES
    utilities.keys.forEach((className) {
      final important = className.startsWith('!');
      final cleanClass = important ? className.substring(1) : className;
      final dyn = dynamicUtility(className);
      if (dyn != null) {
        final css = important ? dyn.replaceAll(';', ' !important;') : dyn;
        buffer.write('.$cleanClass { $css }\n');
      }
    });

    // STATE VARIANTS (hover:, focus:, etc.)
    utilities.keys.forEach((className) {
      final state = stateVariantUtility(className);
      if (state != null) {
        // Handle important modifier in state variants
        if (className.startsWith('!')) {
          final importantState = state.replaceAll(';', ' !important;');
          buffer.write(importantState.replaceAll(RegExp(r'\.!'), '.').replaceAll('\\:', ':') + '\n');
        } else {
          buffer.write('$state\n');
        }
      }
    });

    // ARBITRARY VARIANTS ([&>p]:, [&_p]:, etc.)
    utilities.keys.forEach((className) {
      final arbitrary = arbitraryVariantUtility(className);
      if (arbitrary != null) {
        // Handle important modifier in arbitrary variants
        if (className.startsWith('!')) {
          final importantArbitrary = arbitrary.replaceAll(';', ' !important;');
          buffer.write(importantArbitrary.replaceAll(RegExp(r'\.!'), '.').replaceAll('\\:', ':') + '\n');
        } else {
          buffer.write('$arbitrary\n');
        }
      }
    });

    // CONTAINER QUERIES (@container)
    utilities.keys.forEach((className) {
      final container = containerQueryUtility(className);
      if (container != null) {
        // Handle important modifier in container queries
        if (className.startsWith('!')) {
          final importantContainer = container.replaceAll(';', ' !important;');
          buffer.write(importantContainer.replaceAll(RegExp(r'\.!'), '.').replaceAll('\\:', ':') + '\n');
        } else {
          buffer.write('$container\n');
        }
      }
    });

    // RESPONSIVE UTILITIES
    utilities.keys.forEach((className) {
      final res = responsiveUtility(className);
      if (res != null) {
        // Handle important modifier in responsive utilities
        if (className.startsWith('!')) {
          final importantRes = res.replaceAll(';', ' !important;');
          buffer.write(importantRes.replaceAll(RegExp(r'\.!'), '.').replaceAll('\\:', ':') + '\n');
        } else {
          buffer.write('$res\n');
        }
      }
    });

    return buffer.toString();
  }

  //
  //======================================================================
  // DYNAMIC UTILITY RESOLUTION
  //======================================================================
  //
  // IMPLEMENTED CATEGORIES:
  // ✅ Display (block, inline, flex, grid, table, contents, etc.)
  // ✅ Flexbox (direction, wrap, grow, shrink, align-items, justify-content, gap)
  // ✅ Grid (columns, rows, span, flow)
  // ✅ Position (static, relative, absolute, fixed, sticky)
  // ✅ Spacing (padding, margin, gap - all variants)
  // ✅ Width/Height (w-full, h-screen, fractions, min/max variants)
  // ✅ Borders (width, style, radius - all variants)
  // ✅ Colors (bg, text, border, fill, stroke, placeholder, caret, accent)
  // ✅ Typography (font-size, font-weight, font-family, line-height, letter-spacing)
  // ✅ Text (alignment, decoration, transform, overflow, whitespace)
  // ✅ Opacity
  // ✅ Shadows (box-shadow utilities)
  // ✅ Filters (blur, brightness, contrast, grayscale, hue-rotate, invert, saturate, sepia, drop-shadow)
  // ✅ Backdrop Filters (all variants)
  // ✅ Transitions (property, duration, timing, delay)
  // ✅ Transforms (scale, rotate, translate, skew, origin)
  // ✅ Animation (spin, ping, pulse, bounce)
  // ✅ Overflow (all variants)
  // ✅ Object Fit/Position
  // ✅ Aspect Ratio
  // ✅ Visibility
  // ✅ Z-Index
  // ✅ Cursor
  // ✅ Pointer Events
  // ✅ User Select
  // ✅ Resize
  // ✅ Isolation
  // ✅ Box Sizing
  // ✅ Float/Clear
  // ✅ List Style
  // ✅ Table Layout
  // ✅ Appearance
  // ✅ Scroll Behavior
  // ✅ Stroke Width (SVG)
  // ✅ Inset utilities
  // ✅ Margin Auto
  //
  // TODO:
  // ⚠️ Complete Tailwind color palette (currently only red, blue, slate partial)
  // ⚠️ State variants (hover:, focus:, active:, etc.) - requires architecture change
  // ⚠️ Container queries (@container) - requires architecture change
  // ⚠️ Arbitrary variants ([&>p]:) - requires architecture change
  // ⚠️ Important modifier (!) - requires architecture change
  //
  String? dynamicUtility(String className) {
    // Strip responsive prefixes (sm:, md:, lg:, xl:, 2xl:)
    var core = className;
    final respPref = RegExp(r'^(sm:|md:|lg:|xl:|2xl:)').firstMatch(core);
    if (respPref != null) {
      core = core.substring(respPref.group(1)!.length);
    }
    
    // Strip container query prefixes (@container, @container/name)
    final containerPref = RegExp(r'^@container(?:\/([a-zA-Z0-9_-]+))?\:').firstMatch(core);
    if (containerPref != null) {
      final name = containerPref.group(1);
      if (name != null) {
        containerNames.add(name);
      }
      core = core.substring(containerPref.group(0)!.length);
    }
    
    // Strip arbitrary variant prefixes ([&>p]:, [&_p]:, etc.)
    final arbitraryPref = RegExp(r'^\[([^\]]+)\]\:').firstMatch(core);
    if (arbitraryPref != null) {
      core = core.substring(arbitraryPref.group(0)!.length);
    }
    
    // Strip state variant prefixes (hover:, focus:, etc.)
    final statePref = RegExp(r'^(hover:|focus:|focus-within:|focus-visible:|active:|visited:|target:|first:|last:|only:|odd:|even:|first-of-type:|last-of-type:|only-of-type:|empty:|disabled:|enabled:|checked:|indeterminate:|default:|required:|valid:|invalid:|in-range:|out-of-range:|placeholder-shown:|autofill:|read-only:|read-write:|open:)').
        firstMatch(core);
    if (statePref != null) {
      core = core.substring(statePref.group(1)!.length);
    }
    
    // Strip important modifier (!)
    if (core.startsWith('!')) {
      core = core.substring(1);
    }

    //
    // ---------------------------------------------------------------
    // DISPLAY
    // ---------------------------------------------------------------
    if (core == "block") return "display: block;";
    if (core == "inline") return "display: inline;";
    if (core == "inline-block") return "display: inline-block;";
    if (core == "flex") return "display: flex;";
    if (core == "inline-flex") return "display: inline-flex;";
    if (core == "grid") return "display: grid;";
    if (core == "hidden") return "display: none;";
    if (core == "table") return "display: table;";
    if (core == "table-row") return "display: table-row;";
    if (core == "table-cell") return "display: table-cell;";
    if (core == "contents") return "display: contents;";
    if (core == "list-item") return "display: list-item;";

    //
    // ---------------------------------------------------------------
    // FLEXBOX
    // ---------------------------------------------------------------
    // flex-direction
    if (core == "flex-row") return "flex-direction: row;";
    if (core == "flex-row-reverse") return "flex-direction: row-reverse;";
    if (core == "flex-col") return "flex-direction: column;";
    if (core == "flex-col-reverse") return "flex-direction: column-reverse;";
    
    // flex-wrap
    if (core == "flex-wrap") return "flex-wrap: wrap;";
    if (core == "flex-nowrap") return "flex-wrap: nowrap;";
    if (core == "flex-wrap-reverse") return "flex-wrap: wrap-reverse;";
    
    // flex (grow/shrink/basis)
    if (core == "flex-1") return "flex: 1 1 0%;";
    if (core == "flex-auto") return "flex: 1 1 auto;";
    if (core == "flex-initial") return "flex: 0 1 auto;";
    if (core == "flex-none") return "flex: none;";
    
    // grow
    if (core == "grow") return "flex-grow: 1;";
    if (core == "grow-0") return "flex-grow: 0;";
    
    // shrink
    if (core == "shrink") return "flex-shrink: 1;";
    if (core == "shrink-0") return "flex-shrink: 0;";
    
    // align-items
    if (core == "items-start") return "align-items: flex-start;";
    if (core == "items-end") return "align-items: flex-end;";
    if (core == "items-center") return "align-items: center;";
    if (core == "items-baseline") return "align-items: baseline;";
    if (core == "items-stretch") return "align-items: stretch;";
    
    // justify-content
    if (core == "justify-start") return "justify-content: flex-start;";
    if (core == "justify-end") return "justify-content: flex-end;";
    if (core == "justify-center") return "justify-content: center;";
    if (core == "justify-between") return "justify-content: space-between;";
    if (core == "justify-around") return "justify-content: space-around;";
    if (core == "justify-evenly") return "justify-content: space-evenly;";
    
    // gap (already handled in spacing, but adding gap-x and gap-y)
    final gapX = RegExp(r'^gap-x-(\d+)$').firstMatch(core);
    if (gapX != null) {
      final val = kSpacingScale[int.parse(gapX.group(1)!)];
      if (val != null) return "column-gap: $val;";
    }
    
    final gapY = RegExp(r'^gap-y-(\d+)$').firstMatch(core);
    if (gapY != null) {
      final val = kSpacingScale[int.parse(gapY.group(1)!)];
      if (val != null) return "row-gap: $val;";
    }

    //
    // ---------------------------------------------------------------
    // GRID
    // ---------------------------------------------------------------
    // grid-cols
    final gridCols = RegExp(r'^grid-cols-(\d+)$').firstMatch(core);
    if (gridCols != null) {
      return "grid-template-columns: repeat(${gridCols.group(1)}, minmax(0,1fr));";
    }
    if (core == "grid-cols-none") return "grid-template-columns: none;";
    
    // grid-rows
    final gridRows = RegExp(r'^grid-rows-(\d+)$').firstMatch(core);
    if (gridRows != null) {
      return "grid-template-rows: repeat(${gridRows.group(1)}, minmax(0,1fr));";
    }
    if (core == "grid-rows-none") return "grid-template-rows: none;";
    
    // col-span
    final colSpan = RegExp(r'^col-span-(\d+)$').firstMatch(core);
    if (colSpan != null) {
      return "grid-column: span ${colSpan.group(1)} / span ${colSpan.group(1)};";
    }
    if (core == "col-span-full") return "grid-column: 1 / -1;";
    if (core == "col-auto") return "grid-column: auto;";
    
    // row-span
    final rowSpan = RegExp(r'^row-span-(\d+)$').firstMatch(core);
    if (rowSpan != null) {
      return "grid-row: span ${rowSpan.group(1)} / span ${rowSpan.group(1)};";
    }
    if (core == "row-span-full") return "grid-row: 1 / -1;";
    if (core == "row-auto") return "grid-row: auto;";
    
    // grid-flow
    if (core == "grid-flow-row") return "grid-auto-flow: row;";
    if (core == "grid-flow-col") return "grid-auto-flow: column;";
    if (core == "grid-flow-dense") return "grid-auto-flow: dense;";
    if (core == "grid-flow-row-dense") return "grid-auto-flow: row dense;";
    if (core == "grid-flow-col-dense") return "grid-auto-flow: column dense;";

    //
    // ---------------------------------------------------------------
    // POSITION / Z-INDEX
    // ---------------------------------------------------------------
    if (core == "relative") return "position: relative;";
    if (core == "absolute") return "position: absolute;";
    if (core == "fixed") return "position: fixed;";

    final pos = RegExp(r'^(top|left|right|bottom)-(\d+)$').firstMatch(core);
    if (pos != null) {
      final side = pos.group(1)!;
      final val = int.parse(pos.group(2)!);
      return "$side: ${kSpacingScale[val]};";
    }

    // z-index
    if (core == "z-auto") return "z-index: auto;";
    if (core == "z-0") return "z-index: 0;";
    if (core == "z-10") return "z-index: 10;";
    if (core == "z-20") return "z-index: 20;";
    if (core == "z-30") return "z-index: 30;";
    if (core == "z-40") return "z-index: 40;";
    if (core == "z-50") return "z-index: 50;";
    
    final zIndex = RegExp(r'^z-(\d+)$').firstMatch(core);
    if (zIndex != null) return "z-index: ${zIndex.group(1)};";

    //
    // ---------------------------------------------------------------
    // SPACING (p-4, mx-10, gap-8)
    // ---------------------------------------------------------------
    final spacing = RegExp(
            r'^(p|pt|pr|pb|pl|px|py|m|mt|mr|mb|ml|mx|my|gap)-(\d+)$')
        .firstMatch(core);
    if (spacing != null) {
      return _spacingProperty(spacing.group(1)!, spacing.group(2)!);
    }

    //
    // ---------------------------------------------------------------
    // ARBITRARY COLOURS → bg-[rgb(...)]
    // ---------------------------------------------------------------
    final arbitrary = RegExp(
            r'^(bg|text|border|shadow|ring|outline|fill|stroke|placeholder|caret|accent|decoration)-\[(.+)\]$')
        .firstMatch(core);
    if (arbitrary != null) {
      final type = arbitrary.group(1)!;
      final value = arbitrary.group(2)!;
      return "${_colorProperty(type)}: $value;";
    }

    //
    // ---------------------------------------------------------------
    // NAMED COLOURS (text-white, bg-black, placeholder-white, etc.)
    // ***** MUST COME BEFORE TAILWIND PALETTE *****
    // ---------------------------------------------------------------
    final named = RegExp(r'^(bg|text|border|shadow|ring|outline|fill|stroke|placeholder|caret|accent|decoration)-([a-z]+)$')
        .firstMatch(core);
    if (named != null) {
      final type = named.group(1)!;
      final name = named.group(2)!;

      if (kNamedColors.containsKey(name)) {
        return "${_colorProperty(type)}: ${kNamedColors[name]};";
      }
    }

    //
    // ---------------------------------------------------------------
    // TAILWIND PALETTE (bg-red-500, text-blue-300, placeholder-red-500, etc.)
    // ---------------------------------------------------------------
    final tw = RegExp(r'^(bg|text|border|shadow|ring|outline|fill|stroke|placeholder|caret|accent|decoration)-([a-z]+-\d{2,3})$')
        .firstMatch(core);
    if (tw != null) {
      final type = tw.group(1)!;
      final colorName = tw.group(2)!;
      final hex = kTailwindColors[colorName];
      if (hex != null) {
        return "${_colorProperty(type)}: $hex;";
      }
    }

    //
    // ---------------------------------------------------------------
    // HEX COLOURS → bg-#ff00aa
    // ---------------------------------------------------------------
    final hex = RegExp(
            r'^(bg|text|border|shadow|ring|outline|fill|stroke|placeholder|caret|accent|decoration)-(#[a-fA-F0-9]{3,6})$')
        .firstMatch(core);
    if (hex != null) {
      return "${_colorProperty(hex.group(1)!)}: ${hex.group(2)!};";
    }

    //
    // ---------------------------------------------------------------
    // TEXT SIZE → text-xs, text-sm, text-base, text-lg, text-32, etc.
    // ---------------------------------------------------------------
    // Named sizes (Tailwind standard)
    if (core == "text-xs") return "font-size: 0.75rem; line-height: 1rem;";
    if (core == "text-sm") return "font-size: 0.875rem; line-height: 1.25rem;";
    if (core == "text-base") return "font-size: 1rem; line-height: 1.5rem;";
    if (core == "text-lg") return "font-size: 1.125rem; line-height: 1.75rem;";
    if (core == "text-xl") return "font-size: 1.25rem; line-height: 1.75rem;";
    if (core == "text-2xl") return "font-size: 1.5rem; line-height: 2rem;";
    if (core == "text-3xl") return "font-size: 1.875rem; line-height: 2.25rem;";
    if (core == "text-4xl") return "font-size: 2.25rem; line-height: 2.5rem;";
    if (core == "text-5xl") return "font-size: 3rem; line-height: 1;";
    if (core == "text-6xl") return "font-size: 3.75rem; line-height: 1;";
    if (core == "text-7xl") return "font-size: 4.5rem; line-height: 1;";
    if (core == "text-8xl") return "font-size: 6rem; line-height: 1;";
    if (core == "text-9xl") return "font-size: 8rem; line-height: 1;";
    
    // Arbitrary pixel sizes (text-32, etc.)
    final textSize = RegExp(r'^text-(\d+)$').firstMatch(core);
    if (textSize != null && core != "text-xs" && core != "text-sm" && core != "text-base" && core != "text-lg" && core != "text-xl" && !core.startsWith("text-2xl") && !core.startsWith("text-3xl") && !core.startsWith("text-4xl") && !core.startsWith("text-5xl") && !core.startsWith("text-6xl") && !core.startsWith("text-7xl") && !core.startsWith("text-8xl") && !core.startsWith("text-9xl")) {
      return "font-size: ${textSize.group(1)}px;";
    }

    //
    // ---------------------------------------------------------------
    // FONT WEIGHT → font-thin, font-light, font-normal, font-weight-300, etc.
    // ---------------------------------------------------------------
    // Named weights
    if (core == "font-thin") return "font-weight: 100;";
    if (core == "font-extralight") return "font-weight: 200;";
    if (core == "font-light") return "font-weight: 300;";
    if (core == "font-normal") return "font-weight: 400;";
    if (core == "font-medium") return "font-weight: 500;";
    if (core == "font-semibold") return "font-weight: 600;";
    if (core == "font-bold") return "font-weight: 700;";
    if (core == "font-extrabold") return "font-weight: 800;";
    if (core == "font-black") return "font-weight: 900;";
    
    // Arbitrary numeric weights
    final fw = RegExp(r'^font-weight-(\d+)$').firstMatch(core);
    if (fw != null) return "font-weight: ${fw.group(1)};";
    
    // font-style
    if (core == "italic") return "font-style: italic;";
    if (core == "not-italic") return "font-style: normal;";
    
    // font-family
    if (core == "font-sans") return "font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, \"Noto Sans\", sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\";";
    if (core == "font-serif") return "font-family: ui-serif, Georgia, Cambria, \"Times New Roman\", Times, serif;";
    if (core == "font-mono") return "font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, \"Liberation Mono\", \"Courier New\", monospace;";
    
    // Kothari UI default fonts (with system fallbacks for speed)
    // font-kothari: Lato for UI/body text
    if (core == "font-kothari") return "font-family: \"Lato\", \"Source Sans 3\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif;";
    
    // font-kothari-mono: JetBrains Mono for code
    if (core == "font-kothari-mono") return "font-family: \"JetBrains Mono\", \"Fira Code\", \"SF Mono\", Monaco, \"Cascadia Code\", \"Roboto Mono\", Consolas, \"Courier New\", monospace;";

    //
    // ---------------------------------------------------------------
    // WIDTH → w-auto, w-full, w-screen, w-{n}, w-1/2, etc.
    // ---------------------------------------------------------------
    if (core == "w-auto") return "width: auto;";
    if (core == "w-full") return "width: 100%;";
    if (core == "w-screen") return "width: 100vw;";
    if (core == "w-min") return "width: min-content;";
    if (core == "w-max") return "width: max-content;";
    if (core == "w-fit") return "width: fit-content;";
    if (core == "w-0") return "width: 0px;";
    if (core == "w-px") return "width: 1px;";
    
    // w-{n} (spacing scale)
    final width = RegExp(r'^w-(\d+)$').firstMatch(core);
    if (width != null && core != "w-0" && core != "w-auto" && core != "w-full" && core != "w-screen" && core != "w-min" && core != "w-max" && core != "w-fit" && core != "w-px") {
      final val = kSpacingScale[int.parse(width.group(1)!)];
      if (val != null) return "width: $val;";
      // If not in spacing scale, use pixels
      return "width: ${width.group(1)}px;";
    }
    
    // w-{n}/{n} (fractions)
    final frac = RegExp(r'^w-(\d+)\/(\d+)$').firstMatch(core);
    if (frac != null) {
      final num a = int.parse(frac.group(1)!);
      final num b = int.parse(frac.group(2)!);
      return "width: ${(a / b) * 100}%;";
    }

    //
    // ---------------------------------------------------------------
    // HEIGHT → h-auto, h-full, h-screen, h-{n}, etc.
    // ---------------------------------------------------------------
    if (core == "h-auto") return "height: auto;";
    if (core == "h-full") return "height: 100%;";
    if (core == "h-screen") return "height: 100vh;";
    if (core == "h-min") return "height: min-content;";
    if (core == "h-max") return "height: max-content;";
    if (core == "h-fit") return "height: fit-content;";
    if (core == "h-0") return "height: 0px;";
    if (core == "h-px") return "height: 1px;";
    
    // h-{n} (spacing scale)
    final height = RegExp(r'^h-(\d+)$').firstMatch(core);
    if (height != null && core != "h-0" && core != "h-auto" && core != "h-full" && core != "h-screen" && core != "h-min" && core != "h-max" && core != "h-fit" && core != "h-px") {
      final val = kSpacingScale[int.parse(height.group(1)!)];
      if (val != null) return "height: $val;";
      // If not in spacing scale, use pixels
      return "height: ${height.group(1)}px;";
    }
    
    // h-{n}/{n} (fractions)
    final hFrac = RegExp(r'^h-(\d+)\/(\d+)$').firstMatch(core);
    if (hFrac != null) {
      final num a = int.parse(hFrac.group(1)!);
      final num b = int.parse(hFrac.group(2)!);
      return "height: ${(a / b) * 100}%;";
    }

    //
    // ---------------------------------------------------------------
    // MIN WIDTH → min-w-0, min-w-full, min-w-min, etc.
    // ---------------------------------------------------------------
    if (core == "min-w-0") return "min-width: 0px;";
    if (core == "min-w-full") return "min-width: 100%;";
    if (core == "min-w-min") return "min-width: min-content;";
    if (core == "min-w-max") return "min-width: max-content;";
    if (core == "min-w-fit") return "min-width: fit-content;";
    
    final minW = RegExp(r'^min-w-(\d+)$').firstMatch(core);
    if (minW != null && core != "min-w-0") {
      final val = kSpacingScale[int.parse(minW.group(1)!)];
      if (val != null) return "min-width: $val;";
      return "min-width: ${minW.group(1)}px;";
    }

    //
    // ---------------------------------------------------------------
    // MIN HEIGHT → min-h-0, min-h-full, min-h-screen, etc.
    // ---------------------------------------------------------------
    if (core == "min-h-0") return "min-height: 0px;";
    if (core == "min-h-full") return "min-height: 100%;";
    if (core == "min-h-screen") return "min-height: 100vh;";
    if (core == "min-h-min") return "min-height: min-content;";
    if (core == "min-h-max") return "min-height: max-content;";
    if (core == "min-h-fit") return "min-height: fit-content;";
    
    final minH = RegExp(r'^min-h-(\d+)$').firstMatch(core);
    if (minH != null && core != "min-h-0") {
      final val = kSpacingScale[int.parse(minH.group(1)!)];
      if (val != null) return "min-height: $val;";
      return "min-height: ${minH.group(1)}px;";
    }

    //
    // ---------------------------------------------------------------
    // MAX WIDTH → max-w-none, max-w-xs, max-w-sm, max-w-full, etc.
    // ---------------------------------------------------------------
    if (core == "max-w-0") return "max-width: 0rem;";
    if (core == "max-w-none") return "max-width: none;";
    if (core == "max-w-xs") return "max-width: 20rem;";
    if (core == "max-w-sm") return "max-width: 24rem;";
    if (core == "max-w-md") return "max-width: 28rem;";
    if (core == "max-w-lg") return "max-width: 32rem;";
    if (core == "max-w-xl") return "max-width: 36rem;";
    if (core == "max-w-2xl") return "max-width: 42rem;";
    if (core == "max-w-3xl") return "max-width: 48rem;";
    if (core == "max-w-4xl") return "max-width: 56rem;";
    if (core == "max-w-5xl") return "max-width: 64rem;";
    if (core == "max-w-6xl") return "max-width: 72rem;";
    if (core == "max-w-7xl") return "max-width: 80rem;";
    if (core == "max-w-full") return "max-width: 100%;";
    if (core == "max-w-min") return "max-width: min-content;";
    if (core == "max-w-max") return "max-width: max-content;";
    if (core == "max-w-fit") return "max-width: fit-content;";
    if (core == "max-w-prose") return "max-width: 65ch;";
    if (core == "max-w-screen-sm") return "max-width: 640px;";
    if (core == "max-w-screen-md") return "max-width: 768px;";
    if (core == "max-w-screen-lg") return "max-width: 1024px;";
    if (core == "max-w-screen-xl") return "max-width: 1280px;";
    if (core == "max-w-screen-2xl") return "max-width: 1536px;";
    
    final maxW = RegExp(r'^max-w-(\d+)$').firstMatch(core);
    if (maxW != null && core != "max-w-0") {
      final val = kSpacingScale[int.parse(maxW.group(1)!)];
      if (val != null) return "max-width: $val;";
      return "max-width: ${maxW.group(1)}px;";
    }

    //
    // ---------------------------------------------------------------
    // MAX HEIGHT → max-h-0, max-h-full, max-h-screen, etc.
    // ---------------------------------------------------------------
    if (core == "max-h-0") return "max-height: 0rem;";
    if (core == "max-h-full") return "max-height: 100%;";
    if (core == "max-h-screen") return "max-height: 100vh;";
    if (core == "max-h-min") return "max-height: min-content;";
    if (core == "max-h-max") return "max-height: max-content;";
    if (core == "max-h-fit") return "max-height: fit-content;";
    
    final maxH = RegExp(r'^max-h-(\d+)$').firstMatch(core);
    if (maxH != null && core != "max-h-0") {
      final val = kSpacingScale[int.parse(maxH.group(1)!)];
      if (val != null) return "max-height: $val;";
      return "max-height: ${maxH.group(1)}px;";
    }

    //
    // ---------------------------------------------------------------
    // ROUNDED → rounded-10, rounded-t-10, rounded-tl-10, etc.
    // ---------------------------------------------------------------
    // rounded-none
    if (core == "rounded-none") return "border-radius: 0px;";
    
    // rounded-sm, rounded, rounded-md, rounded-lg, rounded-xl, rounded-2xl, rounded-3xl, rounded-full
    if (core == "rounded-sm") return "border-radius: 0.125rem;";
    if (core == "rounded") return "border-radius: 0.25rem;";
    if (core == "rounded-md") return "border-radius: 0.375rem;";
    if (core == "rounded-lg") return "border-radius: 0.5rem;";
    if (core == "rounded-xl") return "border-radius: 0.75rem;";
    if (core == "rounded-2xl") return "border-radius: 1rem;";
    if (core == "rounded-3xl") return "border-radius: 1.5rem;";
    if (core == "rounded-full") return "border-radius: 9999px;";
    
    // rounded-{n} (arbitrary pixel values)
    final rounded = RegExp(r'^rounded-(\d+)$').firstMatch(core);
    if (rounded != null) return "border-radius: ${rounded.group(1)}px;";
    
    // rounded-t-{n}, rounded-r-{n}, rounded-b-{n}, rounded-l-{n}
    final roundedSide = RegExp(r'^rounded-(t|r|b|l)-(\d+)$').firstMatch(core);
    if (roundedSide != null) {
      final side = roundedSide.group(1)!;
      final val = roundedSide.group(2)!;
      switch (side) {
        case 't':
          return "border-top-left-radius: ${val}px; border-top-right-radius: ${val}px;";
        case 'r':
          return "border-top-right-radius: ${val}px; border-bottom-right-radius: ${val}px;";
        case 'b':
          return "border-bottom-right-radius: ${val}px; border-bottom-left-radius: ${val}px;";
        case 'l':
          return "border-top-left-radius: ${val}px; border-bottom-left-radius: ${val}px;";
      }
    }
    
    // rounded-tl-{n}, rounded-tr-{n}, rounded-br-{n}, rounded-bl-{n}
    final roundedCorner = RegExp(r'^rounded-(tl|tr|br|bl)-(\d+)$').firstMatch(core);
    if (roundedCorner != null) {
      final corner = roundedCorner.group(1)!;
      final val = roundedCorner.group(2)!;
      switch (corner) {
        case 'tl':
          return "border-top-left-radius: ${val}px;";
        case 'tr':
          return "border-top-right-radius: ${val}px;";
        case 'br':
          return "border-bottom-right-radius: ${val}px;";
        case 'bl':
          return "border-bottom-left-radius: ${val}px;";
      }
    }
    
    // rounded-t, rounded-r, rounded-b, rounded-l (using default 0.25rem)
    if (core == "rounded-t") return "border-top-left-radius: 0.25rem; border-top-right-radius: 0.25rem;";
    if (core == "rounded-r") return "border-top-right-radius: 0.25rem; border-bottom-right-radius: 0.25rem;";
    if (core == "rounded-b") return "border-bottom-right-radius: 0.25rem; border-bottom-left-radius: 0.25rem;";
    if (core == "rounded-l") return "border-top-left-radius: 0.25rem; border-bottom-left-radius: 0.25rem;";
    
    // rounded-tl, rounded-tr, rounded-br, rounded-bl (using default 0.25rem)
    if (core == "rounded-tl") return "border-top-left-radius: 0.25rem;";
    if (core == "rounded-tr") return "border-top-right-radius: 0.25rem;";
    if (core == "rounded-br") return "border-bottom-right-radius: 0.25rem;";
    if (core == "rounded-bl") return "border-bottom-left-radius: 0.25rem;";

    //
    // ---------------------------------------------------------------
    // BORDER WIDTH → border-0, border, border-2, border-t, border-x, etc.
    // ---------------------------------------------------------------
    if (core == "border-0") return "border-width: 0px;";
    if (core == "border") return "border-width: 1px;";
    if (core == "border-2") return "border-width: 2px;";
    if (core == "border-4") return "border-width: 4px;";
    if (core == "border-8") return "border-width: 8px;";
    
    // border-t, border-r, border-b, border-l (1px)
    if (core == "border-t") return "border-top-width: 1px;";
    if (core == "border-r") return "border-right-width: 1px;";
    if (core == "border-b") return "border-bottom-width: 1px;";
    if (core == "border-l") return "border-left-width: 1px;";
    
    // border-x, border-y (1px)
    if (core == "border-x") return "border-left-width: 1px; border-right-width: 1px;";
    if (core == "border-y") return "border-top-width: 1px; border-bottom-width: 1px;";
    
    // border-t-{n}, border-r-{n}, border-b-{n}, border-l-{n}
    final borderSideWidth = RegExp(r'^border-(t|r|b|l)-(\d+)$').firstMatch(core);
    if (borderSideWidth != null) {
      final side = borderSideWidth.group(1)!;
      final val = borderSideWidth.group(2)!;
      switch (side) {
        case 't':
          return "border-top-width: ${val}px;";
        case 'r':
          return "border-right-width: ${val}px;";
        case 'b':
          return "border-bottom-width: ${val}px;";
        case 'l':
          return "border-left-width: ${val}px;";
      }
    }
    
    // border-x-{n}, border-y-{n}
    final borderAxisWidth = RegExp(r'^border-(x|y)-(\d+)$').firstMatch(core);
    if (borderAxisWidth != null) {
      final axis = borderAxisWidth.group(1)!;
      final val = borderAxisWidth.group(2)!;
      if (axis == 'x') {
        return "border-left-width: ${val}px; border-right-width: ${val}px;";
      } else {
        return "border-top-width: ${val}px; border-bottom-width: ${val}px;";
      }
    }
    
    // border-{n} (arbitrary width)
    final borderWidth = RegExp(r'^border-(\d+)$').firstMatch(core);
    if (borderWidth != null && core != "border-0" && core != "border-2" && core != "border-4" && core != "border-8") {
      return "border-width: ${borderWidth.group(1)}px;";
    }

    //
    // ---------------------------------------------------------------
    // BORDER STYLE → border-solid, border-dashed, border-dotted, etc.
    // ---------------------------------------------------------------
    if (core == "border-solid") return "border-style: solid;";
    if (core == "border-dashed") return "border-style: dashed;";
    if (core == "border-dotted") return "border-style: dotted;";
    if (core == "border-double") return "border-style: double;";
    if (core == "border-none") return "border-style: none;";

    //
    // ---------------------------------------------------------------
    // ASPECT RATIO → aspect-auto, aspect-square, aspect-video, aspect-{n}/{n}
    // ---------------------------------------------------------------
    if (core == "aspect-auto") return "aspect-ratio: auto;";
    if (core == "aspect-square") return "aspect-ratio: 1 / 1;";
    if (core == "aspect-video") return "aspect-ratio: 16 / 9;";
    
    // aspect-{n}/{n} (arbitrary aspect ratios)
    final aspectRatio = RegExp(r'^aspect-(\d+)\/(\d+)$').firstMatch(core);
    if (aspectRatio != null) {
      return "aspect-ratio: ${aspectRatio.group(1)} / ${aspectRatio.group(2)};";
    }

    //
    // ---------------------------------------------------------------
    // OBJECT FIT → object-contain, object-cover, object-fill, etc.
    // ---------------------------------------------------------------
    if (core == "object-contain") return "object-fit: contain;";
    if (core == "object-cover") return "object-fit: cover;";
    if (core == "object-fill") return "object-fit: fill;";
    if (core == "object-none") return "object-fit: none;";
    if (core == "object-scale-down") return "object-fit: scale-down;";

    //
    // ---------------------------------------------------------------
    // OBJECT POSITION → object-bottom, object-center, object-left, etc.
    // ---------------------------------------------------------------
    if (core == "object-bottom") return "object-position: bottom;";
    if (core == "object-center") return "object-position: center;";
    if (core == "object-left") return "object-position: left;";
    if (core == "object-left-bottom") return "object-position: left bottom;";
    if (core == "object-left-top") return "object-position: left top;";
    if (core == "object-right") return "object-position: right;";
    if (core == "object-right-bottom") return "object-position: right bottom;";
    if (core == "object-right-top") return "object-position: right top;";
    if (core == "object-top") return "object-position: top;";

    //
    // ---------------------------------------------------------------
    // OVERFLOW → overflow-auto, overflow-hidden, overflow-x-hidden, etc.
    // ---------------------------------------------------------------
    if (core == "overflow-auto") return "overflow: auto;";
    if (core == "overflow-hidden") return "overflow: hidden;";
    if (core == "overflow-clip") return "overflow: clip;";
    if (core == "overflow-visible") return "overflow: visible;";
    if (core == "overflow-scroll") return "overflow: scroll;";
    
    // overflow-x variants
    if (core == "overflow-x-auto") return "overflow-x: auto;";
    if (core == "overflow-x-hidden") return "overflow-x: hidden;";
    if (core == "overflow-x-clip") return "overflow-x: clip;";
    if (core == "overflow-x-visible") return "overflow-x: visible;";
    if (core == "overflow-x-scroll") return "overflow-x: scroll;";
    
    // overflow-y variants
    if (core == "overflow-y-auto") return "overflow-y: auto;";
    if (core == "overflow-y-hidden") return "overflow-y: hidden;";
    if (core == "overflow-y-clip") return "overflow-y: clip;";
    if (core == "overflow-y-visible") return "overflow-y: visible;";
    if (core == "overflow-y-scroll") return "overflow-y: scroll;";

    //
    // ---------------------------------------------------------------
    // OPACITY → opacity-0, opacity-50, opacity-100, etc.
    // ---------------------------------------------------------------
    if (core == "opacity-0") return "opacity: 0;";
    if (core == "opacity-5") return "opacity: 0.05;";
    if (core == "opacity-10") return "opacity: 0.1;";
    if (core == "opacity-20") return "opacity: 0.2;";
    if (core == "opacity-25") return "opacity: 0.25;";
    if (core == "opacity-30") return "opacity: 0.3;";
    if (core == "opacity-40") return "opacity: 0.4;";
    if (core == "opacity-50") return "opacity: 0.5;";
    if (core == "opacity-60") return "opacity: 0.6;";
    if (core == "opacity-70") return "opacity: 0.7;";
    if (core == "opacity-75") return "opacity: 0.75;";
    if (core == "opacity-80") return "opacity: 0.8;";
    if (core == "opacity-90") return "opacity: 0.9;";
    if (core == "opacity-95") return "opacity: 0.95;";
    if (core == "opacity-100") return "opacity: 1;";
    
    // opacity-{n} (arbitrary values 0-100)
    final opacity = RegExp(r'^opacity-(\d+)$').firstMatch(core);
    if (opacity != null) {
      final val = int.parse(opacity.group(1)!);
      if (val >= 0 && val <= 100) {
        return "opacity: ${val / 100};";
      }
    }

    //
    // ---------------------------------------------------------------
    // BOX SHADOW → shadow-sm, shadow, shadow-md, shadow-lg, etc.
    // ---------------------------------------------------------------
    if (core == "shadow-sm") return "box-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.05);";
    if (core == "shadow") return "box-shadow: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);";
    if (core == "shadow-md") return "box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);";
    if (core == "shadow-lg") return "box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);";
    if (core == "shadow-xl") return "box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);";
    if (core == "shadow-2xl") return "box-shadow: 0 25px 50px -12px rgb(0 0 0 / 0.25);";
    if (core == "shadow-inner") return "box-shadow: inset 0 2px 4px 0 rgb(0 0 0 / 0.05);";
    if (core == "shadow-none") return "box-shadow: none;";
    
    // shadow-{arbitrary}
    final shadowArbitrary = RegExp(r'^shadow-\[(.+)\]$').firstMatch(core);
    if (shadowArbitrary != null) {
      return "box-shadow: ${shadowArbitrary.group(1)};";
    }

    //
    // ---------------------------------------------------------------
    // FILTERS → blur-sm, blur, brightness-50, contrast-100, etc.
    // ---------------------------------------------------------------
    // filter and filter-none
    if (core == "filter") return "filter: var(--tw-blur) var(--tw-brightness) var(--tw-contrast) var(--tw-grayscale) var(--tw-hue-rotate) var(--tw-invert) var(--tw-saturate) var(--tw-sepia) var(--tw-drop-shadow);";
    if (core == "filter-none") return "filter: none;";
    
    // blur
    if (core == "blur-none") return "filter: blur(0);";
    if (core == "blur-sm") return "filter: blur(4px);";
    if (core == "blur") return "filter: blur(8px);";
    if (core == "blur-md") return "filter: blur(12px);";
    if (core == "blur-lg") return "filter: blur(16px);";
    if (core == "blur-xl") return "filter: blur(24px);";
    if (core == "blur-2xl") return "filter: blur(40px);";
    if (core == "blur-3xl") return "filter: blur(64px);";
    
    // blur-{n} (arbitrary)
    final blurArbitrary = RegExp(r'^blur-(\d+)$').firstMatch(core);
    if (blurArbitrary != null && core != "blur-none" && core != "blur-sm" && core != "blur-md" && core != "blur-lg" && core != "blur-xl" && core != "blur-2xl" && core != "blur-3xl") {
      return "filter: blur(${blurArbitrary.group(1)}px);";
    }
    
    // brightness
    if (core == "brightness-0") return "filter: brightness(0);";
    if (core == "brightness-50") return "filter: brightness(.5);";
    if (core == "brightness-75") return "filter: brightness(.75);";
    if (core == "brightness-90") return "filter: brightness(.9);";
    if (core == "brightness-95") return "filter: brightness(.95);";
    if (core == "brightness-100") return "filter: brightness(1);";
    if (core == "brightness-105") return "filter: brightness(1.05);";
    if (core == "brightness-110") return "filter: brightness(1.1);";
    if (core == "brightness-125") return "filter: brightness(1.25);";
    if (core == "brightness-150") return "filter: brightness(1.5);";
    if (core == "brightness-200") return "filter: brightness(2);";
    
    // contrast
    if (core == "contrast-0") return "filter: contrast(0);";
    if (core == "contrast-50") return "filter: contrast(.5);";
    if (core == "contrast-75") return "filter: contrast(.75);";
    if (core == "contrast-100") return "filter: contrast(1);";
    if (core == "contrast-125") return "filter: contrast(1.25);";
    if (core == "contrast-150") return "filter: contrast(1.5);";
    if (core == "contrast-200") return "filter: contrast(2);";
    
    // grayscale
    if (core == "grayscale") return "filter: grayscale(1);";
    if (core == "grayscale-0") return "filter: grayscale(0);";
    
    // hue-rotate
    if (core == "hue-rotate-0") return "filter: hue-rotate(0deg);";
    if (core == "hue-rotate-15") return "filter: hue-rotate(15deg);";
    if (core == "hue-rotate-30") return "filter: hue-rotate(30deg);";
    if (core == "hue-rotate-60") return "filter: hue-rotate(60deg);";
    if (core == "hue-rotate-90") return "filter: hue-rotate(90deg);";
    if (core == "hue-rotate-180") return "filter: hue-rotate(180deg);";
    
    // invert
    if (core == "invert") return "filter: invert(1);";
    if (core == "invert-0") return "filter: invert(0);";
    
    // saturate
    if (core == "saturate-0") return "filter: saturate(0);";
    if (core == "saturate-50") return "filter: saturate(.5);";
    if (core == "saturate-100") return "filter: saturate(1);";
    if (core == "saturate-150") return "filter: saturate(1.5);";
    if (core == "saturate-200") return "filter: saturate(2);";
    
    // sepia
    if (core == "sepia") return "filter: sepia(1);";
    if (core == "sepia-0") return "filter: sepia(0);";
    
    // drop-shadow
    if (core == "drop-shadow-sm") return "filter: drop-shadow(0 1px 1px rgb(0 0 0 / 0.05));";
    if (core == "drop-shadow") return "filter: drop-shadow(0 1px 2px rgb(0 0 0 / 0.1)) drop-shadow(0 1px 1px rgb(0 0 0 / 0.06));";
    if (core == "drop-shadow-md") return "filter: drop-shadow(0 4px 3px rgb(0 0 0 / 0.07)) drop-shadow(0 2px 2px rgb(0 0 0 / 0.06));";
    if (core == "drop-shadow-lg") return "filter: drop-shadow(0 10px 8px rgb(0 0 0 / 0.04)) drop-shadow(0 4px 3px rgb(0 0 0 / 0.1));";
    if (core == "drop-shadow-xl") return "filter: drop-shadow(0 20px 13px rgb(0 0 0 / 0.03)) drop-shadow(0 8px 5px rgb(0 0 0 / 0.08));";
    if (core == "drop-shadow-2xl") return "filter: drop-shadow(0 25px 25px rgb(0 0 0 / 0.15));";
    if (core == "drop-shadow-none") return "filter: drop-shadow(0 0 #0000);";

    //
    // ---------------------------------------------------------------
    // BACKDROP FILTERS → backdrop-blur-sm, backdrop-blur, etc.
    // ---------------------------------------------------------------
    if (core == "backdrop-filter") return "backdrop-filter: var(--tw-backdrop-blur) var(--tw-backdrop-brightness) var(--tw-backdrop-contrast) var(--tw-backdrop-grayscale) var(--tw-backdrop-hue-rotate) var(--tw-backdrop-invert) var(--tw-backdrop-opacity) var(--tw-backdrop-saturate) var(--tw-backdrop-sepia);";
    if (core == "backdrop-filter-none") return "backdrop-filter: none;";
    
    // backdrop-blur
    if (core == "backdrop-blur-none") return "backdrop-filter: blur(0);";
    if (core == "backdrop-blur-sm") return "backdrop-filter: blur(4px);";
    if (core == "backdrop-blur") return "backdrop-filter: blur(8px);";
    if (core == "backdrop-blur-md") return "backdrop-filter: blur(12px);";
    if (core == "backdrop-blur-lg") return "backdrop-filter: blur(16px);";
    if (core == "backdrop-blur-xl") return "backdrop-filter: blur(24px);";
    if (core == "backdrop-blur-2xl") return "backdrop-filter: blur(40px);";
    if (core == "backdrop-blur-3xl") return "backdrop-filter: blur(64px);";
    
    // backdrop-brightness
    if (core == "backdrop-brightness-0") return "backdrop-filter: brightness(0);";
    if (core == "backdrop-brightness-50") return "backdrop-filter: brightness(.5);";
    if (core == "backdrop-brightness-75") return "backdrop-filter: brightness(.75);";
    if (core == "backdrop-brightness-90") return "backdrop-filter: brightness(.9);";
    if (core == "backdrop-brightness-95") return "backdrop-filter: brightness(.95);";
    if (core == "backdrop-brightness-100") return "backdrop-filter: brightness(1);";
    if (core == "backdrop-brightness-105") return "backdrop-filter: brightness(1.05);";
    if (core == "backdrop-brightness-110") return "backdrop-filter: brightness(1.1);";
    if (core == "backdrop-brightness-125") return "backdrop-filter: brightness(1.25);";
    if (core == "backdrop-brightness-150") return "backdrop-filter: brightness(1.5);";
    if (core == "backdrop-brightness-200") return "backdrop-filter: brightness(2);";
    
    // backdrop-contrast
    if (core == "backdrop-contrast-0") return "backdrop-filter: contrast(0);";
    if (core == "backdrop-contrast-50") return "backdrop-filter: contrast(.5);";
    if (core == "backdrop-contrast-75") return "backdrop-filter: contrast(.75);";
    if (core == "backdrop-contrast-100") return "backdrop-filter: contrast(1);";
    if (core == "backdrop-contrast-125") return "backdrop-filter: contrast(1.25);";
    if (core == "backdrop-contrast-150") return "backdrop-filter: contrast(1.5);";
    if (core == "backdrop-contrast-200") return "backdrop-filter: contrast(2);";
    
    // backdrop-grayscale
    if (core == "backdrop-grayscale") return "backdrop-filter: grayscale(1);";
    if (core == "backdrop-grayscale-0") return "backdrop-filter: grayscale(0);";
    
    // backdrop-hue-rotate
    if (core == "backdrop-hue-rotate-0") return "backdrop-filter: hue-rotate(0deg);";
    if (core == "backdrop-hue-rotate-15") return "backdrop-filter: hue-rotate(15deg);";
    if (core == "backdrop-hue-rotate-30") return "backdrop-filter: hue-rotate(30deg);";
    if (core == "backdrop-hue-rotate-60") return "backdrop-filter: hue-rotate(60deg);";
    if (core == "backdrop-hue-rotate-90") return "backdrop-filter: hue-rotate(90deg);";
    if (core == "backdrop-hue-rotate-180") return "backdrop-filter: hue-rotate(180deg);";
    
    // backdrop-invert
    if (core == "backdrop-invert") return "backdrop-filter: invert(1);";
    if (core == "backdrop-invert-0") return "backdrop-filter: invert(0);";
    
    // backdrop-opacity
    if (core == "backdrop-opacity-0") return "backdrop-filter: opacity(0);";
    if (core == "backdrop-opacity-5") return "backdrop-filter: opacity(0.05);";
    if (core == "backdrop-opacity-10") return "backdrop-filter: opacity(0.1);";
    if (core == "backdrop-opacity-20") return "backdrop-filter: opacity(0.2);";
    if (core == "backdrop-opacity-25") return "backdrop-filter: opacity(0.25);";
    if (core == "backdrop-opacity-30") return "backdrop-filter: opacity(0.3);";
    if (core == "backdrop-opacity-40") return "backdrop-filter: opacity(0.4);";
    if (core == "backdrop-opacity-50") return "backdrop-filter: opacity(0.5);";
    if (core == "backdrop-opacity-60") return "backdrop-filter: opacity(0.6);";
    if (core == "backdrop-opacity-70") return "backdrop-filter: opacity(0.7);";
    if (core == "backdrop-opacity-75") return "backdrop-filter: opacity(0.75);";
    if (core == "backdrop-opacity-80") return "backdrop-filter: opacity(0.8);";
    if (core == "backdrop-opacity-90") return "backdrop-filter: opacity(0.9);";
    if (core == "backdrop-opacity-95") return "backdrop-filter: opacity(0.95);";
    if (core == "backdrop-opacity-100") return "backdrop-filter: opacity(1);";
    
    // backdrop-saturate
    if (core == "backdrop-saturate-0") return "backdrop-filter: saturate(0);";
    if (core == "backdrop-saturate-50") return "backdrop-filter: saturate(.5);";
    if (core == "backdrop-saturate-100") return "backdrop-filter: saturate(1);";
    if (core == "backdrop-saturate-150") return "backdrop-filter: saturate(1.5);";
    if (core == "backdrop-saturate-200") return "backdrop-filter: saturate(2);";
    
    // backdrop-sepia
    if (core == "backdrop-sepia") return "backdrop-filter: sepia(1);";
    if (core == "backdrop-sepia-0") return "backdrop-filter: sepia(0);";

    //
    // ---------------------------------------------------------------
    // TYPOGRAPHY → line-height, letter-spacing
    // ---------------------------------------------------------------
    // line-height
    if (core == "leading-none") return "line-height: 1;";
    if (core == "leading-tight") return "line-height: 1.25;";
    if (core == "leading-snug") return "line-height: 1.375;";
    if (core == "leading-normal") return "line-height: 1.5;";
    if (core == "leading-relaxed") return "line-height: 1.625;";
    if (core == "leading-loose") return "line-height: 2;";
    
    // leading-{n} (arbitrary)
    final leading = RegExp(r'^leading-(\d+(?:\.\d+)?)$').firstMatch(core);
    if (leading != null && core != "leading-none" && core != "leading-tight" && core != "leading-snug" && core != "leading-normal" && core != "leading-relaxed" && core != "leading-loose") {
      return "line-height: ${leading.group(1)};";
    }
    
    // letter-spacing (tracking)
    if (core == "tracking-tighter") return "letter-spacing: -0.05em;";
    if (core == "tracking-tight") return "letter-spacing: -0.025em;";
    if (core == "tracking-normal") return "letter-spacing: 0em;";
    if (core == "tracking-wide") return "letter-spacing: 0.025em;";
    if (core == "tracking-wider") return "letter-spacing: 0.05em;";
    if (core == "tracking-widest") return "letter-spacing: 0.1em;";
    
    // tracking-{n} (arbitrary)
    final tracking = RegExp(r'^tracking-(\d+(?:\.\d+)?)$').firstMatch(core);
    if (tracking != null && core != "tracking-tighter" && core != "tracking-tight" && core != "tracking-normal" && core != "tracking-wide" && core != "tracking-wider" && core != "tracking-widest") {
      return "letter-spacing: ${tracking.group(1)}em;";
    }

    //
    // ---------------------------------------------------------------
    // TRANSITIONS → transition-none, transition-all, duration-300, etc.
    // ---------------------------------------------------------------
    if (core == "transition-none") return "transition-property: none;";
    if (core == "transition-all") return "transition-property: all; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms;";
    if (core == "transition") return "transition-property: color, background-color, border-color, text-decoration-color, fill, stroke, opacity, box-shadow, transform, filter, backdrop-filter; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms;";
    if (core == "transition-colors") return "transition-property: color, background-color, border-color, text-decoration-color, fill, stroke; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms;";
    if (core == "transition-opacity") return "transition-property: opacity; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms;";
    if (core == "transition-shadow") return "transition-property: box-shadow; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms;";
    if (core == "transition-transform") return "transition-property: transform; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms;";
    
    // duration
    if (core == "duration-75") return "transition-duration: 75ms;";
    if (core == "duration-100") return "transition-duration: 100ms;";
    if (core == "duration-150") return "transition-duration: 150ms;";
    if (core == "duration-200") return "transition-duration: 200ms;";
    if (core == "duration-300") return "transition-duration: 300ms;";
    if (core == "duration-500") return "transition-duration: 500ms;";
    if (core == "duration-700") return "transition-duration: 700ms;";
    if (core == "duration-1000") return "transition-duration: 1000ms;";
    
    // ease
    if (core == "ease-linear") return "transition-timing-function: linear;";
    if (core == "ease-in") return "transition-timing-function: cubic-bezier(0.4, 0, 1, 1);";
    if (core == "ease-out") return "transition-timing-function: cubic-bezier(0, 0, 0.2, 1);";
    if (core == "ease-in-out") return "transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);";
    
    // delay
    if (core == "delay-75") return "transition-delay: 75ms;";
    if (core == "delay-100") return "transition-delay: 100ms;";
    if (core == "delay-150") return "transition-delay: 150ms;";
    if (core == "delay-200") return "transition-delay: 200ms;";
    if (core == "delay-300") return "transition-delay: 300ms;";
    if (core == "delay-500") return "transition-delay: 500ms;";
    if (core == "delay-700") return "transition-delay: 700ms;";
    if (core == "delay-1000") return "transition-delay: 1000ms;";

    //
    // ---------------------------------------------------------------
    // TRANSFORMS → scale-50, rotate-45, translate-x-10, skew-x-12, etc.
    // ---------------------------------------------------------------
    // scale
    if (core == "scale-0") return "transform: scale(0);";
    if (core == "scale-50") return "transform: scale(.5);";
    if (core == "scale-75") return "transform: scale(.75);";
    if (core == "scale-90") return "transform: scale(.9);";
    if (core == "scale-95") return "transform: scale(.95);";
    if (core == "scale-100") return "transform: scale(1);";
    if (core == "scale-105") return "transform: scale(1.05);";
    if (core == "scale-110") return "transform: scale(1.1);";
    if (core == "scale-125") return "transform: scale(1.25);";
    if (core == "scale-150") return "transform: scale(1.5);";
    
    // scale-x, scale-y
    final scaleX = RegExp(r'^scale-x-(\d+(?:\.\d+)?)$').firstMatch(core);
    if (scaleX != null) {
      final val = double.parse(scaleX.group(1)!);
      return "transform: scaleX($val);";
    }
    
    final scaleY = RegExp(r'^scale-y-(\d+(?:\.\d+)?)$').firstMatch(core);
    if (scaleY != null) {
      final val = double.parse(scaleY.group(1)!);
      return "transform: scaleY($val);";
    }
    
    // rotate
    if (core == "rotate-0") return "transform: rotate(0deg);";
    if (core == "rotate-1") return "transform: rotate(1deg);";
    if (core == "rotate-2") return "transform: rotate(2deg);";
    if (core == "rotate-3") return "transform: rotate(3deg);";
    if (core == "rotate-6") return "transform: rotate(6deg);";
    if (core == "rotate-12") return "transform: rotate(12deg);";
    if (core == "rotate-45") return "transform: rotate(45deg);";
    if (core == "rotate-90") return "transform: rotate(90deg);";
    if (core == "rotate-180") return "transform: rotate(180deg);";
    
    // -rotate-{n} (negative)
    final negRotate = RegExp(r'^-rotate-(\d+)$').firstMatch(core);
    if (negRotate != null) {
      return "transform: rotate(-${negRotate.group(1)}deg);";
    }
    
    // translate
    if (core == "translate-x-0") return "transform: translateX(0px);";
    if (core == "translate-y-0") return "transform: translateY(0px);";
    if (core == "translate-x-1") return "transform: translateX(0.25rem);";
    if (core == "translate-y-1") return "transform: translateY(0.25rem);";
    if (core == "translate-x-2") return "transform: translateX(0.5rem);";
    if (core == "translate-y-2") return "transform: translateY(0.5rem);";
    if (core == "translate-x-full") return "transform: translateX(100%);";
    if (core == "translate-y-full") return "transform: translateY(100%);";
    
    // translate-x-{n}, translate-y-{n} (using spacing scale)
    final translateX = RegExp(r'^translate-x-(\d+)$').firstMatch(core);
    if (translateX != null && core != "translate-x-0" && core != "translate-x-1" && core != "translate-x-2" && core != "translate-x-full") {
      final val = int.parse(translateX.group(1)!);
      final spacing = kSpacingScale[val];
      if (spacing != null) {
        return "transform: translateX($spacing);";
      }
    }
    
    final translateY = RegExp(r'^translate-y-(\d+)$').firstMatch(core);
    if (translateY != null && core != "translate-y-0" && core != "translate-y-1" && core != "translate-y-2" && core != "translate-y-full") {
      final val = int.parse(translateY.group(1)!);
      final spacing = kSpacingScale[val];
      if (spacing != null) {
        return "transform: translateY($spacing);";
      }
    }
    
    // -translate-x-{n}, -translate-y-{n} (negative)
    final negTranslateX = RegExp(r'^-translate-x-(\d+)$').firstMatch(core);
    if (negTranslateX != null) {
      final val = int.parse(negTranslateX.group(1)!);
      final spacing = kSpacingScale[val];
      if (spacing != null) {
        return "transform: translateX(-$spacing);";
      }
    }
    
    final negTranslateY = RegExp(r'^-translate-y-(\d+)$').firstMatch(core);
    if (negTranslateY != null) {
      final val = int.parse(negTranslateY.group(1)!);
      final spacing = kSpacingScale[val];
      if (spacing != null) {
        return "transform: translateY(-$spacing);";
      }
    }
    
    // skew
    if (core == "skew-x-0") return "transform: skewX(0deg);";
    if (core == "skew-x-1") return "transform: skewX(1deg);";
    if (core == "skew-x-2") return "transform: skewX(2deg);";
    if (core == "skew-x-3") return "transform: skewX(3deg);";
    if (core == "skew-x-6") return "transform: skewX(6deg);";
    if (core == "skew-x-12") return "transform: skewX(12deg);";
    if (core == "skew-y-0") return "transform: skewY(0deg);";
    if (core == "skew-y-1") return "transform: skewY(1deg);";
    if (core == "skew-y-2") return "transform: skewY(2deg);";
    if (core == "skew-y-3") return "transform: skewY(3deg);";
    if (core == "skew-y-6") return "transform: skewY(6deg);";
    if (core == "skew-y-12") return "transform: skewY(12deg);";
    
    // transform origin
    if (core == "origin-center") return "transform-origin: center;";
    if (core == "origin-top") return "transform-origin: top;";
    if (core == "origin-top-right") return "transform-origin: top right;";
    if (core == "origin-right") return "transform-origin: right;";
    if (core == "origin-bottom-right") return "transform-origin: bottom right;";
    if (core == "origin-bottom") return "transform-origin: bottom;";
    if (core == "origin-bottom-left") return "transform-origin: bottom left;";
    if (core == "origin-left") return "transform-origin: left;";
    if (core == "origin-top-left") return "transform-origin: top left;";

    //
    // ---------------------------------------------------------------
    // ANIMATION → animate-none, animate-spin, animate-ping, etc.
    // ---------------------------------------------------------------
    if (core == "animate-none") return "animation: none;";
    if (core == "animate-spin") return "animation: spin 1s linear infinite;";
    if (core == "animate-ping") return "animation: ping 1s cubic-bezier(0, 0, 0.2, 1) infinite;";
    if (core == "animate-pulse") return "animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;";
    if (core == "animate-bounce") return "animation: bounce 1s infinite;";

    //
    // ---------------------------------------------------------------
    // ISOLATION → isolate, isolation-auto
    // ---------------------------------------------------------------
    if (core == "isolate") return "isolation: isolate;";
    if (core == "isolation-auto") return "isolation: auto;";

    //
    // ---------------------------------------------------------------
    // POINTER EVENTS → pointer-events-none, pointer-events-auto
    // ---------------------------------------------------------------
    if (core == "pointer-events-none") return "pointer-events: none;";
    if (core == "pointer-events-auto") return "pointer-events: auto;";

    //
    // ---------------------------------------------------------------
    // USER SELECT → select-none, select-text, select-all, select-auto
    // ---------------------------------------------------------------
    if (core == "select-none") return "user-select: none;";
    if (core == "select-text") return "user-select: text;";
    if (core == "select-all") return "user-select: all;";
    if (core == "select-auto") return "user-select: auto;";

    //
    // ---------------------------------------------------------------
    // CURSOR → cursor-auto, cursor-pointer, cursor-wait, etc.
    // ---------------------------------------------------------------
    if (core == "cursor-auto") return "cursor: auto;";
    if (core == "cursor-default") return "cursor: default;";
    if (core == "cursor-pointer") return "cursor: pointer;";
    if (core == "cursor-wait") return "cursor: wait;";
    if (core == "cursor-text") return "cursor: text;";
    if (core == "cursor-move") return "cursor: move;";
    if (core == "cursor-help") return "cursor: help;";
    if (core == "cursor-not-allowed") return "cursor: not-allowed;";
    if (core == "cursor-none") return "cursor: none;";
    if (core == "cursor-grab") return "cursor: grab;";
    if (core == "cursor-grabbing") return "cursor: grabbing;";

    //
    // ---------------------------------------------------------------
    // RESIZE → resize-none, resize-y, resize-x, resize
    // ---------------------------------------------------------------
    if (core == "resize-none") return "resize: none;";
    if (core == "resize-y") return "resize: vertical;";
    if (core == "resize-x") return "resize: horizontal;";
    if (core == "resize") return "resize: both;";

    //
    // ---------------------------------------------------------------
    // VISIBILITY → visible, invisible
    // ---------------------------------------------------------------
    if (core == "visible") return "visibility: visible;";
    if (core == "invisible") return "visibility: hidden;";

    //
    // ---------------------------------------------------------------
    // POSITION → static, sticky
    // ---------------------------------------------------------------
    if (core == "static") return "position: static;";
    if (core == "sticky") return "position: sticky;";

    //
    // ---------------------------------------------------------------
    // TEXT ALIGNMENT → text-left, text-center, text-right, text-justify
    // ---------------------------------------------------------------
    if (core == "text-left") return "text-align: left;";
    if (core == "text-center") return "text-align: center;";
    if (core == "text-right") return "text-align: right;";
    if (core == "text-justify") return "text-align: justify;";
    if (core == "text-start") return "text-align: start;";
    if (core == "text-end") return "text-align: end;";
    
    // text-decoration
    if (core == "underline") return "text-decoration-line: underline;";
    if (core == "overline") return "text-decoration-line: overline;";
    if (core == "line-through") return "text-decoration-line: line-through;";
    if (core == "no-underline") return "text-decoration-line: none;";
    
    // text-transform
    if (core == "uppercase") return "text-transform: uppercase;";
    if (core == "lowercase") return "text-transform: lowercase;";
    if (core == "capitalize") return "text-transform: capitalize;";
    if (core == "normal-case") return "text-transform: none;";
    
    // text-overflow
    if (core == "truncate") return "overflow: hidden; text-overflow: ellipsis; white-space: nowrap;";
    if (core == "text-ellipsis") return "text-overflow: ellipsis;";
    if (core == "text-clip") return "text-overflow: clip;";
    
    // whitespace
    if (core == "whitespace-normal") return "white-space: normal;";
    if (core == "whitespace-nowrap") return "white-space: nowrap;";
    if (core == "whitespace-pre") return "white-space: pre;";
    if (core == "whitespace-pre-line") return "white-space: pre-line;";
    if (core == "whitespace-pre-wrap") return "white-space: pre-wrap;";
    if (core == "whitespace-break-spaces") return "white-space: break-spaces;";
    
    // word-break
    if (core == "break-normal") return "overflow-wrap: normal; word-break: normal;";
    if (core == "break-words") return "overflow-wrap: break-word;";
    if (core == "break-all") return "word-break: break-all;";
    
    // box-sizing
    if (core == "box-border") return "box-sizing: border-box;";
    if (core == "box-content") return "box-sizing: content-box;";
    
    // float
    if (core == "float-left") return "float: left;";
    if (core == "float-right") return "float: right;";
    if (core == "float-none") return "float: none;";
    
    // clear
    if (core == "clear-left") return "clear: left;";
    if (core == "clear-right") return "clear: right;";
    if (core == "clear-both") return "clear: both;";
    if (core == "clear-none") return "clear: none;";
    
    // list-style
    if (core == "list-none") return "list-style-type: none;";
    if (core == "list-disc") return "list-style-type: disc;";
    if (core == "list-decimal") return "list-style-type: decimal;";
    if (core == "list-inside") return "list-style-position: inside;";
    if (core == "list-outside") return "list-style-position: outside;";
    
    // table
    if (core == "border-collapse") return "border-collapse: collapse;";
    if (core == "border-separate") return "border-collapse: separate;";
    if (core == "table-auto") return "table-layout: auto;";
    if (core == "table-fixed") return "table-layout: fixed;";
    
    // appearance
    if (core == "appearance-none") return "appearance: none;";
    
    // scroll-behavior
    if (core == "scroll-auto") return "scroll-behavior: auto;";
    if (core == "scroll-smooth") return "scroll-behavior: smooth;";
    
    // stroke-width (SVG)
    if (core == "stroke-0") return "stroke-width: 0;";
    if (core == "stroke-1") return "stroke-width: 1;";
    if (core == "stroke-2") return "stroke-width: 2;";
    
    final strokeWidth = RegExp(r'^stroke-(\d+)$').firstMatch(core);
    if (strokeWidth != null && core != "stroke-0" && core != "stroke-1" && core != "stroke-2") {
      return "stroke-width: ${strokeWidth.group(1)};";
    }
    
    // stroke-none, fill-none
    if (core == "stroke-none") return "stroke: none;";
    if (core == "fill-none") return "fill: none;";
    
    // top/right/bottom/left with auto
    if (core == "top-auto") return "top: auto;";
    if (core == "right-auto") return "right: auto;";
    if (core == "bottom-auto") return "bottom: auto;";
    if (core == "left-auto") return "left: auto;";
    
    // inset utilities
    if (core == "inset-0") return "top: 0px; right: 0px; bottom: 0px; left: 0px;";
    if (core == "inset-auto") return "top: auto; right: auto; bottom: auto; left: auto;";
    if (core == "inset-x-0") return "left: 0px; right: 0px;";
    if (core == "inset-y-0") return "top: 0px; bottom: 0px;";
    if (core == "inset-x-auto") return "left: auto; right: auto;";
    if (core == "inset-y-auto") return "top: auto; bottom: auto;";
    
    final inset = RegExp(r'^inset-(\d+)$').firstMatch(core);
    if (inset != null && core != "inset-0") {
      final val = kSpacingScale[int.parse(inset.group(1)!)];
      if (val != null) {
        return "top: $val; right: $val; bottom: $val; left: $val;";
      }
    }
    
    final insetX = RegExp(r'^inset-x-(\d+)$').firstMatch(core);
    if (insetX != null && core != "inset-x-0") {
      final val = kSpacingScale[int.parse(insetX.group(1)!)];
      if (val != null) {
        return "left: $val; right: $val;";
      }
    }
    
    final insetY = RegExp(r'^inset-y-(\d+)$').firstMatch(core);
    if (insetY != null && core != "inset-y-0") {
      final val = kSpacingScale[int.parse(insetY.group(1)!)];
      if (val != null) {
        return "top: $val; bottom: $val;";
      }
    }
    
    // margin auto
    if (core == "m-auto") return "margin: auto;";
    if (core == "mx-auto") return "margin-left: auto; margin-right: auto;";
    if (core == "my-auto") return "margin-top: auto; margin-bottom: auto;";
    if (core == "mt-auto") return "margin-top: auto;";
    if (core == "mr-auto") return "margin-right: auto;";
    if (core == "mb-auto") return "margin-bottom: auto;";
    if (core == "ml-auto") return "margin-left: auto;";

    return null;
  }

  //
  //======================================================================
  // FONT FACE GENERATION (Self-hosted fonts for speed)
  //======================================================================
  //
  String _generateFontFaces() {
    final buffer = StringBuffer();
    
    // Lato (UI/Body font) - Regular, Bold, Light, Black weights
    buffer.write('''
/* Kothari UI Default Fonts - Self-hosted for maximum speed */
@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 300;
  font-display: swap;
  src: url('fonts/lato/Lato-Light.woff2') format('woff2'),
       url('fonts/lato/Lato-Light.woff') format('woff');
}

@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url('fonts/lato/Lato-Regular.woff2') format('woff2'),
       url('fonts/lato/Lato-Regular.woff') format('woff');
}

@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 700;
  font-display: swap;
  src: url('fonts/lato/Lato-Bold.woff2') format('woff2'),
       url('fonts/lato/Lato-Bold.woff') format('woff');
}

@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 900;
  font-display: swap;
  src: url('fonts/lato/Lato-Black.woff2') format('woff2'),
       url('fonts/lato/Lato-Black.woff') format('woff');
}

/* JetBrains Mono (Code font) - Regular, Medium, SemiBold, Bold weights */
@font-face {
  font-family: 'JetBrains Mono';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url('fonts/jetbrains-mono/JetBrainsMono-Regular.woff2') format('woff2'),
       url('fonts/jetbrains-mono/JetBrainsMono-Regular.woff') format('woff');
}

@font-face {
  font-family: 'JetBrains Mono';
  font-style: normal;
  font-weight: 500;
  font-display: swap;
  src: url('fonts/jetbrains-mono/JetBrainsMono-Medium.woff2') format('woff2'),
       url('fonts/jetbrains-mono/JetBrainsMono-Medium.woff') format('woff');
}

@font-face {
  font-family: 'JetBrains Mono';
  font-style: normal;
  font-weight: 600;
  font-display: swap;
  src: url('fonts/jetbrains-mono/JetBrainsMono-SemiBold.woff2') format('woff2'),
       url('fonts/jetbrains-mono/JetBrainsMono-SemiBold.woff') format('woff');
}

@font-face {
  font-family: 'JetBrains Mono';
  font-style: normal;
  font-weight: 700;
  font-display: swap;
  src: url('fonts/jetbrains-mono/JetBrainsMono-Bold.woff2') format('woff2'),
       url('fonts/jetbrains-mono/JetBrainsMono-Bold.woff') format('woff');
}

''');
    
    return buffer.toString();
  }

  //
  //======================================================================
  // SUPPORT FUNCTIONS
  //======================================================================
  //

  String _colorProperty(String type) {
    switch (type) {
      case 'bg':
        return 'background-color';
      case 'text':
        return 'color';
      case 'border':
        return 'border-color';
      case 'shadow':
        return 'box-shadow';
      case 'ring':
        return 'box-shadow';
      case 'outline':
        return 'outline-color';
      case 'fill':
        return 'fill';
      case 'stroke':
        return 'stroke';
      case 'placeholder':
        return 'color'; // For ::placeholder pseudo-element
      case 'caret':
        return 'caret-color';
      case 'accent':
        return 'accent-color';
      case 'decoration':
        return 'text-decoration-color';
      default:
        return 'color';
    }
  }

  String? _spacingProperty(String type, String raw) {
    final val = kSpacingScale[int.parse(raw)];
    if (val == null) return null;

    switch (type) {
      case 'p':
        return "padding: $val;";
      case 'pt':
        return "padding-top: $val;";
      case 'pr':
        return "padding-right: $val;";
      case 'pb':
        return "padding-bottom: $val;";
      case 'pl':
        return "padding-left: $val;";
      case 'px':
        return "padding-left: $val; padding-right: $val;";
      case 'py':
        return "padding-top: $val; padding-bottom: $val;";
      case 'm':
        return "margin: $val;";
      case 'mt':
        return "margin-top: $val;";
      case 'mr':
        return "margin-right: $val;";
      case 'mb':
        return "margin-bottom: $val;";
      case 'ml':
        return "margin-left: $val;";
      case 'mx':
        return "margin-left: $val; margin-right: $val;";
      case 'my':
        return "margin-top: $val; margin-bottom: $val;";
      case 'gap':
        return "gap: $val;";
    }
    return null;
  }

  //
  //======================================================================
  // STATE VARIANT SUPPORT (hover:, focus:, active:, etc.)
  //======================================================================
  //
  String? stateVariantUtility(String className) {
    // Handle important modifier
    final hasImportant = className.startsWith('!');
    final cleanClassName = hasImportant ? className.substring(1) : className;
    
    // Match state variants: hover:, focus:, active:, etc.
    final match = RegExp(r'^(hover|focus|focus-within|focus-visible|active|visited|target|first|last|only|odd|even|first-of-type|last-of-type|only-of-type|empty|disabled|enabled|checked|indeterminate|default|required|valid|invalid|in-range|out-of-range|placeholder-shown|autofill|read-only|read-write|open)\:(.+)$').firstMatch(cleanClassName);
    if (match == null) return null;

    final variant = match.group(1)!;
    final inner = match.group(2)!;

    // Get CSS for the inner utility
    final css = dynamicUtility(inner);
    if (css == null) return null;

    // Map variant to CSS pseudo-class
    String pseudoClass;
    switch (variant) {
      case 'hover':
        pseudoClass = ':hover';
        break;
      case 'focus':
        pseudoClass = ':focus';
        break;
      case 'focus-within':
        pseudoClass = ':focus-within';
        break;
      case 'focus-visible':
        pseudoClass = ':focus-visible';
        break;
      case 'active':
        pseudoClass = ':active';
        break;
      case 'visited':
        pseudoClass = ':visited';
        break;
      case 'target':
        pseudoClass = ':target';
        break;
      case 'first':
        pseudoClass = ':first-child';
        break;
      case 'last':
        pseudoClass = ':last-child';
        break;
      case 'only':
        pseudoClass = ':only-child';
        break;
      case 'odd':
        pseudoClass = ':nth-child(odd)';
        break;
      case 'even':
        pseudoClass = ':nth-child(even)';
        break;
      case 'first-of-type':
        pseudoClass = ':first-of-type';
        break;
      case 'last-of-type':
        pseudoClass = ':last-of-type';
        break;
      case 'only-of-type':
        pseudoClass = ':only-of-type';
        break;
      case 'empty':
        pseudoClass = ':empty';
        break;
      case 'disabled':
        pseudoClass = ':disabled';
        break;
      case 'enabled':
        pseudoClass = ':enabled';
        break;
      case 'checked':
        pseudoClass = ':checked';
        break;
      case 'indeterminate':
        pseudoClass = ':indeterminate';
        break;
      case 'default':
        pseudoClass = ':default';
        break;
      case 'required':
        pseudoClass = ':required';
        break;
      case 'valid':
        pseudoClass = ':valid';
        break;
      case 'invalid':
        pseudoClass = ':invalid';
        break;
      case 'in-range':
        pseudoClass = ':in-range';
        break;
      case 'out-of-range':
        pseudoClass = ':out-of-range';
        break;
      case 'placeholder-shown':
        pseudoClass = ':placeholder-shown';
        break;
      case 'autofill':
        pseudoClass = ':autofill';
        break;
      case 'read-only':
        pseudoClass = ':read-only';
        break;
      case 'read-write':
        pseudoClass = ':read-write';
        break;
      case 'open':
        pseudoClass = ':open';
        break;
      default:
        return null;
    }

    final esc = cleanClassName.replaceAll(':', '\\:');
    final finalCss = hasImportant ? css.replaceAll(';', ' !important;') : css;
    return '.$esc$pseudoClass { $finalCss }';
  }

  //
  //======================================================================
  // ARBITRARY VARIANT SUPPORT ([&>p]:, [&_p]:, etc.)
  //======================================================================
  //
  String? arbitraryVariantUtility(String className) {
    // Handle important modifier
    final hasImportant = className.startsWith('!');
    final cleanClassName = hasImportant ? className.substring(1) : className;
    
    // Match arbitrary variants: [&>p]:, [&_p]:, [@media(...)]:, etc.
    final match = RegExp(r'^\[([^\]]+)\]\:(.+)$').firstMatch(cleanClassName);
    if (match == null) return null;

    final selector = match.group(1)!;
    // final inner = match.group(2)!; // Unused

    // Get CSS for the inner utility
    final css = dynamicUtility(cleanClassName);
    if (css == null) return null;

    // Check if it's a media query
    if (selector.startsWith('@media')) {
      // Media query variant: [@media(...)]:utility
      final esc = cleanClassName.replaceAll(':', '\\:').replaceAll('[', '\\[').replaceAll(']', '\\]');
      final finalCss = hasImportant ? css.replaceAll(';', ' !important;') : css;
      return '$selector { .$esc { $finalCss } }';
    } else {
      // Selector variant: [&>p]:utility
      // Replace & with the class name
      final esc = cleanClassName.replaceAll(':', '\\:').replaceAll('[', '\\[').replaceAll(']', '\\]');
      final finalSelector = selector.replaceAll('&', '.$esc');
      final finalCss = hasImportant ? css.replaceAll(';', ' !important;') : css;
      return '$finalSelector { $finalCss }';
    }
  }

  //
  //======================================================================
  // CONTAINER QUERY SUPPORT (@container, @container/name)
  //======================================================================
  //
  String? containerQueryUtility(String className) {
    // Handle important modifier
    final hasImportant = className.startsWith('!');
    final cleanClassName = hasImportant ? className.substring(1) : className;
    
    // Match container queries: @container or @container/name
    final match = RegExp(r'^@container(?:\/([a-zA-Z0-9_-]+))?\:(.+)$').firstMatch(cleanClassName);
    if (match == null) return null;

    final containerName = match.group(1);
    // final inner = match.group(2)!; // Unused

    // Get CSS for the inner utility
    final css = dynamicUtility(cleanClassName);
    if (css == null) return null;

    final esc = cleanClassName.replaceAll(':', '\\:').replaceAll('@', '\\@').replaceAll('/', '\\/');
    final finalCss = hasImportant ? css.replaceAll(';', ' !important;') : css;
    
    if (containerName != null) {
      // Named container query
      return '@container $containerName (min-width: 0px) { .$esc { $finalCss } }';
    } else {
      // Default container query
      return '@container (min-width: 0px) { .$esc { $finalCss } }';
    }
  }

  //
  //======================================================================
  // RESPONSIVE SUPPORT (sm:, md:, lg:, xl:, 2xl:)
  //======================================================================
  //
  String? responsiveUtility(String className) {
    // Check if it's a responsive variant (but not a state variant)
    final match = RegExp(r'^(sm|md|lg|xl|2xl)\:(.+)$').firstMatch(className);
    if (match == null) return null;

    final prefix = match.group(1)!;
    final inner = match.group(2)!;

    final breakpoint = breakpoints[prefix];
    if (breakpoint == null) return null;
    
    // Get CSS for the inner utility (which may include state variants)
    final css = dynamicUtility(inner);
    if (css == null) return null;

    final esc = className.replaceAll(':', '\\:');
    return '@media (min-width: $breakpoint) { .$esc { $css } }';
  }
}
