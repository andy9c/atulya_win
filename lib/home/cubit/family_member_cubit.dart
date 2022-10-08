import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'family_member_state.dart';

class FamilyMemberCubit extends Cubit<FamilyMemberState>
    with HydratedMixin, ReplayCubitMixin {
  FamilyMemberCubit() : super(const FamilyMemberState());

  void reset() {
    emit(const FamilyMemberState());
  }

  void setState(FamilyMemberState? s) {
    if (s != null) emit(s);
  }

  void nameChanged(String value) {
    emit(state.copyWith(name: Compulsory.dirty(value)));
  }

  void relationshipChanged(String value) {
    emit(state.copyWith(relationship: Compulsory.dirty(value)));
  }

  void ageChanged(String value) {
    emit(state.copyWith(age: Compulsory.dirty(value)));
  }

  void genderChanged(String value) {
    emit(state.copyWith(gender: Compulsory.dirty(value)));
  }

  void qualificationChanged(String value) {
    emit(state.copyWith(qualification: Compulsory.dirty(value)));
  }

  void occupationChanged(String value) {
    emit(state.copyWith(occupation: Compulsory.dirty(value)));
  }

  @override
  FamilyMemberState? fromJson(Map<String, dynamic> json) {
    return FamilyMemberState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FamilyMemberState state) {
    return FamilyMemberState.toMap(state);
  }
}
