import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:easy_fines_lk_officer/models/officer.dart';
import 'package:easy_fines_lk_officer/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference officerCollection = Firestore.instance.collection('Officers');

  final CollectionReference fineCollection = Firestore.instance.collection('Fines');

  Future<void> updateUserData(String policeId, String name, String policeStation) async {
    return await officerCollection.document(uid).setData({
      'policeId': policeId,
      'name': name,
      'policeStation': policeStation,
    });
  }

  // Officer list from snapshot
  List<Officer> _officerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Officer(
        name: doc.data['name'] ?? '',
        policeStation: doc.data['policeStation'] ?? '',
        policeId: doc.data['policeId'] ?? ''
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      policeId: snapshot.data['policeId'],
      policeStation: snapshot.data['policeStation']
    );
  }

  // get offiers stream
  Stream<List<Officer>> get officer {
    return officerCollection.snapshots()
      .map(_officerListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return officerCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}