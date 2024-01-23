import 'package:flutter/material.dart';
import 'package:vikn_sales/controllers/login_controller.dart';
import 'package:vikn_sales/widgets/login_page/login_ipnput_widgets.dart';

class LoginInputDesign extends StatelessWidget {
  const LoginInputDesign({
    super.key,
    required TextEditingController userController,
    required TextEditingController passwordController,
    required LoginController loginController,
  }) : _userController = userController, _passwordController = passwordController, _loginController = loginController;

  final TextEditingController _userController;
  final TextEditingController _passwordController;
  final LoginController _loginController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.translate_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('English')
                    ],
                  )),
              LoginInputFieldDesign(userController: _userController, passwordController: _passwordController, loginController: _loginController),
              Container(
                child: Column(
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign up now!',
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ]));
  }
}