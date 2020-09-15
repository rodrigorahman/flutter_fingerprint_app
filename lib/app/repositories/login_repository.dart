
import 'package:dio/dio.dart';
import 'package:flutter_fingerprint_app/app/exceptions/user_not_found_exception.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_repository.g.dart';

@Injectable()
class LoginRepository {
  final Dio _dio;

  LoginRepository(this._dio);

  Future<String> login(String login, String password) async {
    try {
      return await _dio.post('http://192.168.15.100:8888/login', data: {
        'login': login,
        'password': password
      }).then((res) => res.data['access_token']);
    } on DioError catch (e) {
      if(e?.response?.statusCode == 403) {
        throw UserNotFoundException();
      }
      
      rethrow;

    }
  }
  
}