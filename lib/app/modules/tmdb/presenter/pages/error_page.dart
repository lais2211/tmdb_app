import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/movie_l10n.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  final MovieL10n text = MovieL10n();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF160B30),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFF160B30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.titleError,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Image.asset('assets/images/tristeza.png'),
            ),
            const SizedBox(height: 40),
            Text(
              text.textError,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              text.tryAgain,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
