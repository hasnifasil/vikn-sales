

import 'package:flutter/material.dart';
import 'package:vikn_sales/controllers/login_controller.dart';

class LoginInputFieldDesign extends StatelessWidget {
  const LoginInputFieldDesign({
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
    return Column(
      children: [
        Text(
          'Login',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Login to your vikn account',
          style: TextStyle(
              fontWeight: FontWeight.w200, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade200))),
                  child: TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 1),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        labelText: "Username",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(
                                255, 100, 100, 100),
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade200))),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 1),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                        ),
                        prefixIcon: Icon(
                          Icons.key_outlined,
                          color: Colors.blue,
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(
                                255, 100, 100, 100),
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Forgotten Password?',
          style:
              TextStyle(color: Color.fromARGB(255, 19, 145, 247)),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
            onTap: () {
              _loginController.logintoDb(_userController.text,
                  _passwordController.text, context);
            },
            child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 6, 114, 201)),
                child: Center(
                    child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ))))
      ],
    );
  }
}