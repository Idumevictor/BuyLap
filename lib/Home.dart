import 'dart:math';

import 'package:buylap/new_product.dart';
import 'package:buylap/size_config.dart';
import 'package:buylap/splash_screen.dart';
import 'package:buylap/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import 'create.dart';

class Home extends StatefulWidget {
  final String id;

  Home({required this.id});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProduct()));
                }),
          ],
          title: Center(
            child: Text(
              'Available Products',
              style: TextStyle(color: Colors.black),
              selectionColor: Colors.black,
            ),
          ),
          backgroundColor: Color(0xfffec619),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xfffec619),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SplashScreen())));
          },
          child: Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection(widget.id).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else {
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    String price = data['price'];
                    double _myBalance = double.parse(price);
                    String _newBalance =
                        NumberFormat.currency(symbol: '₦').format(_myBalance);

                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(15),
                        horizontal: getProportionateScreenWidth(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(10),
                        vertical: getProportionateScreenWidth(10),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: getProportionateScreenWidth(70),
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        NetworkImage(data['image']),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Text(
                                    _newBalance,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Name: ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['product_name'],
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(8),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Model: ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['product_model'],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(8),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'description: ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['description'],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateProduct(
                                              description: data['description'],
                                              image: data['image'],
                                              model: data['product_model'],
                                              name: data['product_name'],
                                              taskId: data['id'],
                                              price: data['price'])));
                                },
                                icon: Icon(
                                  Icons.edit_note,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final user =
                                      FirebaseAuth.instance.currentUser!;
                                  String taskId = data['id'];
                                  await FirebaseFirestore.instance
                                      .collection(user.uid)
                                      .doc(taskId)
                                      .delete();

                                  successSnackBar(
                                      context: context,
                                      message: 'lapto deleted successfully');
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                );
              }
            })

        //  StreamBuilder(
        //     stream: FirebaseFirestore.instance.collection(widget.id).snapshots(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(
        //           child: CircularProgressIndicator(
        //             color: Colors.white,
        //           ),
        //         );
        //       } else if (snapshot.hasData) {
        //         final data = snapshot.data!;
        //         return ListView.builder(
        //             itemCount: data.docs.length,
        //             itemBuilder: (context, index) {
        //               print(index);
        //               var item = (data.docs[index].data() as Map);
        //               var image = item['image'];
        //               var name = item['product_name'];
        //               var desc = item['description'];
        //               var model = item['product_model'];
        //               var amount = item['price'];

        //               double _myBalance = double.parse(amount);
        //               String _newBalance =
        //                   NumberFormat.currency(symbol: '₦').format(_myBalance);

        //               return
        // Container(
        //                 padding:
        //                     EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //                 margin:
        //                     EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //                 decoration: BoxDecoration(
        //                   color: Color(0xfffec619),
        //                 ),
        //                 child: Row(
        //                   children: [
        //                     Expanded(
        //                       child: Column(
        //                         children: [
        //                           CircleAvatar(
        //                             radius: 40,
        //                             backgroundColor: Colors.white,
        //                             backgroundImage: NetworkImage(image),
        //                           ),
        //                           SizedBox(
        //                             height: getProportionateScreenHeight(10),
        //                           ),
        //                           Text(
        //                             _newBalance,
        //                             style: TextStyle(
        //                                 color: Colors.black,
        //                                 fontWeight: FontWeight.bold,
        //                                 fontSize: 20),
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       width: getProportionateScreenWidth(20),
        //                     ),
        //                     Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                       children: [
        //                         infoRow(title: 'Name', value: name),
        //                         SizedBox(
        //                           height: getProportionateScreenHeight(10),
        //                         ),
        //                         infoRow(title: 'model', value: model),
        //                         SizedBox(
        //                           height: getProportionateScreenHeight(10),
        //                         ),
        //                         infoRow(title: 'description', value: desc),
        //                         SizedBox(
        //                           height: getProportionateScreenHeight(10),
        //                         ),
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.end,
        //                           children: [
        //                             GestureDetector(
        //                               onTap: () {},
        //                               child: Icon(
        //                                 Icons.edit_document,
        //                                 size: 18,
        //                                 color: Colors.black,
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               width: getProportionateScreenWidth(35),
        //                             ),
        //                             GestureDetector(
        //                               onTap: () async {
        //                                 await FirebaseFirestore.instance
        //                                     .collection(widget.id)
        //                                     .doc(widget.id)
        //                                     .delete();
        //                               },
        //                               child: Icon(
        //                                 Icons.delete,
        //                                 size: 18,
        //                                 color: Colors.black,
        //                               ),
        //                             )
        //                           ],
        //                         )
        //                       ],
        //                     )
        //                   ],
        //                 ),
        //               );
        //             });
        //       } else {
        //         return Container(
        //           color: Colors.black,
        //           width: double.infinity,
        //           height: 300,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'No Product Yet',
        //                 style: TextStyle(fontSize: 30, color: Colors.blue),
        //               ),
        //               IconButton(
        //                 onPressed: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => const AddProduct()));
        //                 },
        //                 icon: const Icon(
        //                   Icons.add_circle_outline,
        //                   size: 50,
        //                   color: Colors.blue,
        //                 ),
        //               )
        //             ],
        //           ),
        //         );
        //       }
        //     }),
        );
  }

  Row infoRow({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          '${title.toUpperCase()} : ',
          style: TextStyle(color: Colors.black),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
