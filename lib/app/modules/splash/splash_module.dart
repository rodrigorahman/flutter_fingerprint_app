import 'package:flutter_fingerprint_app/app/modules/splash/controller/splash_controller.dart';
import 'package:flutter_fingerprint_app/app/modules/splash/view/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends ChildModule {

   @override
   List<Bind> get binds => [
     $SplashController
   ];

   @override
   List<ModularRouter> get routers => [
     ModularRouter(Modular.initialRoute, child: (context, args) => SplashPage(Modular.get<SplashController>()))
   ];

   static Inject get to => Inject<SplashModule>.of();
}