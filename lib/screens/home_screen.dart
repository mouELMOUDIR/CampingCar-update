import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flu_base/screens/Profile.dart';
import 'package:flu_base/screens/contact.dart';
import 'package:flu_base/screens/infosVilles.dart';
import 'package:flu_base/screens/login_screen.dart';
import 'package:flu_base/screens/map_selection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Caravane',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController ville = TextEditingController();

  final List PlaceList = [
    {
      'place': 'Marrakech',
      'distance': 20,
      'review': 36,
      'picture': 'images/marrakech.jpg',
      'Nmbre de park': '7',
    },
    {
      'place': 'Casablanca',
      'distance': 20,
      'review': 36,
      'picture': 'images/casa.jpg',
      'Nmbre de park': '4',
    },
    {
      'place': 'Essaouira',
      'distance': 20,
      'review': 36,
      'picture': 'images/essaouira.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Rabat',
      'distance': 20,
      'review': 36,
      'picture': 'images/rabat.jpg',
      'Nmbre de park': '3',
    },
    {
      'place': 'Tanger',
      'distance': 20,
      'review': 36,
      'picture': 'images/tanger.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Agadir',
      'distance': 20,
      'review': 36,
      'picture': 'images/agadir.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Fes',
      'distance': 20,
      'review': 36,
      'picture': 'images/fes.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Mekens',
      'distance': 20,
      'review': 36,
      'picture': 'images/meknes.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Ifrane',
      'distance': 20,
      'review': 36,
      'picture': 'images/ifrane.jpg',
      'Nmbre de park': '5',
    }
  ];

  List<dynamic> finder(String a) {
    List resp = <dynamic>[];
    for (int i = 0; i < PlaceList.length; i++) {
      if (PlaceList[i]['place'].toLowerCase().contains(a.toLowerCase()))
        resp.add(PlaceList[i]);
    }

    return resp;
  }

  @override
  Widget build(BuildContext context) {
    var wdgt = finder(ville.text).map((Place) {
      return PlaceCard(Place);
    }).toList();

    return Scaffold(
      appBar: Myappbar(),
      // (title : Text('My caravane'),
      // backgroundColor: Color.fromARGB(255, 233, 122, 114),
      // ),
      backgroundColor: Colors.white,
      // body: Center(child: Image
      // (image:AssetImage('images/my_caravane.jpg')),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
              child: Column(children: [
                Row(children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            // color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: ville,
                        decoration: InputDecoration(
                          hintText: 'Marrakech',
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          //  color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          wdgt = finder(ville.text).map((Place) {
                            return PlaceCard(Place);
                          }).toList();
                        });
                      },
                      child: Icon(
                        Icons.search,
                        size: 26,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        primary: Color.fromARGB(255, 60, 132, 214),
                      ),
                    ),
                  ),
                ]),
                // SizedBox(height: 50),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.all(10),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //         Text('Choisir la date',
                //         style: GoogleFonts.nunito(
                //           color:Colors.grey,
                //           fontSize:15,
                //         ),
                //         ),
                //         SizedBox(height: 8),
                //         Text('20 Mars - 28 mars',
                //         style: GoogleFonts.nunito(
                //         color:Colors.black,
                //         fontSize:17,
                //         ),
                //         ),
                //       ],

                //       ),
                //     ),
                //     Container(
                //       margin: EdgeInsets.all(10),
                //       child: Column(
                //         children: [
                //         Text(' Genre du caravane ',
                //         style: GoogleFonts.nunito(
                //           color: Colors.grey,
                //           fontSize : 15
                //         ),
                //         ),
                //         Text('Moyenne - 2 personnes',
                //         style: GoogleFonts.nunito(
                //         color: Colors.black,
                //         fontSize : 17
                //         ),
                //       ),
                //     ],
                //       ),
                //     )

                //   ],

                // )
              ]),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  //   Container(
                  //     // color: Colors.red,
                  //     height: 50,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text('22 places trouvés',
                  //             style: GoogleFonts.nunito(
                  //             color: Colors.black,
                  //             fontSize : 15,
                  //           ),
                  //         ),

                  //       ],//children inside
                  //       ),
                  //   ),
                  Column(
                    children: wdgt,

                    // children: PlaceList.map((Place) {
                    //   return PlaceCard(Place);
                    // }).toList(),
                  ),
                ], //big children
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Myappbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  Widget build(BuildContext context) {
    return AppBar(
// App Bar : botton de profile
      leading: IconButton(
        icon: Icon(
          Icons.person,
          color: Colors.black,
          size: 20,
        ),
        
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserSection()));
        },
      ),
        
      title: Text('Acceuil',
          style: GoogleFonts.nunito(
           color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          )),
