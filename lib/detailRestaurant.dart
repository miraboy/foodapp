import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class detailRestaurant extends StatefulWidget {
  const detailRestaurant({Key? key});

  @override
  State<detailRestaurant> createState() => _detailRestaurantState();
}

class _detailRestaurantState extends State<detailRestaurant> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Accueil',
      style: optionStyle,
    ),
    Text(
      'Commandes',
      style: optionStyle,
    ),
    Text(
      'Messages',
      style: optionStyle,
    ),
    Text(
      'Profil',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var largeurEcran = MediaQuery.of(context).size.width;
    var hauteurEcran = MediaQuery.of(context).size.height;
    final bar = AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            shadowColor: Colors.transparent),
        onPressed: () {
          //Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ],
        ),
      ),
    );

    const labelResto = Text(
      'Carifood',
      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    );

    final hrLine = Container(
      width: largeurEcran - 40,
      height: 2,
      decoration: const BoxDecoration(color: Color.fromARGB(19, 60, 60, 60)),
      child: const Text('.'),
    );

    final card = Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: largeurEcran - 40,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  '4.8',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 191, 104, 12),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 191, 104, 12),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 191, 104, 12),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 191, 104, 12),
                    ),
                    Icon(
                      Icons.star_half,
                      color: Color.fromARGB(255, 191, 104, 12),
                    ),
                  ],
                ),
                const Text(
                  '(19 avis)',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Color.fromARGB(19, 60, 60, 60),
                          width: 1,
                          style: BorderStyle.solid,
                          strokeAlign: StrokeAlign.inside))),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        '5',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.topCenter,
                          width: (largeurEcran / 2) - 20,
                          child: const LinearProgressIndicator(
                            value: 0.9,
                            backgroundColor: Colors.grey,
                            color: Color.fromARGB(255, 191, 104, 12),
                            minHeight: 7,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '4',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.topCenter,
                          width: (largeurEcran / 2) - 20,
                          child: const LinearProgressIndicator(
                            value: 0.7,
                            backgroundColor: Colors.grey,
                            color: Color.fromARGB(255, 191, 104, 12),
                            minHeight: 7,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '3',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.topCenter,
                          width: (largeurEcran / 2) - 20,
                          child: const LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.grey,
                            color: Color.fromARGB(255, 191, 104, 12),
                            minHeight: 7,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '2',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.topCenter,
                          width: (largeurEcran / 2) - 20,
                          child: const LinearProgressIndicator(
                            value: 0.3,
                            backgroundColor: Colors.grey,
                            color: Color.fromARGB(255, 191, 104, 12),
                            minHeight: 7,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '1',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.topCenter,
                          width: (largeurEcran / 2) - 20,
                          child: const LinearProgressIndicator(
                            value: 0.1,
                            backgroundColor: Colors.grey,
                            color: Color.fromARGB(255, 191, 104, 12),
                            minHeight: 7,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ));

    final description = Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: Row(
          children: [
            SizedBox(
              width: largeurEcran - 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                      'Specialise dans les mets africains, Carifood est un restaurant situe a akassato qui vous offre unne vafriete de plats..'),
                  Text(
                    'Lire plus',
                    style: TextStyle(color: Color.fromARGB(255, 191, 104, 12)),
                  )
                ],
              ),
            )
          ],
        ));

    final program = Container(
      padding: const EdgeInsets.all(15),
      //width: largeurEcran * 0.65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Lundi-Vendredi : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Samedi : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '9h-18h',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '10h-15h',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );

    final maps = Column(
      children: [
        const Text(
          'Addresse,',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          children: const [
            Icon(Icons.location_on),
            Text(
              'Akassato, ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Abomey-calavi',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ],
        ),
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ],
    );

    final imgMaps = Container(
        width: largeurEcran,
        height: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/cartes.png"), fit: BoxFit.cover),
        ));

    final body = Container(
      // height: 700,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    labelResto,
                    hrLine,
                    card,
                  ],
                ),
              ),
              description,
              program,
              // maps
              imgMaps
            ],
          )
        ],
      ),
    );

    final all = SingleChildScrollView(
      //controller: controller,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [body],
      ),
    );

    return MaterialApp(
        title: "Detail du restaurant",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: bar,
          body: all,
          bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Accueil',
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_outlined), label: 'Commandes'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mail_outline), label: 'Messages'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.payment_outlined), label: 'Payement'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: 'Profil'),
              ],
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              selectedItemColor: const Color.fromARGB(255, 191, 104, 12),
              iconSize: 40,
              onTap: _onItemTapped,
              elevation: 5),
        ));
  }
}
