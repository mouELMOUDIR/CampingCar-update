import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flu_base/screens/contact.dart';
import 'package:flu_base/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flu_base/screens/home_screen.dart';
import 'package:flu_base/screens/login_screen.dart';
import 'package:flu_base/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSection extends StatelessWidget {
  const UserSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User",
      home: _Profilpage(),
    );
  }
}

class _Profilpage extends StatefulWidget {
  @override
  State<_Profilpage> createState() => _ProfilpageState();
}

class _ProfilpageState extends State<_Profilpage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel LoggedInUser = UserModel();

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.LoggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  bool showPassword = false;
  final String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
        ),

        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {})
        ], //action
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 20, right: 15),
        child: ListView(
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/profile.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        color: Color.fromARGB(255, 240, 169, 163),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            buildTextField('Nom ', '${LoggedInUser.lname}', true),
            buildTextField('Prenom ', '${LoggedInUser.fname}', true),
            buildTextField('E-mail ', '${LoggedInUser.email}', true),
            // buildTextField('Mot de passe ', '******',true),
            SizedBox(
              height: 35,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Center(
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Deconnexion", 
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)
                              
                             ),
                  //           ActionChip(
                  //label: Text("LogOut"),
                  //onPressed: () {
                  //logout(context);
                  //})
                ),
              ),
            ]),
          ],
          // children
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }, //onpressed

                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
