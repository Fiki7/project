// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'sign_in_form.dart';
import 'welcome_back.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      reverse: true,
      child: Column(
        children: const [WelcomeBack(), SignInForm()],
      ),
    ));
  }
}
