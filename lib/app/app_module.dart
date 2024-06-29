import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/pages/splash_page.dart';
import 'modules/tmdb/tmdb_module.dart';

class AppModule extends Module {

  @override
  void binds(i) {
  }
   

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/tmdb', module: TmdbModule() );
  }

} 