//AppBar: Favoris et location
      actions: [
// botton favoris
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {},
        ),
//botton location (place)
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.contact_phone,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ContactPage()));
          },
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

//bar de recherche
class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(children: [
        Row(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    // color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Marrakech',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 50,
            width: 50,
            // color: Colors.red,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  //  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.search,
                size: 26,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                primary: Color.fromARGB(255, 255, 145, 137),
              ),
            ),
          ),
        ]),
        // SizedBox(height: 50),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //       margin: EdgeInsets.all(10),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //         Text('Choisir la date',
        //         style: GoogleFonts.nunito(
        //           color:Colors.grey,
        //           fontSize:15,
        //         ),
        //         ),
        //         SizedBox(height: 8),
        //         Text('20 Mars - 28 mars',
        //         style: GoogleFonts.nunito(
        //         color:Colors.black,
        //         fontSize:17,
        //         ),
        //         ),
        //       ],

        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.all(10),
        //       child: Column(
        //         children: [
        //         Text(' Genre du caravane ',
        //         style: GoogleFonts.nunito(
        //           color: Colors.grey,
        //           fontSize : 15
        //         ),
        //         ),
        //         Text('Moyenne - 2 personnes',
        //         style: GoogleFonts.nunito(
        //         color: Colors.black,
        //         fontSize : 17
        //         ),
        //       ),
        //     ],
        //       ),
        //     )

        //   ],

        // )
      ]),
    );
  }
}

class PlaceSection extends StatelessWidget {
  final List PlaceList = [
    {
      'place': 'Marrakech',
      'distance': 20,
      'review': 36,
      'picture': 'images/marrakech.jpg',
      'Nmbre de park': '7',
    },
    {
      'place': 'Casablanca',
      'distance': 20,
      'review': 36,
      'picture': 'images/casa.jpg',
      'Nmbre de park': '4',
    },
    {
      'place': 'Essaouira',
      'distance': 20,
      'review': 36,
      'picture': 'images/essaouira.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Rabat',
      'distance': 20,
      'review': 36,
      'picture': 'images/rabat.jpg',
      'Nmbre de park': '3',
    },
    {
      'place': 'Tanger',
      'distance': 20,
      'review': 36,
      'picture': 'images/tanger.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Agadir',
      'distance': 20,
      'review': 36,
      'picture': 'images/agadir.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Fes',
      'distance': 20,
      'review': 36,
      'picture': 'images/fes.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Mekens',
      'distance': 20,
      'review': 36,
      'picture': 'images/meknes.jpg',
      'Nmbre de park': '5',
    },
    {
      'place': 'Ifrane',
      'distance': 20,
      'review': 36,
      'picture': 'images/ifrane.jpg',
      'Nmbre de park': '5',
    }
  ];
  List<dynamic> finder(String a) {
    List resp = <dynamic>[];
    for (int i = 0; i < PlaceList.length; i++) {
      if (PlaceList[i]['place'].contains(a)) resp.add(PlaceList[i]);
    }

    return resp;
  }

