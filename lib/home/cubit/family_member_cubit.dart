import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'family_member_state.dart';

class FamilyMemberCubit extends Cubit<FamilyMemberState> with HydratedMixin {
  FamilyMemberCubit() : super(const FamilyMemberState());

  void nameChanged(String value) {
    emit(state.copyWith());
  }

  void relationshiphanged(String value) {
    emit(state.copyWith());
  }

  void agehanged(String value) {
    emit(state.copyWith());
  }

  void genderhanged(String value) {
    emit(state.copyWith());
  }

  void qualificationhanged(String value) {
    emit(state.copyWith());
  }

  void occupationhanged(String value) {
    emit(state.copyWith());
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
