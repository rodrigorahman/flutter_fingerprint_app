import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fingerprint_app/app/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller;
  final obscurePassword = ValueNotifier<bool>(true);
  final loginEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  LoginPage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: BlocConsumer<LoginController, LoginState>(
            cubit: _controller,
            listener: (context, state) {

              if(state is LoginError){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
              }


            },
            builder: (context, state) {

              if(state is LoginLoading){
                return Center(child: CircularProgressIndicator());
              }

              if(state is LoginSuccess){
                Future.delayed(Duration.zero, () => Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false));
              }

              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Color(0xFF26232A),
                  ),
                  Image.network('https://miro.medium.com/max/1200/1*ZGWXMiqjVcnuRXdytvgwmA.png'),
                  SizedBox(
                    height: 10,
                  ),
                  _buildTextField(labelText: 'Login', controller: loginEditingController),
                  ValueListenableBuilder(
                    valueListenable: obscurePassword,
                    builder: (_, obscurePasswordValue, child) {
                      return _buildTextField(
                        controller: passwordEditingController,
                        labelText: 'Senha',
                        suffixIcon: IconButton(
                          onPressed: () => obscurePassword.value = !obscurePasswordValue,
                          icon: Icon(obscurePasswordValue ? Icons.lock : Icons.lock_open),
                        ),
                        obscureText: obscurePasswordValue,
                      );
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      _controller.login(
                        loginEditingController.text,
                        passwordEditingController.text,
                      );
                    },
                    child: Text('Login'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({TextEditingController controller, String labelText, Widget suffixIcon, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(labelText: labelText, suffixIcon: suffixIcon),
      ),
    );
  }
}
