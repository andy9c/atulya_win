import 'package:atulya/home/cubit/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'informatics_state.dart';

class InformaticsCubit extends Cubit<InformaticsState> with HydratedMixin {
  InformaticsCubit() : super(const InformaticsState());

  void tabIndexChanged(int value) {
    emit(state.copyWith(tabIndex: value));
  }

  void isEnabledChanged(BuildContext context, bool value) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String emailID = user!.email.toString();

    final adminDomain = RegExp(r'^[A-Za-z0-9]*@admin\.edu$');

    if (!adminDomain.hasMatch(emailID)) {
      emit(state.copyWith(isEnabled: value));

      context.read<SectionOneCubit>().reloadToggleChanged();
      context.read<SectionTwoCubit>().reloadToggleChanged();
      context.read<SectionThreeCubit>().reloadToggleChanged();
      context.read<SectionFourCubit>().reloadToggleChanged();
      context.read<SectionFiveCubit>().reloadToggleChanged();
      context.read<SectionSixCubit>().reloadToggleChanged();
    } else {
      emit(state.copyWith(isEnabled: true));
    }
  }

  void hasInternetChanged(bool value) {
    emit(state.copyWith(hasInternet: value));
  }

  void toggleEditMode() {
    emit(state.copyWith(isEditMode: !state.isEditMode));
  }

  void isLoadingDocumentChanged(bool value) {
    emit(state.copyWith(isLoadingDocument: value));
  }

  void documentIDChanged(String? value) {
    value == null
        ? emit(state.copyWith(documentID: const Compulsory.pure()))
        : emit(state.copyWith(documentID: Compulsory.dirty(value)));
  }

  @override
  InformaticsState? fromJson(Map<String, dynamic> json) {
    return InformaticsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(InformaticsState state) {
    return InformaticsState.toMap(state);
  }
}
