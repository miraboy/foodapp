// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class inscription_v extends StatelessWidget {
  const inscription_v({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Validation',
      home: validation(),
    );
  }
}

class validation extends StatefulWidget {
  const validation({super.key});

  @override
  State<validation> createState() => _validationState();
}

class _validationState extends State<validation> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical ,
      children: [
        Row(
          children: [
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
            ),
            onPressed: () {
              //Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
            const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
                'Verication du code OTP',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none
                ),
              ),
           )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
             Text(
                  'Le code est envoye au  C*****@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 18
                  ),
                ),
                 Text(
                  'Renvoyer le code dans 45 s',
                  style: TextStyle(
                  
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 18
                  ),
                ),    
                 ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Plus One'),
              icon: const Icon(Icons.plus_one),
            )
          ],
        )
      ,
        )
      ],

    );
  }
}


