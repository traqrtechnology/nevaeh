import 'dart:io';
import 'package:path/path.dart' as path;

/// Downloads Kothari UI fonts for self-hosting
/// This ensures fonts load fast from your domain (no external dependencies)
void main() async {
  print('🎨 Kothari UI Font Downloader');
  print('==============================\n');

  final fontsDir = Directory('web/fonts');
  final latoDir = Directory(path.join('web', 'fonts', 'lato'));
  final jetbrainsDir = Directory(path.join('web', 'fonts', 'jetbrains-mono'));

  // Create directories
  latoDir.createSync(recursive: true);
  jetbrainsDir.createSync(recursive: true);

  print('📁 Created font directories:');
  print('   - ${latoDir.path}');
  print('   - ${jetbrainsDir.path}\n');

  print('📥 Font Download Instructions:');
  print('');
  print('Lato (UI/Body Font):');
  print('   1. Visit: https://fonts.google.com/specimen/Lato');
  print('   2. Click "Download family"');
  print('   3. Extract and copy these .woff2 files to:');
  print('      ${latoDir.path}/');
  print('      - Lato-Light.woff2 (weight: 300)');
  print('      - Lato-Regular.woff2 (weight: 400)');
  print('      - Lato-Bold.woff2 (weight: 700)');
  print('      - Lato-Black.woff2 (weight: 900)');
  print('');
  print('JetBrains Mono (Code Font):');
  print('   1. Visit: https://www.jetbrains.com/lp/mono/');
  print('   2. Download the latest release');
  print('   3. Extract and copy these .woff2 files to:');
  print('      ${jetbrainsDir.path}/');
  print('      - JetBrainsMono-Regular.woff2 (weight: 400)');
  print('      - JetBrainsMono-Medium.woff2 (weight: 500)');
  print('      - JetBrainsMono-SemiBold.woff2 (weight: 600)');
  print('      - JetBrainsMono-Bold.woff2 (weight: 700)');
  print('');
  print('✨ Once fonts are in place, they will load automatically!');
  print('   The framework will fall back to system fonts if fonts are missing.');
  print('');
  print('💡 Tip: You can also use the bash script:');
  print('   ./scripts/download_fonts.sh');
}

