import 'package:flutter_fingerprint_app/app/modules/login/controller/login_controller.dart';
import 'package:flutter_fingerprint_app/app/modules/login/view/login_page.dart';
import 'package:flutter_fingerprint_app/app/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {

   @override
   List<Bind> get binds => [
     $LoginRepository,
     $LoginController,
   ];

   @override
   List<ModularRouter> get routers => [
     ModularRouter(Modular.initialRoute, child: (context, args) => LoginPage(Modular.get<LoginController>()))
   ];

   static Inject get to => Inject<LoginModule>.of();
}