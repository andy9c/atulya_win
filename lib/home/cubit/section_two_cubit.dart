import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'section_two_state.dart';

class SectionTwoCubit extends Cubit<SectionTwoState>
    with HydratedMixin, ReplayCubitMixin {
  SectionTwoCubit() : super(const SectionTwoState());

  void reset() {
    emit(const SectionTwoState());
  }

  void generationCountChanged(String value) {
    emit(state.copyWith(generationCount: Compulsory.dirty(value)));
  }

  void ownLandChanged(String value) {
    emit(state.copyWith(ownLand: Compulsory.dirty(value)));
  }

  void yesNameChanged(String value) {
    emit(state.copyWith(yesName: value));
  }

  void noNameChanged(String value) {
    emit(state.copyWith(noName: value));
  }

  void relationshipChanged(String value) {
    emit(state.copyWith(relationship: Compulsory.dirty(value)));
  }

  void isAliveChanged(String value) {
    emit(state.copyWith(isAlive: Compulsory.dirty(value)));
  }

  void countChulhaChanged(String value) {
    emit(state.copyWith(countChulha: Compulsory.dirty(value)));
  }

  void totalPeopleChanged(String value) {
    emit(state.copyWith(totalPeople: Compulsory.dirty(value)));
  }

  void landHoldingChanged(Map<String, dynamic> value) {
    Map<String, dynamic> newData = state.landHolding;
    newData.addAll(value);
    emit(state.copyWith(landHolding: newData));
  }

  void cultivateAnabadiChanged(String value) {
    emit(state.copyWith(cultivateAnabadi: Compulsory.dirty(value)));
  }

  void yearsAnabadiChanged(String value) {
    emit(state.copyWith(yearsAnabadi: value));
  }

  void appliedOwnershipChanged(String value) {
    emit(state.copyWith(appliedOwnership: Compulsory.dirty(value)));
  }

  void receivedEntitlementChanged(String value) {
    emit(state.copyWith(receivedEntitlement: Compulsory.dirty(value)));
  }

  void cropTypesChanged(String value) {
    emit(state.copyWith(cropTypes: value));
  }

  @override
  SectionTwoState? fromJson(Map<String, dynamic> json) {
    return SectionTwoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SectionTwoState state) {
    return SectionTwoState.toMap(state);
  }
}
