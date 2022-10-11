import 'package:flutter/material.dart';

class inscription_v extends StatelessWidget {
  const inscription_v({Key? key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 104, 12),
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.only(right: 10),
                  shadowColor: Colors.transparent
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
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Text(
                  'Verication du code OTP',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
         const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Text('Le code est envoye au m****@gmail.com', style: TextStyle(fontSize: 18),),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Entrez le code',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Text('Renvoyer le code dans 45 s', style: TextStyle(fontSize: 18)),
        ),
        Container(
          width: 1000,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: const BoxDecoration(
              // borderRadius: Border.symmetric(),
              ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(
                  255, 191, 104, 12),
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0),
            ),
            onPressed: () {},
            child: const Text(
              'Creer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            ),
          )
        ),
                              
      ],
    );
  }
}
