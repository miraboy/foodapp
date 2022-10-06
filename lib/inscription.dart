import 'package:flutter/material.dart';
import 'connexion.dart';
import 'main.dart';
import 'package:email_validator/email_validator.dart';
import 'inscription_v.dart';

class Inscriptio extends StatelessWidget {
  const Inscriptio({super.key, required String title});
  @override
  Widget build(BuildContext context) {
    const appTitle = 'INSCRIPTION';
 
    return const MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: MyCustomForm(
          title: 'home',
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key, required String title});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 191, 104, 12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(0.0),
                ),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const connexion(
                              title: 'connexion',
                            )),
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(150),
                image: const DecorationImage(
                    image: AssetImage("images/a.jpg"), fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            width: 10000,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 1, 25, 77),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: const Center(
                    child: Text(
                      'Creer un compte',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
                Container(
                  width: 10000,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Image(
                                  image: AssetImage(
                                'images/google.png',
                              )),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Image(
                                  image: AssetImage(
                                'images/facebook.png',
                              )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Nom',
                                      label: Text('Nom'),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Entrez une valeur';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Email',
                                      label: Text('Email'),
                                    ),
                                    validator: (value) {
                                      EmailValidator.validate(value!);

                                      if (value == null || value.isEmpty) {
                                        return 'Entrez une valeur';
                                      }
                                      if (!EmailValidator.validate(value)) {
                                        return 'Email invalide';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Mot de passe',
                                    label: Text('Mot de passe'),
                                  ),
                                  validator: (value) {
                                    EmailValidator.validate(value!);
                                    if (value == null || value.isEmpty) {
                                      return 'Entrez une valeur';
                                    }

                                    if (value.length < 6) {
                                      return 'Mot de pass trop court';
                                    }
                                    if (value.length >= 25) {
                                      return 'Mot de pass trop long';
                                    }
                                    if (!value.contains(new RegExp(r'[A-Z]'))) {
                                      return "Le mot de passe doit contenir au moins une majuscule";
                                    }
                                    if (!value.contains(new RegExp(r'[0-9]'))) {
                                      return "Le mot de passe doit contenir au moins un chiffre";
                                    }
                                    if (!value.contains(
                                        RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                      return "Le mot de passe doit contenir au moins un caractère spécial";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                  width: 1000,
                                  margin: const EdgeInsets.all(10),
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
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const inscription_v()),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Creer',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, right: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("J'ai un compte. ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            decoration: TextDecoration.none)),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const connexion(
                                                    title: 'connexion',
                                                  )),
                                        );
                                      },
                                      child: const Text(
                                        "Se Connecter",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 191, 104, 12),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(15),
                                  width: 75,
                                  child: const Image(
                                    image: AssetImage('images/plat_icon.png'),
                                    fit: BoxFit.fill,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}
