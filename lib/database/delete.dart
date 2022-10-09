// ignore_for_file: avoid_print

import 'package:atulya/configuration/configuration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_date/dart_date.dart';

class Delete {
  static Future<void> execute(String documentID) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final CollectionReference mainCollection =
        firestore.collection(rootCollection);

    final timeStamp = DateTime.now().format('MMMM dd y, h:mm:ss a');

    var rootDocumentReferencer = mainCollection.doc(documentID);

    Map<String, dynamic> deleteData = <String, dynamic>{
      "UpdateTimestamp": timeStamp,
      "isDeleted": true,
    };

    await rootDocumentReferencer
        .set(deleteData, SetOptions(merge: true))
        .catchError((e) => null);
  }
}
