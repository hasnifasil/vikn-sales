import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vikn_sales/views/sales_list.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.5,
              center: Alignment.topLeft,
              colors: [
                Color.fromARGB(255, 247, 239, 183),
                Colors.white.withOpacity(0),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.5,
              center: Alignment.centerRight,
              colors: [
                const Color.fromARGB(255, 152, 204, 246),
                Colors.white.withOpacity(0),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1,
              center: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 248, 141, 179),
                Colors.white.withOpacity(0),
              ],
            ),
          ),
        ),
        Padding(
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
                  Column(
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
                            _loginController.loginUser(_userController.text,
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
                  ),
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
                ])),
      ]),
    );
  }
}
