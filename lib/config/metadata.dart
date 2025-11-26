/// Global metadata configuration for HTML head tags
/// 
/// Set these values in your Dart files to customize HTML metadata
/// These values are used when generating HTML boilerplate
class Metadata {
  // Basic meta tags
  static String title = 'Kothari UI - Dart-Powered CSS Framework';
  static String description = 'A modern UI framework built with Dart';
  static String keywords = 'dart, ui, framework, css, web';
  static String author = '';
  static String charset = 'utf-8';
  static String viewport = 'width=device-width, initial-scale=1.0';
  
  // Open Graph (Facebook)
  static String ogTitle = '';
  static String ogDescription = '';
  static String ogImage = '';
  static String ogUrl = '';
  static String ogType = 'website';
  
  // Twitter Card
  static String twitterCard = 'summary_large_image';
  static String twitterTitle = '';
  static String twitterDescription = '';
  static String twitterImage = '';
  
  // Additional meta tags
  static String themeColor = '#ffffff';
  static String lang = 'en';
  
  /// Route configuration
  /// Set to true to make this view the root path '/'
  static bool isRoot = false;
  
  /// Reset all metadata to defaults
  static void reset() {
    title = 'Kothari UI - Dart-Powered CSS Framework';
    description = 'A modern UI framework built with Dart';
    keywords = 'dart, ui, framework, css, web';
    author = '';
    charset = 'utf-8';
    viewport = 'width=device-width, initial-scale=1.0';
    ogTitle = '';
    ogDescription = '';
    ogImage = '';
    ogUrl = '';
    ogType = 'website';
    twitterCard = 'summary_large_image';
    twitterTitle = '';
    twitterDescription = '';
    twitterImage = '';
    themeColor = '#ffffff';
    lang = 'en';
  }
  
  /// Get Open Graph title (falls back to title if not set)
  static String get effectiveOgTitle => ogTitle.isNotEmpty ? ogTitle : title;
  
  /// Get Open Graph description (falls back to description if not set)
  static String get effectiveOgDescription => ogDescription.isNotEmpty ? ogDescription : description;
  
  /// Get Twitter title (falls back to ogTitle or title)
  static String get effectiveTwitterTitle => twitterTitle.isNotEmpty ? twitterTitle : effectiveOgTitle;
  
  /// Get Twitter description (falls back to ogDescription or description)
  static String get effectiveTwitterDescription => twitterDescription.isNotEmpty ? twitterDescription : effectiveOgDescription;
  
  /// Get Twitter image (falls back to ogImage)
  static String get effectiveTwitterImage => twitterImage.isNotEmpty ? twitterImage : ogImage;
}

