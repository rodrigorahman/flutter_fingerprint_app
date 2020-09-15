import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fingerprint_app/app/modules/splash/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  final SplashController _splashController;

  const SplashPage(this._splashController, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
      body: BlocListener<SplashController, SplashState>(
        cubit: _splashController..checkLogged(),
        listener: (context, state) {
          switch (state.runtimeType) {
            case SplashUserLogged:
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
              break;
            case SplashUserUnlogged:
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
              break;
          }
        },
        child: Container(),
      ),
    );
  }
}
