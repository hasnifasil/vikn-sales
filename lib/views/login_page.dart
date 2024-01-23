
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vikn_sales/widgets/login_page/login_ipnput_widgets.dart';
import 'package:vikn_sales/widgets/login_page/login_page_design.dart';
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
        LoginInputDesign(userController: _userController, passwordController: _passwordController, loginController: _loginController),
      ]),
    );
  }
}


