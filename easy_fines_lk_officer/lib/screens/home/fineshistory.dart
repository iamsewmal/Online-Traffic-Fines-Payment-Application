import 'package:easy_fines_lk_officer/models/fine_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:easy_fines_lk_officer/models/user.dart';

// class FinesHistory extends StatefulWidget {
//   @override
//   _FinesHistoryState createState() => _FinesHistoryState();
// }

// class _FinesHistoryState extends State<FinesHistory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(),
//     );
//   }
// }

class FinesHistory extends StatefulWidget {
  FinesHistory() : super();

  //final String appTitle = "Book DB";

  @override
  _FinesHistoryState createState() => _FinesHistoryState();
}

class _FinesHistoryState extends State<FinesHistory> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  TextEditingController courtDateController = TextEditingController();
  TextEditingController fineNumberController = TextEditingController();
  TextEditingController issuedByController = TextEditingController();
  TextEditingController issuedDateController = TextEditingController();
  TextEditingController offenceController = TextEditingController();
  TextEditingController policeStationController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController validUntillController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController licenceNumberController = TextEditingController();
 

  // bool isEditing = false;
  // bool textFieldVisibility = false;

  String firestoreCollectionName = "Fines";

  FineCard currentFine;

  getAllFines() {
    return Firestore.instance.collection(firestoreCollectionName).snapshots();
 } 

  // addFine() async {
  //   FineCard fineCard = FineCard(
  //       category: categoryController.text,
  //       court: courtController.text,
  //       courtDate: courtDateController.text,
  //       fineNumber: fineNumberController.text,
  //       issuedBy: issuedByController.text,
  //       issuedDate: issuedDateController.text,
  //       offence: offenceController.text,
  //       policeStation: policeStationController.text,
  //       status: statusController.text,
  //       totalAmount: totalAmountController.text,
  //       validUntill: validUntillController.text,
  //       vehicleNumber: vehicleNumberController.text,
  //       licenceNumber: licenceNumberController.text
  //        );

  //   try {
  //     Firestore.instance.runTransaction((Transaction transaction) async {
  //       await Firestore.instance
  //           .collection(firestoreCollectionName)
  //           .document()
  //           .setData(FineCard.toJson());
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  updateFine(
      FineCard fineCard,
      String category,
      String court,
      String courtDate,
      String fineNumber,
      String issuedBy,
      String issuedDate,
      String offence,
      String policeStation,
      String status,
      String totalAmount,
      String validUntill,
      String vehicleNumber,
      String licenceNumber
      ) {
    try {
      Firestore.instance.runTransaction((Transaction transaction) async {
        await transaction.update(fineCard.documentReference, {
          'fineNumber': fineNumber,
          'category': category,
          'court': court,
          'courtDate': courtDate,
          'issuedBy': issuedBy,
          'issuedDate': issuedDate,
          'offence': offence,
          'policeStation': policeStation,
          'status': status,
          'totalAmount': totalAmount,
          'validUntill': validUntill,
          'vehicleNumber': vehicleNumber,
          'licenceNumber': licenceNumber,
          
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // updateIfEditing() {
  //   if (isEditing) {
  //     updateFine(
  //         currentFine,
  //         categoryController.text,
  //         courtController.text,
  //         courtDateController.text,
  //         fineNumberController.text,
  //         issuedByController.text,
  //         issuedDateController.text,
  //         offenceController.text,
  //         policeStationController.text,
  //         statusController.text,
  //         totalAmountController.text,
  //         validUntillController.text,
  //         vehicleNumberController.text,
  //         licenceNumberController.text
  //          );

  //     setState(() {
  //       isEditing = false;
  //     });
  //   }
  // }

  // deleteBook(Book book) {
  //   Firestore.instance.runTransaction((Transaction transaction) async {
  //     await transaction.delete(book.documentreference);
  //   });
  // }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getAllFines(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print("Documents -> ${snapshot.data.documents.length}");
          return buildList(context, snapshot.data.documents);
        }
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => listItemBuild(context, data)).toList(),
    );
  }

  Widget listItemBuild(BuildContext context, DocumentSnapshot data) {
    final fineCard = FineCard.fromSnapshot(data);

    return Padding(
      //key: ValueKey(fineCard.licenceNumber),
      padding: const EdgeInsets.only(top: 4.0),
      child: Card(
        elevation: 5.0,
        color: Colors.blue[200],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      alignment: Alignment(-1.0, 1.0),
                      child: Text("Fine No: " + fineCard.fineNumber)),
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment(-1.0, 1.0),
                        child: Text("Status : "),
                      ),
                      Container(
                        alignment: Alignment(-1.0, 1.0),
                        child: Text(
                          fineCard.status,
                          style: TextStyle(
                              backgroundColor: Colors.red, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment(-1.0, 1.0),
                          child: Text("Issued date : " + fineCard.issuedDate)),
                      Row(
                        children: <Widget>[
                          Container(child: Text("Valid untill   : ")),
                          Container(
                              child: Text(
                            fineCard.validUntill,
                            style: TextStyle(color: Colors.red),
                          )),
                        ],
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          padding: EdgeInsets.all(10.0),
                          color: Colors.red,
                          child: Column(
                            children: <Widget>[
                              Text("13 Days"),
                              Text("10: 25: 58Hrs"),
                            ],
                          )))
                ],
              ),
              Container(
                child: Container(
                    alignment: Alignment(-1.0, 1.0),
                    child: Text("Offence : " + fineCard.offence)),
              ),
              Container(
                child: Container(
                    alignment: Alignment(-1.0, 1.0),
                    child: Text("Police Station : " + fineCard.policeStation)),
              ),
              Container(
                child: Container(
                    alignment: Alignment(-1.0, 1.0),
                    child: Text(
                        "Driver's licence No. : " + fineCard.licenceNumber)),
              ),
              Container(
                child: Container(
                    alignment: Alignment(-1.0, 1.0),
                    child: Text("Court : " + fineCard.court)),
              ),
              Container(
                child: Container(
                    alignment: Alignment(-1.0, 1.0),
                    child: Text("Court date : " + fineCard.courtDate)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Container(
                        alignment: Alignment(-1.0, 1.0),
                        child: Text("Vehicle no : " + fineCard.vehicleNumber)),
                  ),
                  Container(
                    child: Container(
                        alignment: Alignment(-1.0, 1.0),
                        child: Text("Category : " + fineCard.category)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Container(
                        alignment: Alignment(-1.0, 1.0),
                        child:
                            Text("Total Amount: RS." + fineCard.totalAmount)),
                  ),
                  // RaisedButton(
                  //   child: Text(
                  //     "Pay",
                  //     style: TextStyle(
                  //         color: Colors.white, fontWeight: FontWeight.bold),
                  //   ),
                  //   onPressed: () {},
                  //   color: Colors.blue[800],
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // setUpdateUI(Book book) {
  //   bookNameController.text = book.bookName;
  //   bookAuthorController.text = book.authorName;

  //   setState(() {
  //     textFieldVisibility = true;
  //     isEditing = true;
  //     currentFine = book;
  //   });
  // }

  // button() {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: OutlineButton(
  //         child: Text(isEditing ? "UPDATE" : "ADD"),
  //         onPressed: () {
  //           if (isEditing == true) {
  //             updateIfEditing();
  //           } else {
  //             addFine();
  //           }
  //           setState(() {
  //             textFieldVisibility = false;
  //           });
  //         }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   //child: buildBody(context),
      //   //child:Icon(Icons.directions_car),
      // ),
       body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Card(
              elevation: 5.0,
              color: Colors.blue[200],
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            alignment: Alignment(-1.0, 1.0),
                            child: Text("Fine No: " + "00002")),
                        Row(
                          children: <Widget>[
                            Container(
                                alignment: Alignment(-1.0, 1.0),
                                child: Text("Status : ")),
                            Container(
                                alignment: Alignment(-1.0, 1.0),
                                child: Text(
                                  "Not paid",
                                  style: TextStyle(
                                      backgroundColor: Colors.red,
                                      color: Colors.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment(-1.0, 1.0),
                                child: Text("Issued date : " + "dd/mm/yyyy")),
                            Row(
                              children: <Widget>[
                                Container(child: Text("Valid untill   : ")),
                                Container(
                                    child: Text(
                                  "dd/mm/yyyy",
                                  style: TextStyle(color: Colors.red),
                                )),
                              ],
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                padding: EdgeInsets.all(10.0),
                                color: Colors.red,
                                child: Column(
                                  children: <Widget>[
                                    Text("13 Days"),
                                    Text("10: 25: 58Hrs"),
                                  ],
                                )))
                      ],
                    ),
                    Container(
                      child: Container(
                          alignment: Alignment(-1.0, 1.0),
                          child: Text(
                              "Offence : " + "Convtravenning Speed Limits")),
                    ),
                    Container(
                      child: Container(
                          alignment: Alignment(-1.0, 1.0),
                          child: Text("Police Station : " + "Homagama")),
                    ),
                    Container(
                      child: Container(
                          alignment: Alignment(-1.0, 1.0),
                          child:
                              Text("Driver's License no : " + "B25542868")),
                    ),
                    Container(
                      child: Container(
                          alignment: Alignment(-1.0, 1.0),
                          child: Text("Court : " + "Homagama")),
                    ),
                    Container(
                      child: Container(
                          alignment: Alignment(-1.0, 1.0),
                          child: Text("Court date : " + "dd/mm/yyyy")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Container(
                              alignment: Alignment(-1.0, 1.0),
                              child: Text("Vehicle no : " + "HE - 8653")),
                        ),
                        Container(
                          child: Container(
                              alignment: Alignment(-1.0, 1.0),
                              child: Text("Category : " + "B1")),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Container(
                              alignment: Alignment(-1.0, 1.0),
                              child: Text("Total Amount: " + "RS. 3300.00")),
                        ),
                        // RaisedButton(
                        //   child: Text(
                        //     "Pay",
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        //   onPressed: () {},
                        //   color: Colors.blue[800],
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// body: Container(
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             Card(
//               elevation: 5.0,
//               color: Colors.blue[200],
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Container(
//                             alignment: Alignment(-1.0, 1.0),
//                             child: Text("Fine No: " + fineCard.fineNumber)),
//                         Row(
//                           children: <Widget>[
//                             Container(
//                               alignment: Alignment(-1.0, 1.0),
//                               child: Text("Status : "),
//                             ),
//                             Container(
//                               alignment: Alignment(-1.0, 1.0),
//                               child: Text(
//                                 fineCard.status,
//                                 style: TextStyle(
//                                     backgroundColor: Colors.red,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                     Stack(
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             Container(
//                                 alignment: Alignment(-1.0, 1.0),
//                                 child: Text("Issued date : " + fineCard.issuedDate)),
//                             Row(
//                               children: <Widget>[
//                                 Container(child: Text("Valid untill   : ")),
//                                 Container(
//                                     child: Text(
//                                   fineCard.validUntill,
//                                   style: TextStyle(color: Colors.red),
//                                 )),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Align(
//                             alignment: Alignment.topRight,
//                             child: Container(
//                                 padding: EdgeInsets.all(10.0),
//                                 color: Colors.red,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Text("13 Days"),
//                                     Text("10: 25: 58Hrs"),
//                                   ],
//                                 )))
//                       ],
//                     ),
//                     Container(
//                       child: Container(
//                           alignment: Alignment(-1.0, 1.0),
//                           child: Text(
//                               "Offence : " + fineCard.offence)),
//                     ),
//                     Container(
//                       child: Container(
//                           alignment: Alignment(-1.0, 1.0),
//                           child: Text("Police Station : " + fineCard.policeStation)),
//                     ),
//                     Container(
//                       child: Container(
//                           alignment: Alignment(-1.0, 1.0),
//                           child:
//                               Text("Driver's licence No. : " + fineCard.licenceNumber)),
//                     ),
//                     Container(
//                       child: Container(
//                           alignment: Alignment(-1.0, 1.0),
//                           child: Text("Court : " + fineCard.court)),
//                     ),
//                     Container(
//                       child: Container(
//                           alignment: Alignment(-1.0, 1.0),
//                           child: Text("Court date : " + fineCard.courtDate)),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Container(
//                           child: Container(
//                               alignment: Alignment(-1.0, 1.0),
//                               child: Text("Vehicle no : " + fineCard.vehicleNumber)),
//                         ),
//                         Container(
//                           child: Container(
//                               alignment: Alignment(-1.0, 1.0),
//                               child: Text("Category : " + fineCard.category)),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Container(
//                           child: Container(
//                               alignment: Alignment(-1.0, 1.0),
//                               child: Text("Total Amount: RS." + fineCard.totalAmount)),
//                         ),
//                         RaisedButton(
//                           child: Text(
//                             "Pay",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           onPressed: () {},
//                           color: Colors.blue[800],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
