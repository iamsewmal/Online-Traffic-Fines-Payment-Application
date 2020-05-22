import 'package:cloud_firestore/cloud_firestore.dart';

class FineCard {
  String fineNumber;
  String category;
  String court;
  String courtDate;
  String issuedBy;
  String issuedDate;
  String offence;
  String policeStation;
  String status;
  String totalAmount;
  String validUntill;
  String vehicleNumber;
  String licenceNumber;


  DocumentReference documentReference;

  FineCard(
      {this.category,
      this.court,
      this.courtDate,
      this.fineNumber,
      this.issuedBy,
      this.issuedDate,
      this.offence,
      this.policeStation,
      this.status,
      this.totalAmount,
      this.validUntill,
      this.vehicleNumber,
      this.licenceNumber
      });

  FineCard.fromMap(Map<String, dynamic> map, {this.documentReference}) {
    fineNumber = map["fineNumber"];
    category = map["category"];
    court = map["court"];
    courtDate = map["courtDate"];
    issuedBy = map["issuedBy"];
    issuedDate = map["issuedDate"];
    offence = map["offence"];
    policeStation = map["policeStation"];
    status = map["status"];
    totalAmount = map["totalAmount"];
    validUntill = map["validUntill"];
    vehicleNumber = map["vehicleNumber"];
    licenceNumber = map["licenceNumber"];
  }
  FineCard.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, documentReference: snapshot.reference);

  toJson() {
    return {
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
      'licenceNumber': licenceNumber
    };
  }
}

