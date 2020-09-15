part of 'splash_controller.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}
class SplashUserLogged extends SplashState {}
class SplashUserUnlogged extends SplashState {}
