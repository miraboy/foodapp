import 'package:flutter/material.dart';
import 'locallisation.dart';
import 'main.dart';

class connexion extends StatelessWidget {
  const connexion({Key? key, required String title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //controller: controller,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const localisation()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'localisation',
                style: TextStyle(
                  color:Color.fromARGB(255, 191, 104, 12),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
