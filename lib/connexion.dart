import 'package:flutter/material.dart';
import 'main.dart';

class connexion extends StatelessWidget {
  const connexion({Key? key, required String title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
