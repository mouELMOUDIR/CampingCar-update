import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flu_base/screens/product_item.dart';
import 'package:flu_base/screens/product_page.dart';
import 'package:flu_base/utils/constants.dart';
import 'package:flu_base/utils/widget_functions.dart';

const PRODUCT_DATA = [
  {"image": "marakech1.jpg", "name": "Le Relais", "rest": "Maritine Star", "rating": "4.5 (164)", "price": 20, "currency": "\$"},
  {"image": "marakech2.jpg", "name": "ZONE2", "rest": "Maritine Star", "rating": "4.7 (199)", "price": 10, "currency": "\$"},
  {"image": "marakech3.jpg", "name": "ZONE3", "rest": "Maritine Star", "rating": "4.2 (101)", "price": 10, "currency": "\$"},
  {"image": "marakech4.jpg", "name": "ZONE4", "rest": "Maritine Star", "rating": "3.9 (150)", "price": 15, "currency": "\$"},
];

class VillesSection extends StatefulWidget {
  const VillesSection({Key? key}) : super(key: key);

  @override
  _VillesSectionState createState() => _VillesSectionState();
}

class _VillesSectionState extends State<VillesSection> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset("images/marrakech.jpg"),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.white,
                                        ),
                                        ),
                                    addHorizontalSpace(20),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    width: constraints.maxWidth,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              addHorizontalSpace(constraints.maxWidth * 0.35),
                              Row(
                                children: [
                                
                                ],
                              ),
                              addHorizontalSpace(10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(
                                  children: PRODUCT_DATA
                                      .map((data) => InkWell(
                                            onTap: () {
                                              _focusNode.unfocus();
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(productData: data)));
                                            },
                                            child: ProductItem(
                                              width: constraints.maxWidth * 0.50,
                                              productData: data,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


