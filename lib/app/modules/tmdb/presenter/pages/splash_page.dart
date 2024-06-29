import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

   @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Modular.to.pushReplacementNamed('/tmdb/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/splashPage.jpg', fit: BoxFit.cover);
  }
}