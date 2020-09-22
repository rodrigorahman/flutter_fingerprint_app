
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

enum AuthState {
  logged,
  unlogged
}

class AuthCheckLogin {
  
  Future<AuthState> call() => checkIsLogged();

  Future<AuthState> checkIsLogged() async {
    final sp = await SharedPreferences.getInstance();

    if(sp.containsKey(LOGGED_KEY)){
      return AuthState.logged;
    }

    return AuthState.unlogged;

  }
  
}