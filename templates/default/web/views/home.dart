import 'dart:html';
import 'dart:convert';
import 'package:nevaeh_ui/nevaeh_ui.dart';



import '../layouts/application.dart';


// ============================================================================
// METADATA - Edit these values to customize page metadata
// ============================================================================
void _setMetadata() {
  Metadata.title = 'Home - Nevaeh UI';
  Metadata.description = 'The Cutest Way to Write Dart Web Apps';
  Metadata.keywords = 'dart, ui, framework, css, glassmorphism';
  Metadata.isRoot = true; // Explicitly set as root path '/'
}
// ============================================================================

/// View: home
/// Route: /home
///
/// This view's content will be rendered inside the ApplicationLayout
Future<KElement> render() async {
  // Set metadata for this page
  _setMetadata();

  // 1. Fetch real data from a public API
  //    We use our new Json helper to fetch a random user
  dynamic userData;
  try {
    userData = await Json.get('https://jsonplaceholder.typicode.com/users/2');
  } catch (e) {
    print('Failed to fetch user data: $e');
    // Fallback data if offline
    userData = {
      'name': 'Offline User',
      'company': {'name': 'Localhost'},
    };
  }

  // 2. Pass the data to our render function
  return _renderContent(userData);
}

KElement _renderContent(dynamic userData) {
  return Container(
    children: [
      _buildHeroSection(),
      // Pass the data to a new section
      _buildApiDemoSection(userData),
      _buildFeatureGrid(),
      _buildCodePreview(),
    ],
    classes: ['flex', 'flex-col', 'gap-24', 'pb-32', 'w-full'],
  );
}

// ... existing _buildHeroSection ...

/// New section to demonstrate API usage
KElement _buildApiDemoSection(dynamic userData) {
  final name = userData['name'];
  final company = userData['company']['name'];
  final email = userData['email'];

  return Container(
    children: [
      Container(
        children: [
          Text(
            'API Integration Demo',
            classes: [
              'text-sm',
              'font-bold',
              'text-rose-500',
              'uppercase',
              'tracking-wider',
              'mb-2',
            ],
          ),
          Text(
            'Real Data, Real Simple',
            classes: ['text-3xl', 'font-black', 'text-slate-800', 'mb-6'],
          ),

          // The Card showing fetched data
          Container(
            children: [
              FlexRow(
                children: [
                  // Avatar
                  Avatar(
                    src: 'https://i.pravatar.cc/150?u=1',
                    // alt: name, // Avatar doesn't support alt yet
                    size: 64, // Avatar uses int size, not string 'lg'
                    classes: ['border-4', 'border-white', 'shadow-md'],
                  ),

                  // User Info
                  FlexCol(
                    children: [
                      Text(
                        name,
                        classes: ['text-xl', 'font-bold', 'text-slate-800'],
                      ),
                      Text(
                        '@$company',
                        classes: ['text-slate-500', 'font-medium'],
                      ),
                      Text(
                        email,
                        classes: ['text-sm', 'text-slate-400', 'mt-1'],
                      ),
                    ],
                    classes: ['justify-center'],
                  ),
                ],
                classes: ['gap-4', 'items-center'],
              ),

              // Code Snippet
              Container(
                children: [
                  Text(
                    '// How we fetched this:',
                    classes: ['text-xs', 'text-slate-500', 'mb-2', 'font-mono'],
                  ),
                  Code(
                    text: "final user = await Json.get('https://api.../users/1');", 
                    classes: [
                      'text-xs',
                      'bg-slate-100',
                      'p-2',
                      'rounded',
                      'text-slate-600',
                    ],
                  ),
                ],
                classes: ['mt-6', 'pt-6', 'border-t', 'border-slate-100'],
              ),
            ],
            classes: [
              'bg-white',
              'p-8',
              'rounded-2xl',
              'shadow-xl',
              'shadow-slate-200/50',
              'border',
              'border-slate-100',
              'max-w-md',
              'w-full',
              'mx-auto',
            ],
          ),
        ],
        classes: ['flex', 'flex-col', 'items-center', 'text-center'],
      ),
    ],
    classes: ['w-full', 'px-6', 'py-12', 'bg-slate-50/50'],
  );
}

KElement _buildHeroSection() {
  return Container(
    children: [
      FlexCol(
        children: [
          // Headline
          Text(
            'The Cutest Way to Write Dart Web Apps',
            classes: [
              'text-6xl',
              'md:text-7xl',
              'font-black',
              'text-transparent',
              'bg-clip-text',
              'bg-gradient-to-br',
              'from-slate-800',
              'via-slate-900',
              'to-slate-700',
              'text-center',
              'leading-tight',
              'mb-6',
              'tracking-tight',
              'drop-shadow-sm',
            ],
          ),
          // Subheadline
          Text(
            'Zero runtime, 100% Type-safe, Infinite Sparkles ✨',
            classes: [
              'text-xl',
              'md:text-2xl',
              'text-slate-500',
              'mt-2',
              'text-center',
              'font-medium',
              'max-w-2xl',
              'leading-relaxed',
            ],
          ),
          // Buttons
          FlexRow(
            children: [_buildGetStartedButton(), _buildDocsButton()],
            classes: ['gap-6', 'mt-12', 'justify-center', 'flex-wrap'],
          ),
        ],
        classes: [
          'items-center',
          'max-w-5xl',
          'mx-auto',
          'pt-32',
          'px-6',
          'w-full',
        ],
      ),
    ],
    classes: ['w-full'],
  );
}

