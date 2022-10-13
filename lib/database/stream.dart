import 'package:atulya/configuration/configuration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// By default, listeners do not update if there is a change that only affects the metadata. If you want to receive events when the document or query metadata changes, you can pass includeMetadataChanges to the snapshots method:*/

class StreamData {
  // static Stream<DocumentSnapshot> appUser(String contactNumber) {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(contactNumber);

  //   return userDocumentReferencer.snapshots(includeMetadataChanges: true);
  // }

  static Stream<QuerySnapshot> getRecords() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;
    final String emailID = user!.email.toString();

    final adminDomain = RegExp(r'^[A-Za-z0-9]*@admin\.edu$');
    final specDomain = RegExp(r'^[A-Za-z0-9]*@watch\.edu$');

    var userCollectionReferencer =
        adminDomain.hasMatch(emailID) || specDomain.hasMatch(emailID)
            ? firestore.collection(rootCollection).where(
                  "isDeleted",
                  isEqualTo: false,
                )
            : firestore
                .collection(rootCollection)
                .where(
                  "isDeleted",
                  isEqualTo: false,
                )
                .where(
                  "email",
                  isEqualTo: emailID,
                );

    // var userDocumentReferencer = userCollection.doc(inviterID);
    // var superviseCollectionReferencer = userDocumentReferencer
    //     .collection("event")
    //     .doc(eventID)
    //     .collection("eventPatrons")
    //     .doc(userPhone)
    //     .collection("supervise")
    //     .orderBy("fullName");

    return userCollectionReferencer.snapshots(includeMetadataChanges: true);
  }

  // static Stream<QuerySnapshot> group() {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   final User? _user = FirebaseAuth.instance.currentUser;
  //   final String _userPhone = _user!.phoneNumber.toString();

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(_userPhone);
  //   var groupCollectionReferencer = userDocumentReferencer
  //       .collection("group")
  //       .where("isGroupDeleted", isEqualTo: false)
  //       .orderBy("eventName");

  //   return groupCollectionReferencer.snapshots(includeMetadataChanges: true);
  // }

  // static Stream<QuerySnapshot> deletedGroup() {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   final User? _user = FirebaseAuth.instance.currentUser;
  //   final String _userPhone = _user!.phoneNumber.toString();

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(_userPhone);
  //   var groupCollectionReferencer = userDocumentReferencer
  //       .collection("group")
  //       .where("isGroupDeleted", isEqualTo: true)
  //       .orderBy("eventName");

  //   return groupCollectionReferencer.snapshots(includeMetadataChanges: true);
  // }

  // static Stream<DocumentSnapshot> event(String eventID, String inviterID) {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   // final User? _user = FirebaseAuth.instance.currentUser;
  //   // final String _userPhone = _user!.phoneNumber.toString();

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(inviterID);
  //   var eventDocumentReferencer =
  //       userDocumentReferencer.collection("event").doc(eventID);

  //   return eventDocumentReferencer.snapshots(includeMetadataChanges: true);
  // }

  // static Stream<DocumentSnapshot> appContacts() {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   final User? _user = FirebaseAuth.instance.currentUser;
  //   final String _userPhone = _user!.phoneNumber.toString();

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(_userPhone);
  //   var contactDocumentReferencer =
  //       userDocumentReferencer.collection("contact").doc("appContact");

  //   return contactDocumentReferencer.snapshots(includeMetadataChanges: true);
  // }

  // static Stream<DocumentSnapshot> appConfig() {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //   final CollectionReference _appCollection =
  //       _firestore.collection(appCollection);

  //   var appDocumentReferencer = _appCollection.doc("config");

  //   return appDocumentReferencer.snapshots(includeMetadataChanges: true);
  // }

  // static Stream<DocumentSnapshot> eventPatron(
  //     String eventID, String inviterID) {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   final User? _user = FirebaseAuth.instance.currentUser;
  //   final String _userPhone = _user!.phoneNumber.toString();

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(inviterID);
  //   var eventPatronDocumentReferencer = userDocumentReferencer
  //       .collection("event")
  //       .doc(eventID)
  //       .collection("eventPatrons")
  //       .doc(_userPhone);

  //   return eventPatronDocumentReferencer.snapshots(
  //       includeMetadataChanges: true);
  // }

  // static Stream<DocumentSnapshot> userSupervise(
  //     String eventID, String inviterID) {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   final User? _user = FirebaseAuth.instance.currentUser;
  //   final String _userPhone = _user!.phoneNumber.toString();

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(inviterID);
  //   var supervisePatronDocumentReferencer = userDocumentReferencer
  //       .collection("event")
  //       .doc(eventID)
  //       .collection("eventPatrons")
  //       .doc(_userPhone)
  //       .collection("supervise")
  //       .doc(_userPhone);

  //   return supervisePatronDocumentReferencer.snapshots(
  //       includeMetadataChanges: true);
  // }

  // static Stream<QuerySnapshot> eventPatrons(String eventID, String inviterID) {
  //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   // final User? _user = FirebaseAuth.instance.currentUser;
  //   // final String _userPhone = _user!.phoneNumber.toString();

  //   final CollectionReference _userCollection =
  //       _firestore.collection(userCollection);

  //   var userDocumentReferencer = _userCollection.doc(inviterID);
  //   var eventPatronCollectionReferencer = userDocumentReferencer
  //       .collection("event")
  //       .doc(eventID)
  //       .collection("eventPatrons");

  //   return eventPatronCollectionReferencer.snapshots(
  //       includeMetadataChanges: true);
  // }
}
