import 'package:atulya/configuration/configuration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Read {
  static Future<DocumentSnapshot<Object?>> execute(String docID) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    // final User? user = FirebaseAuth.instance.currentUser;

    final CollectionReference mainCollection =
        firestore.collection(rootCollection);

    // final emailID = user!.email.toString();
    var rootDocumentReferencer = mainCollection.doc(docID);

    return rootDocumentReferencer.get();
  }
}
