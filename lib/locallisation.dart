import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class localisation extends StatefulWidget {
  const localisation({Key? key});

  @override
  State<localisation> createState() => _localisationState();
} 

class _localisationState extends State<localisation> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
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
            Text(
              'Votre position',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );

    final maps = Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      height: 450,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );

    const label = Text(
      'Position',
      style: TextStyle(
        fontSize: 18,
      ),
    );

    final labelLoc = Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 40,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white30,
          foregroundColor: Colors.black,
          shadowColor: Colors.black38,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'St Jean, Cotonou',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.location_on,
              ),
            ),
          ],
        ),
      ),
    );

    final btnContinuer = Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 1000,
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 191, 104, 12),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),
          onPressed: () async {},
          child: const Text(
            'Continuer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ));

    final all = SingleChildScrollView(
      //controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          maps,
          label,
          labelLoc,
          btnContinuer,
        ],
      ),
    );

    return MaterialApp(
      title: 'Localisation',
      home: Scaffold(appBar: bar, body: all),
    );
  }
}
