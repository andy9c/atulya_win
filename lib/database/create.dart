// ignore_for_file: avoid_print

import 'package:atulya/configuration/configuration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_date/dart_date.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/cubit/cubit.dart';

class Create {
  static Future<void> execute(BuildContext context) async {
    String? documentID =
        context.read<InformaticsCubit>().state.documentID.value;

    SectionOneState s1 = context.read<SectionOneCubit>().state;
    SectionTwoState s2 = context.read<SectionTwoCubit>().state;
    SectionThreeState s3 = context.read<SectionThreeCubit>().state;
    SectionFourState s4 = context.read<SectionFourCubit>().state;
    SectionFiveState s5 = context.read<SectionFiveCubit>().state;
    SectionSixState s6 = context.read<SectionSixCubit>().state;

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? student = FirebaseAuth.instance.currentUser;

    final CollectionReference mainCollection =
        firestore.collection(rootCollection);

    final timeStamp = DateTime.now().format('MMMM dd y, h:mm:ss a');
    final String emailID = student!.email.toString();
    final String uidDoc =
        '${s1.fullName.value} (${s1.gramPanchayat.value}) (${mainCollection.doc().id})';

    var rootDocumentReferencer = mainCollection.doc(documentID ?? uidDoc);

    Map<String, dynamic> s1Data = SectionOneState.toMap(s1);
    Map<String, dynamic> s2Data = SectionTwoState.toMap(s2);
    Map<String, dynamic> s3Data = SectionThreeState.toMap(s3);
    Map<String, dynamic> s4Data = SectionFourState.toMap(s4);
    Map<String, dynamic> s5Data = SectionFiveState.toMap(s5);
    Map<String, dynamic> s6Data = SectionSixState.toMap(s6);

    Map<String, dynamic> data = <String, dynamic>{
      "email": emailID,
      "timestamp": timeStamp,
      "isDeleted": false,
      "s1": s1Data,
      "s2": s2Data,
      "s3": s3Data,
      "s4": s4Data,
      "s5": s5Data,
      "s6": s6Data,
    };

    Map<String, dynamic> updateData = <String, dynamic>{
      "updateTimestamp": timeStamp,
      "s1": s1Data,
      "s2": s2Data,
      "s3": s3Data,
      "s4": s4Data,
      "s5": s5Data,
      "s6": s6Data,
    };

    await rootDocumentReferencer
        .set(documentID == null ? data : updateData, SetOptions(merge: true))
        .catchError((e) => null);
  }
}
