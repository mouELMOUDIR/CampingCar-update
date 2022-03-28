import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flu_base/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';




class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      TextField(
        decoration: InputDecoration(hintText: " Search location"),
      ),
      Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(31.630000, -8.008889), zoom: 16.0),
            zoomGesturesEnabled: true,
          ))
    ]));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}