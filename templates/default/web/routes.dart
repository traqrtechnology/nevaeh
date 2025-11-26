import '../lib/routing/router.dart';
import 'layouts/application.dart';
import 'views/home.dart' as view_home;
import 'views/docs.dart' as view_docs;

void configureRoutes(Router router) {
  router.get('/home-nevaeh-ui', (params) async {
    final content = await view_home.render();
    ApplicationLayout.render(content, params: params);
  });
  router.get('/', (params) async {
    final content = await view_home.render();
    ApplicationLayout.render(content, params: params);
  });
  router.get('/home', (params) async {
    final content = await view_home.render();
    ApplicationLayout.render(content, params: params);
  });
  router.get('/documentation-nevaeh-ui', (params) async {
    final content = await view_docs.render();
    ApplicationLayout.render(content, params: params);
  });
  router.get('/docs', (params) async {
    final content = await view_docs.render();
    ApplicationLayout.render(content, params: params);
  });
}
