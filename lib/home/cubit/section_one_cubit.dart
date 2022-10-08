import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'section_one_state.dart';

class SectionOneCubit extends Cubit<SectionOneState>
    with HydratedMixin, ReplayCubitMixin {
  SectionOneCubit() : super(const SectionOneState());

  void reset() {
    emit(const SectionOneState());
  }

  void setState(SectionOneState? s) {
    if (s != null) emit(s);
  }

  void pattaChanged(String value) {
    emit(state.copyWith(pattaNo: Compulsory.dirty(value)));
  }

  void fullNameChanged(String value) {
    emit(state.copyWith(fullName: Compulsory.dirty(value)));
  }

  void relationshipChanged(String value) {
    emit(state.copyWith(relationship: Compulsory.dirty(value)));
  }

  void headOfHouseholdChanged(String value) {
    emit(state.copyWith(headOfHousehold: Compulsory.dirty(value)));
  }

  void ageChanged(String value) {
    emit(state.copyWith(age: Compulsory.dirty(value)));
  }

  void genderChanged(String value) {
    emit(state.copyWith(gender: Compulsory.dirty(value)));
  }

  void religionChanged(String value) {
    emit(state.copyWith(religion: Compulsory.dirty(value)));
  }

  void socialCategoryChanged(String value) {
    emit(state.copyWith(socialCategory: Compulsory.dirty(value)));
  }

  void nameOfCommunityChanged(String value) {
    emit(state.copyWith(nameOfCommunity: Compulsory.dirty(value)));
  }

  void gramPanchayatChanged(String value) {
    emit(state.copyWith(gramPanchayat: Compulsory.dirty(value)));
  }

  void cardholderChanged(String value) {
    emit(state.copyWith(cardholderCategory: Compulsory.dirty(value)));
  }

  void qualificationChanged(String value) {
    emit(state.copyWith(qualification: Compulsory.dirty(value)));
  }

  void primaryOccupationChanged(String value) {
    emit(state.copyWith(primaryOccupation: Compulsory.dirty(value)));
  }

  void secondaryOccupationChanged(String value) {
    emit(state.copyWith(secondaryOccupation: Compulsory.dirty(value)));
  }

  familyMemberDetailsAdd(Map<String, dynamic> value) {
    String index = state.familyMemberDetails.length.toString();
    Map<String, dynamic> data = {index: value};
    data.addAll(state.familyMemberDetails);

    emit(state.copyWith(familyMemberDetails: data));
  }

  familyMemberDetailsUpdate(String key, Map<String, dynamic> value) {
    Map<String, dynamic> newData = Map.from(state.familyMemberDetails);
    Map<String, dynamic> data = {key: value};
    newData.addAll(data);

    emit(state.copyWith(familyMemberDetails: newData));
  }

  familyMemberDetailsRemove(List<String> key) {
    Map<String, dynamic> newData = Map.from(state.familyMemberDetails);
    newData.removeWhere((k, value) => key.contains(k));

    emit(state.copyWith(familyMemberDetails: newData));
  }

  @override
  SectionOneState? fromJson(Map<String, dynamic> json) {
    return SectionOneState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SectionOneState state) {
    return SectionOneState.toMap(state);
  }
}