KElement _buildGetStartedButton() {
  final button = Button(
    title: 'Get Started 🚀',
    classes: [
      'bg-gradient-to-r',
      'from-rose-500',
      'to-pink-600',
      'text-white',
      'rounded-full',
      'px-10',
      'py-4',
      'shadow-lg',
      'shadow-rose-500/30',
      'hover:scale-105',
      'hover:shadow-rose-500/40',
      'hover:shadow-xl',
      'transition-all',
      'duration-300',
      'border-none',
      'font-bold',
      'text-lg',
      'cursor-pointer',
    ],
  );

  // Example of click handler
  button.element.onClick.listen((e) {
    print('Get Started clicked!');
    // Add your logic here
  });

  return button;
}

KElement _buildDocsButton() {
  final button = Button(
    title: 'Read Docs 📖',
    classes: [
      'bg-white/80',
      'backdrop-blur-sm',
      'text-rose-600',
      'border-2',
      'border-rose-100',
      'rounded-full',
      'px-10',
      'py-4',
      'hover:bg-rose-50',
      'hover:border-rose-200',
      'transition-all',
      'duration-300',
      'font-bold',
      'text-lg',
      'cursor-pointer',
      'shadow-sm',
    ],
  );

  // Add click handler to navigate to docs
  button.element.onClick.listen((e) {
    // Prevent default link behavior (though button isn't a link, this is good practice)
    e.preventDefault();

    // Navigate to the new SEO-friendly route!
    Router().navigate('/documentation-nevaeh-ui');
  });

  return button;
}

KElement _buildFeatureGrid() {
  return Grid(
    cols: 1,
    children: [
      _buildGlassCard(
        'KothariCSS',
        '🎨',
        'A utility-first CSS framework built for Dart. Type-safe, fast, and zero-runtime overhead.',
        'from-blue-400',
        'to-cyan-300',
      ),
      _buildGlassCard(
        'Crystal Ready',
        '💎',
        'Pre-built glassmorphism components that shine out of the box with beautiful defaults.',
        'from-purple-400',
        'to-pink-300',
      ),
      _buildGlassCard(
        'CLI Magic',
        '🪄',
        'Generate views, components, and builds with a single command. Developer experience first.',
        'from-amber-400',
        'to-orange-300',
      ),
    ],
    classes: [
      'grid-cols-1',
      'md:grid-cols-3',
      'gap-8',
      'px-6',
      'max-w-7xl',
      'mx-auto',
      'w-full',
    ],
  );
}

KElement _buildGlassCard(
  String title,
  String emoji,
  String description,
  String gradFrom,
  String gradTo,
) {
  return Container(
    children: [
      // Emoji with blob background
      Container(
        children: [
          Text(emoji, classes: ['text-5xl', 'relative', 'z-10']),
        ],
        classes: [
          'w-24',
          'h-24',
          'rounded-full',
          'bg-gradient-to-br',
          gradFrom,
          gradTo,
          'opacity-20',
          'flex',
          'items-center',
          'justify-center',
          'mb-6',
          'rounded-full',
        ],
      ),

      Text(title, classes: ['text-2xl', 'font-bold', 'text-slate-800', 'mb-4']),
      Text(
        description,
        classes: ['text-slate-600', 'leading-relaxed', 'text-center'],
      ),
    ],
    classes: [
      'bg-white/40',
      'backdrop-blur-md',
      'p-10',
      'rounded-3xl',
      'border',
      'border-white/60',
      'shadow-xl',
      'shadow-slate-200/50',
      'hover:-translate-y-2',
      'hover:bg-white/60',
      'hover:border-white/80',
      'transition-all',
      'duration-300',
      'flex',
      'flex-col',
      'items-center',
      'text-center',
      'h-full',
      'w-full',
    ],
  );
}

KElement _buildCodePreview() {
  return Container(
    children: [
      Container(
        children: [
          // Window Title Bar
          Container(
            children: [
              FlexRow(
                children: [
                  Container(
                    classes: ['w-3', 'h-3', 'rounded-full', 'bg-red-500'],
                  ),
                  Container(
                    classes: ['w-3', 'h-3', 'rounded-full', 'bg-yellow-500'],
                  ),
                  Container(
                    classes: ['w-3', 'h-3', 'rounded-full', 'bg-green-500'],
                  ),
                ],
                classes: ['gap-2'],
              ),
              Text(
                'home.dart',
                classes: ['text-slate-400', 'text-xs', 'font-medium'],
              ),
              Container(classes: ['w-10']), // Spacer for centering
            ],
            classes: [
              'flex',
              'items-center',
              'justify-between',
              'px-4',
              'py-3',
              'border-b',
              'border-slate-700/50',
              'bg-slate-800/50',
              'rounded-t-xl',
            ],
          ),

          // Code Content
          CodeBlock(
            code: '''
// The cuteness is real! 💖
final app = NevaehApp(
  home: Scaffold(
    body: Center(
      child: GlassCard(
        child: Text(
          "Hello World! ✨",
          classes: [
            "text-6xl", 
            "font-black", 
            "bg-gradient-to-r",
            "from-rose-400",
            "to-violet-500",
            "text-transparent",
            "bg-clip-text",
          ],
        ),
      ),
    ),
  ),
);
''',
            language: 'dart',
            classes: [
              'rounded-none',
              'rounded-b-xl',
              'bg-transparent', // Let container bg show
              '!p-6',
              'text-sm',
              'md:text-base',
            ],
          ),
        ],
        classes: [
          'bg-slate-900',
          'rounded-xl',
          'shadow-2xl',
          'shadow-violet-900/20',
          'max-w-3xl',
          'mx-auto',
          'w-full',
          'border',
          'border-slate-700',
          'overflow-hidden', // Clip corners
          'transform',
          'hover:scale-[1.01]',
          'transition-transform',
          'duration-500',
        ],
      ),
    ],
    classes: ['px-6', 'w-full'],
  );
}
