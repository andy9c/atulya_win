import 'dart:convert';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'section_four_state.dart';

class SectionFourCubit extends Cubit<SectionFourState> {
  SectionFourCubit() : super(const SectionFourState());

  void lostlandChanged(String value) {
    emit(state.copyWith());
  }

  void lostLandtoprojectsChanged(String value) {
    emit(state.copyWith());
  }

  void landAreaLostChanged(String value) {
    emit(state.copyWith());
  }

  void yearOflandLostChanged(String value) {
    emit(state.copyWith());
  }

  void gotCompensationChanged(String value) {
    emit(state.copyWith());
  }

  void compensationChanged(String value) {
    emit(state.copyWith());
  }

  void cashCompensationChanged(String value) {
    emit(state.copyWith());
  }

  void employmentDetailsChanged(String value) {
    emit(state.copyWith());
  }

  void landDetailsChanged(String value) {
    emit(state.copyWith());
  }

  void otherCommentsChanged(String value) {
    emit(state.copyWith());
  }
}
