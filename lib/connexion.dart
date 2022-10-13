import 'package:flutter/material.dart';
import 'detailRestaurant.dart';
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
                MaterialPageRoute(builder: (context) => const localisation()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'localisation',
                style: TextStyle(
                  color: Colors.black,                  
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const detailRestaurant()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Detail d'un restaurant",
                style: TextStyle(
                  color: Colors.black,
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
