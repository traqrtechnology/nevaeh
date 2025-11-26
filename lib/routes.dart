/// Routes configuration file
/// 
/// This file is auto-generated and updated by the nevaeh generate command
/// You can also manually add routes here
/// 
/// Usage:
///   router.get('/users', (params) => renderView('users/index', params: params));
///   router.post('/users', (params) => handleCreateUser(params));
///   router.resources('posts'); // Creates RESTful routes
/// 
/// NOTE: This file should only be imported in browser context (web/main.dart)
/// It uses dart:html which is not available in CLI/server contexts

// Browser-only imports - only use this file in web context
// ignore: avoid_web_libraries_in_flutter
import 'routing/router.dart';

final router = Router();

// Route definitions
void setupRoutes() {
  // Auto-generated routes will be added here
  // Example:
  // router.get('/users', (params) => renderView('users/index', params: params));
  router.get('/home', (params) => renderView('home', params: params));
  router.get('/docs', (params) => renderView('docs', params: params));
}

