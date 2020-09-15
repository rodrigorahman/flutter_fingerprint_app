import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_fingerprint_app/app/shared/auth/auth_check_login.dart';

part 'splash_state.dart';

part 'splash_controller.g.dart';

@Injectable(singleton: false)
class SplashController extends Cubit<SplashState> {
  final AuthCheckLogin _authCheckLogin;

  SplashController(
    this._authCheckLogin,
  ) : super(SplashInitial());

  Future<void> checkLogged() async {
    final authState = await _authCheckLogin();

    switch (authState) {
      case AuthState.logged:
        emit(SplashUserLogged());
        break;
      case AuthState.unlogged:
        emit(SplashUserUnlogged());
        break;
    }
  }
}
