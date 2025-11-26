// Browser-only imports - this file should only be used in web context
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:convert';
import 'dart:async';

/// Route handler function type
/// [params] - Route parameters (e.g., from /users/:id)
typedef RouteHandler = Future<void> Function(Map<String, String> params);

/// Rails-like router for client-side routing
class Router {
  static final Router _instance = Router._internal();
  factory Router() => _instance;
  Router._internal();
  
  
  final Map<String, RouteHandler> _getRoutes = {};
  final Map<String, RouteHandler> _postRoutes = {};
  final Map<String, RouteHandler> _putRoutes = {};
  final Map<String, RouteHandler> _deleteRoutes = {};
  
  /// Register a GET route
  void get(String path, RouteHandler handler) {
    _getRoutes[_normalizePath(path)] = handler;
  }
  
  /// Register a POST route
  void post(String path, RouteHandler handler) {
    _postRoutes[_normalizePath(path)] = handler;
  }
  
  /// Register a PUT route
  void put(String path, RouteHandler handler) {
    _putRoutes[_normalizePath(path)] = handler;
  }
  
  /// Register a DELETE route
  void delete(String path, RouteHandler handler) {
    _deleteRoutes[_normalizePath(path)] = handler;
  }
  
  /// Register RESTful resources
  /// Creates: index, show, new, edit, create, update, destroy
  void resources(String resourceName, {RouteHandler? index, RouteHandler? show}) {
    final base = resourceName;
    
    // GET routes
    get('/$base', index ?? (params) => renderView('$base/index'));
    get('/$base/:id', show ?? (params) => renderView('$base/show', params: params));
    
    // POST route for create
    post('/$base', (params) => renderView('$base/create', params: params));
    
    // PUT route for update
    put('/$base/:id', (params) => renderView('$base/update', params: params));
    
    // DELETE route for destroy
    delete('/$base/:id', (params) => renderView('$base/destroy', params: params));
  }
  
  /// Navigate to a route
  Future<void> navigate(String path, {Map<String, String>? params}) async {
    final normalized = _normalizePath(path);
    final routeParams = params ?? {};
    
    // Try to match route
    final handler = _findHandler(normalized, routeParams);
    
    if (handler != null) {
      await handler(routeParams);
      // Update browser URL (hash-based routing)
      window.location.hash = path;
    } else {
      print('Route not found: $path');
    }
  }
  
  /// Initialize router and listen for hash changes
  void init() {
    // Handle initial route
    _handleRoute(window.location.hash);
    
    // Listen for hash changes
    window.onHashChange.listen((event) {
      _handleRoute(window.location.hash);
    });
  }
  
  void _handleRoute(String hash) {
    final path = hash.isEmpty ? '/' : hash.substring(1); // Remove #
    navigate(path);
  }
  
  RouteHandler? _findHandler(String path, Map<String, String> params) {
    // Try GET routes first (most common)
    return _matchRoute(_getRoutes, path, params) ??
           _matchRoute(_postRoutes, path, params) ??
           _matchRoute(_putRoutes, path, params) ??
           _matchRoute(_deleteRoutes, path, params);
  }
  
  RouteHandler? _matchRoute(
    Map<String, RouteHandler> routes,
    String path,
    Map<String, String> params,
  ) {
    for (final routePath in routes.keys) {
      final match = _matchPath(routePath, path);
      if (match != null) {
        params.addAll(match);
        return routes[routePath];
      }
    }
    return null;
  }
  
  Map<String, String>? _matchPath(String routePattern, String path) {
    final routeParts = routePattern.split('/');
    final pathParts = path.split('/');
    
    if (routeParts.length != pathParts.length) return null;
    
    final params = <String, String>{};
    
    for (int i = 0; i < routeParts.length; i++) {
      final routePart = routeParts[i];
      final pathPart = pathParts[i];
      
      if (routePart.startsWith(':')) {
        // Parameter
        final paramName = routePart.substring(1);
        params[paramName] = pathPart;
      } else if (routePart != pathPart) {
        // Not a match
        return null;
      }
    }
    
    return params;
  }
  
  String _normalizePath(String path) {
    if (!path.startsWith('/')) {
      path = '/$path';
    }
    return path;
  }
}

/// Render a view by name
/// 
/// [viewName] - View name (e.g., 'users/index')
/// [params] - Route parameters
/// 
/// NOTE: This function is a placeholder. In a real implementation:
/// 1. Views are imported statically in web/main.dart or loaded dynamically
/// 2. Each view has a render() function that returns a KElement
/// 3. The returned KElement is passed to ApplicationLayout.render()
/// 4. ApplicationLayout wraps it with navbar, footer, etc.
/// 
/// Example usage in web/main.dart:
/// ```dart
/// import 'layouts/application.dart';
/// import 'views/home.dart' as home_view;
/// 
/// void main() {
///   final viewContent = await home_view.render();
///   ApplicationLayout.render(viewContent);
/// }
/// ```
Future<void> renderView(String viewName, {Map<String, String>? params}) async {
  print('Rendering view: $viewName with params: ${params ?? {}}');
  print('Note: View rendering should be implemented in web/main.dart');
  print('Import the view and call its render() function, then pass to ApplicationLayout.render()');
}

/// Fetch JSON from an API endpoint
Future<dynamic> fetchJson(String url) async {
  try {
    final response = await HttpRequest.getString(url);
    return jsonDecode(response);
  } catch (e) {
    print('Error fetching JSON from $url: $e');
    rethrow;
  }
}

/// Helper to get path for a resource
String usersPath() => '/users';
String userPath(String id) => '/users/$id';
String postsPath() => '/posts';
String postPath(String id) => '/posts/$id';

