import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'connexion.dart';
import 'inscription_v.dart';
import 'main.dart';
// import 'inscription_v.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

class Inscriptio extends StatelessWidget {
  const Inscriptio({Key? key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final bar = AppBar(
      backgroundColor: Color.fromARGB(255, 191, 104, 12),
      shadowColor: Colors.transparent,
      title: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.all(0.0),
            shadowColor: Colors.transparent),
        onPressed: () {
          //Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );
        },
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
    );

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: bar,
        body: MyCustomForm(
          title: title,
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key, required String title});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  late User currentUser;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Map data = {};

    final avatar = Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(150),
          image: const DecorationImage(
              image: AssetImage("images/a.jpg"), fit: BoxFit.cover)),
    );

    final text_title = Container(
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
    );

    final icon_groupe = Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Image(
                image: AssetImage(
              'images/google.png',
            )),
          ),
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Image(
                image: AssetImage(
              'images/facebook.png',
            )),
          )
        ],
      ),
    );

    final champ_nom = Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Nom',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Entrez une valeur dans le champ nom";
            }
            data['nom'] = value;
            return null;
          },
        ),
      ),
    );

    final champ_email = Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Email',
          ),
          validator: (value) {
            EmailValidator.validate(value!);

            if (value == null || value.isEmpty) {
              return "Entrez une valeur dans le champ email";
            } else if (!EmailValidator.validate(value)) {
              return "Entrez un email valide";
            }
            data['email'] = value;
            return null;
          },
        ),
      ),
    );

    final champ_mdp = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Mot de passe',
        ),
        validator: (value) {
          EmailValidator.validate(value!);
          if (value == null || value.isEmpty) {
            //erreur.add("Entrez une valeur  dans le champ mot  de passe");
            return "Entrez une valeur  dans le champ mot  de passe";
          } else if (value.length < 6) {
            //erreur.add("Entrez un mote de passe d'au moins 6 caractères");
            return "Entrez un mote de passe d'au moins 6 caractères";
          } else if (value.length >= 25) {
            //erreur.add("Entrez un mot de passe de moins de 25 caractères");
            return "Entrez un mot de passe de moins de 25 caractères";
          } else if (!value.contains(RegExp(r'[A-Z]'))) {
            //erreur.add("Entrez un mot de passe contenant au moins une majuscule");
            return "Le mot de passe doit contenir au moins une majuscule";
          } else if (!value.contains(RegExp(r'[0-9]'))) {
            //erreur.add("Entrez un mot de passe contenant au moins un chiffre");
            return "Le mot de passe doit contenir au moins un chiffre";
          } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            //erreur.add("Entrez un mot de passe contenant au moins un caractère spécial");
            return "Le mot de passe doit contenir au moins un caractère spécial";
          }
          data['mdp'] = value;
          return null;
        },
      ),
    );

    final bouton_creer = Container(
        width: 1000,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            // borderRadius: Border.symmetric(),
            ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 191, 104, 12),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              // auth.authStateChanges().listen((User? user) {
              //   if (user == null) {
              //     print("N'est pas connecte!");
              //   } else {
              //     print('User is signed in!');
              //   }
              // });

              //inscription
              // try {
              //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              //     email: data['email'],
              //     password: data['mdp'],
              //   );
              // } on FirebaseAuthException catch (e) {
              //   if (e.code == 'weak-password') {
              //     print('The password provided is too weak.');
              //   } else if (e.code == 'email-already-in-use') {
              //     print('The account already exists for that email.');
              //   }
              // } catch (e) {
              //   print(e);
              // }

              //connexion
              // try {
              //   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              //     email: 'mirabelbarryl@gmail.com',
              //     password: 'Mirabel@1',
              //   );
              // } on FirebaseAuthException catch (e) {
              //   if (e.code == 'user-not-found') {
              //     print('No user found for that email.');
              //   } else if (e.code == 'wrong-password') {
              //     print('Wrong password provided for that user.');
              //   }
              // }
              // final userC = signInWithGoogle();
              // auth.idTokenChanges().listen((User? user) async {
              //   if (user == null) {
              //     print('User is currently signed out!');
              //   } else {
              //     await FirebaseAuth.instance.setLanguageCode("fr");
              //     await user.sendEmailVerification();

              //     print('User is signed in!');
              //   }
              // });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const inscription_v()),
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
        ));

    final text_lien = Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                    builder: (context) => const connexion(
                          title: 'connexion',
                        )),
              );
            },
            child: const Text(
              "Se Connecter",
              style: TextStyle(
                color: Color.fromARGB(255, 191, 104, 12),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );

    final logo = Container(
        padding: const EdgeInsets.all(15),
        width: 75,
        child: const Image(
          image: AssetImage('images/plat_icon.png'),
          fit: BoxFit.fill,
        ));

    final formulaire = Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          champ_nom,
          champ_email,
          champ_mdp,
          bouton_creer,
          text_lien,
          logo
        ],
      ),
    );

    final box_white = Container(
      width: 10000,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          icon_groupe,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: formulaire,
          )
        ],
      ),
    );

    final box_blue = Container(
      padding: const EdgeInsets.only(top: 17),
      width: 10000,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 1, 25, 77),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          text_title,
          box_white,
        ],
      ),
    );

    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 191, 104, 12),
      ),
      child: SingleChildScrollView(
        //controller: controller,
        child: Column(
          children: [
            avatar,
            box_blue,
          ],
        ),
      ),
    );
  }
}
