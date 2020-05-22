import 'package:easy_fines_lk_officer/models/fine_card.dart';
import 'package:easy_fines_lk_officer/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:easy_fines_lk_officer/models/user.dart';


class AddFineForm extends StatefulWidget {
  AddFineForm() : super();

  final String appTitle = "Add a fine";

  @override
  _AddFineFormState createState() => _AddFineFormState();
}

class _AddFineFormState extends State<AddFineForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();

  final List<String> offences = [
    'Contravening speed limits',
    'Not having an instructor\'s license',
    'Disobeying road rules',
    'Activities obstructing control of the motor vehicle',
    'Signals by driver',
    'Reversing for a long distance',
    'Sound or light warnings',
    'Excessive emission of smoke. etc.',
    'Riding on running boards',
    'No. of persons in front seats',
    'Non-use of seat belts',
    'Not wearing protective helmets',
    'Not carrying driving license',
    'Identification plates',
    'Compliance with traffic signals'
  ];

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

//   getAllFines() {
//     return Firestore.instance.collection(firestoreCollectionName).snapshots();
//  }

  addFine() async {
    FineCard fineCard = FineCard(
        category: categoryController.text,
        court: courtController.text,
        courtDate: courtDateController.text,
        fineNumber: fineNumberController.text,
        issuedBy: issuedByController.text,
        issuedDate: issuedDateController.text,
        offence: offenceController.text,
        policeStation: policeStationController.text,
        status: statusController.text,
        totalAmount: totalAmountController.text,
        validUntill: validUntillController.text,
        vehicleNumber: vehicleNumberController.text,
        licenceNumber: licenceNumberController.text);

    try {
      Firestore.instance.runTransaction((Transaction transaction) async {
        await Firestore.instance
            .collection(firestoreCollectionName)
            .document()
            .setData(fineCard.toJson());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // updateFine(
  //     FineCard fineCard,
  //     String category,
  //     String court,
  //     String courtDate,
  //     String fineNumber,
  //     String issuedBy,
  //     String issuedDate,
  //     String offence,
  //     String policeStation,
  //     String status,
  //     String totalAmount,
  //     String validUntill,
  //     String vehicleNumber,
  //     String licenceNumber) {
  //   try {
  //     Firestore.instance.runTransaction((Transaction transaction) async {
  //       await transaction.update(fineCard.documentReference, {
  //         'fineNumber': fineNumber,
  //         'category': category,
  //         'court': court,
  //         'courtDate': courtDate,
  //         'issuedBy': issuedBy,
  //         'issuedDate': issuedDate,
  //         'offence': offence,
  //         'policeStation': policeStation,
  //         'status': status,
  //         'totalAmount': totalAmount,
  //         'validUntill': validUntill,
  //         'vehicleNumber': vehicleNumber,
  //         'licenceNumber': licenceNumber
  //       });
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

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
  //         licenceNumberController.text);

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

  // Widget buildBody(BuildContext context) {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: getAllFines(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Error ${snapshot.error}');
  //       }
  //       if (snapshot.hasData) {
  //         print("Documents -> ${snapshot.data.documents.length}");
  //         return buildList(context, snapshot.data.documents);
  //       }
  //     },
  //   );
  // }

  // Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  //   return ListView(
  //     children: snapshot.map((data) => listItemBuild(context, data)).toList(),
  //   );
  // }

  // Widget listItemBuild(BuildContext context, DocumentSnapshot data) {
  //   final fineCard = FineCard.fromSnapshot(data);

  //   return Padding(
  //     //key: ValueKey(fineCard.licenceNumber),
  //     padding: const EdgeInsets.only(top: 4.0),
  //     child: Card(
  //       elevation: 5.0,
  //       color: Colors.blue[200],
  //       child: Padding(
  //         padding: EdgeInsets.all(10),
  //         child: Column(
  //           children: <Widget>[
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Container(
  //                     alignment: Alignment(-1.0, 1.0),
  //                     child: Text("Fine No: " + fineCard.fineNumber)),
  //                 Row(
  //                   children: <Widget>[
  //                     Container(
  //                       alignment: Alignment(-1.0, 1.0),
  //                       child: Text("Status : "),
  //                     ),
  //                     Container(
  //                       alignment: Alignment(-1.0, 1.0),
  //                       child: Text(
  //                         fineCard.status,
  //                         style: TextStyle(
  //                             backgroundColor: Colors.red, color: Colors.white),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 5.0,
  //             ),
  //             Stack(
  //               children: <Widget>[
  //                 Column(
  //                   children: <Widget>[
  //                     Container(
  //                         alignment: Alignment(-1.0, 1.0),
  //                         child: Text("Issued date : " + fineCard.issuedDate)),
  //                     Row(
  //                       children: <Widget>[
  //                         Container(child: Text("Valid untill   : ")),
  //                         Container(
  //                             child: Text(
  //                           fineCard.validUntill,
  //                           style: TextStyle(color: Colors.red),
  //                         )),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Align(
  //                     alignment: Alignment.topRight,
  //                     child: Container(
  //                         padding: EdgeInsets.all(10.0),
  //                         color: Colors.red,
  //                         child: Column(
  //                           children: <Widget>[
  //                             Text("13 Days"),
  //                             Text("10: 25: 58Hrs"),
  //                           ],
  //                         )))
  //               ],
  //             ),
  //             Container(
  //               child: Container(
  //                   alignment: Alignment(-1.0, 1.0),
  //                   child: Text("Offence : " + fineCard.offence)),
  //             ),
  //             Container(
  //               child: Container(
  //                   alignment: Alignment(-1.0, 1.0),
  //                   child: Text("Police Station : " + fineCard.policeStation)),
  //             ),
  //             Container(
  //               child: Container(
  //                   alignment: Alignment(-1.0, 1.0),
  //                   child: Text(
  //                       "Driver's licence No. : " + fineCard.licenceNumber)),
  //             ),
  //             Container(
  //               child: Container(
  //                   alignment: Alignment(-1.0, 1.0),
  //                   child: Text("Court : " + fineCard.court)),
  //             ),
  //             Container(
  //               child: Container(
  //                   alignment: Alignment(-1.0, 1.0),
  //                   child: Text("Court date : " + fineCard.courtDate)),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Container(
  //                   child: Container(
  //                       alignment: Alignment(-1.0, 1.0),
  //                       child: Text("Vehicle no : " + fineCard.vehicleNumber)),
  //                 ),
  //                 Container(
  //                   child: Container(
  //                       alignment: Alignment(-1.0, 1.0),
  //                       child: Text("Category : " + fineCard.category)),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Container(
  //                   child: Container(
  //                       alignment: Alignment(-1.0, 1.0),
  //                       child:
  //                           Text("Total Amount: RS." + fineCard.totalAmount)),
  //                 ),
  //                 RaisedButton(
  //                   child: Text(
  //                     "Pay",
  //                     style: TextStyle(
  //                         color: Colors.white, fontWeight: FontWeight.bold),
  //                   ),
  //                   onPressed: () {},
  //                   color: Colors.blue[800],
  //                 )
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // setUpdateUI(Book book) {
  //   bookNameController.text = book.bookName;
  //   bookAuthorController.text = book.authorName;

  //   setState(() {
  //     textFieldVisibility = true;
  //     isEditing = true;
  //     currentFine = book;
  //   });
  // }

  button() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        child: Text("Create"),
        onPressed: () {
          addFine();
        },
      ),
    );
  }

//final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {  
    String _formatdate = new DateFormat("dd-MM-yyyy").format(date);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: Container(
          padding: EdgeInsets.all(19),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          TextFormField(
                            controller: fineNumberController,
                            decoration: InputDecoration(
                              hintText: "Enter fine number",
                            ),
                          ),
                          // DropdownButtonFormField(
                          //   value: offences ?? 'Contravening speed limits',
                          //   decoration: textInputDecoration,
                          //   items: offences.map((offence) {
                          //     return DropdownMenuItem(
                          //       value: offence,
                          //       child: Text(offence),
                          //     );
                          //   }).toList(),
                          //   onChanged: (val) =>
                          //       setState(() => offenceController = val),
                          // ),
                          TextFormField(
                            controller: vehicleNumberController,
                            decoration: InputDecoration(
                              hintText: "Enter vehicle number",
                            ),
                          ),
                          TextFormField(
                            controller: categoryController,
                            decoration: InputDecoration(
                              hintText: "Enter vehicle category",
                            ),
                          ),
                          TextFormField(
                            controller: licenceNumberController,
                            decoration: InputDecoration(
                              hintText: "Enter licence number",
                            ),
                          ),
                          TextFormField(
                            controller: policeStationController,
                            decoration: InputDecoration(
                              hintText: "Enter police station",
                            ),
                          ),
                          TextFormField(
                            controller: courtController,
                            decoration: InputDecoration(
                              hintText: "Enter court",
                            ),
                          ),
                          TextFormField(
                            controller: courtDateController,
                            decoration: InputDecoration(
                              hintText: "Enter court date",
                            ),
                          ),
                          TextFormField(
                            controller: issuedByController,
                            decoration: InputDecoration(
                              hintText: "Enter officer's Id",
                            ),
                          ),
                          TextFormField(
                            controller: totalAmountController,
                            decoration: InputDecoration(
                              hintText: "Enter total amount",
                            ),
                          ),
                          // TextFormField(
                          //   controller: issuedDateController,
                          //   decoration: InputDecoration(
                          //     hintText: "Enter issued date",
                          //   ),
                          // ),
                          TextFormField(
                            controller: issuedDateController,
                            decoration: InputDecoration(hintText: "Enter issued date"),
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              DateTime picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030));
                              issuedDateController.text =
                                  _formatdate.toString();
                              if (picked != null && picked != date) {
                                setState(() {
                                  date = picked;
                                });
                              }
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return '*can\'t be empty';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: validUntillController,
                            decoration: InputDecoration(
                              hintText: "Enter valid date",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      button(),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
