import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsLogin {
  final localAuth = LocalAuthentication();

  Future<bool> auth() async {
    const iosStrings = const IOSAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
      lockOut: 'Please reenable your Touch ID',
    );

    const androidStrings = const AndroidAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
    );

    return await localAuth.authenticateWithBiometrics(
      localizedReason: 'Please authenticate to show account balance',
      useErrorDialogs: false,
      iOSAuthStrings: iosStrings,
      androidAuthStrings: androidStrings,
    );
  }

  Future<bool> isBiometricsAuth() => localAuth.canCheckBiometrics;
}
