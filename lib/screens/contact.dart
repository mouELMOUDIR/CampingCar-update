import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flu_base/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ConatactPageState();
}

class _ConatactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.orange,
        body: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text("Contact",
          style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
          //Text("Nous avons toujours actif 24/24h"),
          Padding(padding:const EdgeInsets.symmetric(horizontal:16.0),
                  child: Column(children: <Widget>[
                    SizedBox(height: 16.0),
                    TextField(decoration: InputDecoration(
                      filled:true,
                      hintText: "Nom de l'emplacement",
                      fillColor: Colors.white,
                      border: InputBorder.none
                      ),),
                       SizedBox(height: 8.0),
                    TextField(decoration: InputDecoration(
                      filled:true,
                      fillColor: Colors.white,
                      hintText: "Votre email",
                      border: InputBorder.none),),
                       SizedBox(height: 8.0),
                      TextField(
                      maxLines: 7,
                      decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled:true,
                      hintText: "Message",
                      border: InputBorder.none),),
                      SizedBox(height:8.0),
                      MaterialButton(
                        height: 60.0,
                        minWidth: double.infinity,
                        color: Colors.black,
                        onPressed: (){},
                        child: Text("S U B M I T",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      )
                  ]),),
          
        ],)),
    );
  }
        
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
  }

