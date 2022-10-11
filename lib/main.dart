import 'package:flutter/material.dart';
import 'connexion.dart';
import 'inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FOODAPP',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 191, 104, 12),
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double height05 = height * 0.4967;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/eat.png"), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 1, 25, 77),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30), bottom: Radius.circular(0))),
                width: 10000.0,
                margin: EdgeInsets.only(top: height05),
                child: Center(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              width: 70,
                              child: const Image(
                                image: AssetImage('images/plat_icon.png'),
                                fit: BoxFit.fill,
                              )),
                          const Text(
                            "Votre plat est là !!!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              width: 60,
                              child: const Image(
                                image: AssetImage('images/loc_icon.png'),
                                fit: BoxFit.fill,
                              )),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Bienvenue sur ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none)),
                                Text(
                                  "FoodBenin",
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 191, 104, 12),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Inscriptio(
                                      title: 'INSCRIPTION',
                                    )),
                          );
                        },
                        child: const Text('Créer un compte',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(bottom: 43),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("J'ai un compte. ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                )), // The GestureDetector wraps the button.
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const connexion(
                                            title: 'connexion',
                                          )),
                                );
                              },
                              child: Container(
                                child: const Text(
                                  'Se connecter ici',
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 191, 104, 12),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
//------
