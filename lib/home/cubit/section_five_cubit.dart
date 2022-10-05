import 'dart:convert';

import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'section_five_state.dart';

class SectionFiveCubit extends Cubit<SectionFiveState> {
  SectionFiveCubit() : super(const SectionFiveState());

  void oclAcquiringChanged(String value) {
    emit(state.copyWith(oclAcquiring: Compulsory.dirty(value)));
  }

  void looseLandChanged(String value) {
    emit(state.copyWith(looseLand: Compulsory.dirty(value)));
  }

  void landHoldingLostChanged(Map<String, dynamic> value) {
    emit(state.copyWith(landHoldingLost: value));
  }

  void gotNotificationChanged(String value) {
    emit(state.copyWith(gotNotification: Compulsory.dirty(value)));
  }

  void whatActionChanged(String value) {
    emit(state.copyWith(whatAction: Compulsory.dirty(value)));
  }

  void givenConsentChanged(String value) {
    emit(state.copyWith(givenConsent: Compulsory.dirty(value)));
  }

  void reasonChanged(String value) {
    emit(state.copyWith(reason: value));
  }

  void awareChanged(String value) {
    emit(state.copyWith(aware: Compulsory.dirty(value)));
  }

  void lawChanged(String value) {
    emit(state.copyWith(law: Compulsory.dirty(value)));
  }

  void gramsabhaChanged(String value) {
    emit(state.copyWith(gramsabha: Compulsory.dirty(value)));
  }

  void participateChanged(String value) {
    emit(state.copyWith(participate: Compulsory.dirty(value)));
  }

  void resolutionChanged(String value) {
    emit(state.copyWith(resolution: value));
  }

  void compensationAwareChanged(String value) {
    emit(state.copyWith(compensationAware: Compulsory.dirty(value)));
  }

  void compensationDetailsChanged(String value) {
    emit(state.copyWith(compensationDetails: value));
  }

  void happyWithCompensationChanged(String value) {
    emit(state.copyWith(happyWithCompensation: Compulsory.dirty(value)));
  }

  void resettlementPlanChanged(String value) {
    emit(state.copyWith(resettlementPlan: Compulsory.dirty(value)));
  }

  void resettlementOpinionChanged(String value) {
    emit(state.copyWith(resettlementOpinion: ""));
  }
}
