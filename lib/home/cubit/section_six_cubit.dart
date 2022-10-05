import 'dart:convert';

import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'section_six_state.dart';

class SectionSixCubit extends Cubit<SectionSixState> {
  SectionSixCubit() : super(const SectionSixState());

  void landMeanChanged(String value) {
    emit(state.copyWith(landMean: Compulsory.dirty(value)));
  }

  void lossChanged(String value) {
    emit(state.copyWith(loss: Compulsory.dirty(value)));
  }

  void landAcquisitionChanged(String value) {
    emit(state.copyWith(landAcquisition: Compulsory.dirty(value)));
  }

  void miningActivityChanged(String value) {
    emit(state.copyWith(miningActivity: Compulsory.dirty(value)));
  }

  void discussionChanged(String value) {
    emit(state.copyWith(discussion: Compulsory.dirty(value)));
  }

  void commentsChanged(String value) {
    emit(state.copyWith(comments: value));
  }
}
