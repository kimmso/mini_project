import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/src/components/gredient_button.dart';
import 'package:flutter_getx_todo/src/controller/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _title(),
              _input(),
              _button(),
              _signUp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      child: Center(
          child: Text('Sign In',
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 40,
                  fontWeight: FontWeight.bold))),
    );
  }

  Widget _input() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: TextField(
            controller: controller.email,
            decoration: const InputDecoration(
              hintText: 'E-mail',
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: TextField(
            controller: controller.password,
            decoration: const InputDecoration(
              hintText: 'password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
        )
      ],
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Obx(
        () => GradientButton(
            onPressed: controller.validate,
            width: double.infinity,
            height: 20,
            child: (controller.isLoading) ? _loading() : _loginText()),
      ),
    );
  }

  Widget _signUp() {
    return TextButton(
      onPressed: controller.moveToRegister,
      child: const Text(
        'Sign Up',
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _loading() {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _loginText() {
    return const Text(
      'Login',
      style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white),
    );
  }
}