  @override
  Widget build(BuildContext context) {
    print(finder('Marr'));

    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          // Container(
          //   // color: Colors.red,
          //   height: 50,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text('22 places trouvés',
          //           style: GoogleFonts.nunito(
          //           color: Colors.black,
          //           fontSize : 15,
          //         ),
          //       ),
          //     // Row(
          //     //   children: [
          //     //     Text('Filtres',
          //     //       style: GoogleFonts.nunito(
          //     //       color: Colors.black,
          //     //       fontSize : 15,
          //     //      ),
          //     //     ),
          //     //     IconButton(
          //     //        icon: Icon(
          //     //          Icons.filter_list_outlined,
          //     //          color: Color.fromARGB(255, 248, 143, 136),
          //     //          size: 25,
          //     //        ),
          //     //        onPressed: null,
          //     //       ),
          //     //   ],//inside the inside children
          //     //   ),

          //     ],//children inside
          //     ),
          // ),
          Column(
            children: PlaceList.map((Place) {
              return PlaceCard(Place);
            }).toList(),

            // children: PlaceList.map((Place) {
            //   return PlaceCard(Place);
            // }).toList(),
          ),
        ], //big children
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Map placeData;
  PlaceCard(this.placeData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ] //box Shadow
          ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(
                  placeData['picture'],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Color.fromARGB(255, 248, 134, 126),
                      size: 20,
                    ),
                  ),
                ),
              ], //children 2
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  placeData['place'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 150,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VillesSection()));
                      },
                      child: Text('Trouvez',
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ))),
                ),
                // Text(
                //   'Pk : '+placeData['Nmbre de park'],
                //   style: GoogleFonts.nunito(
                //     fontSize : 18,
                //     fontWeight: FontWeight.w800,
                //   )
                // ),
              ],
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,

          //   children: [
          //     SizedBox(
          //       height: 30,
          //       width: 100,
          //       child: FlatButton( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //         color: Color.fromARGB(255, 250, 135, 126),
          //         onPressed: () {},
          //         child: Text('Trouvez',
          //          style: GoogleFonts.nunito(
          //           fontSize : 18,
          //           fontWeight: FontWeight.w800,
          //         ))),
          //     ),
          //   ],
          // )

          //  Row(
          //     children: [
          //       Text('Choisir votre place',
          //         style: GoogleFonts.nunito(
          //         color: Colors.black,
          //         fontSize : 15,
          //        ),
          //       ),
          //       IconButton(
          //          icon: Icon(
          //            Icons.abc_outlined,
          //            color: Color.fromARGB(255, 248, 143, 136),
          //            size: 25,
          //          ),
          //          onPressed: null,
          //         ),
          //     ],//inside the inside children

          // //     ),
          // bare de recherche *******************************
          //  SizedBox(width: 10),
          //        Container(
          //         height: 50,
          //         width: 50,
          //         // color: Colors.red,
          //         decoration: BoxDecoration(
          //         boxShadow:[ BoxShadow(
          //           //  color: Colors.grey,
          //            blurRadius: 4,
          //            offset: Offset(0,4),
          //           ),
          //         ],
          //         borderRadius: BorderRadius.all(Radius.circular(25)),
          //       ),
          //         child: ElevatedButton(onPressed: (){},

          //           child: Icon(

          //             Icons.search,
          //             size:26,
          //           ),
          //             style: ElevatedButton.styleFrom(
          //             //shape: CircleBorder(),
          //             padding: EdgeInsets.all(10),
          //             primary: Color.fromARGB(255, 255, 145, 137),
          //           ),
          //         ),
          //     ),

          //**************************************************** */
          // Container(
          //   child: Container(
          //     //onPressed: (){},
          //     // color: Color.fromARGB(255, 246, 145, 138),

          //     padding: EdgeInsets.only(left:150),
          //     decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 248, 145, 138),
          //       borderRadius: BorderRadius.circular(15),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Color.fromARGB(255, 189, 188, 188),
          //           spreadRadius: 1,
          //           blurRadius:8,
          //           offset: Offset(1,3),

          //         )
          //       ]

          //      ),

          //      child : Center(
          //        child: Text('Choisir votre PK ',
          //        style: TextStyle(
          //          color: Colors.white,
          //          fontWeight: FontWeight.bold,
          //          fontSize: 20,
          //           ),

          //        ),
          //        )

          //   ),
          // )
        ],
        //children
      ),
    );
  }
}
