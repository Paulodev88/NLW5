import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';
import 'package:nlw/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Center(child: Image.asset(AppImages.logo)),
    ));
  }
}
