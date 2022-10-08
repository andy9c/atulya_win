import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'section_four_state.dart';

class SectionFourCubit extends Cubit<SectionFourState>
    with HydratedMixin, ReplayCubitMixin {
  SectionFourCubit() : super(const SectionFourState());

  void reset() {
    emit(const SectionFourState());
  }

  void setState(SectionFourState? s) {
    if (s != null) emit(s);
  }

  void lostlandChanged(String value) {
    emit(state.copyWith(lostland: Compulsory.dirty(value)));
  }

  void lostLandtoprojectsChanged(List<String> value) {
    emit(state.copyWith(lostLandtoprojects: Compulsory.dirty(value)));
  }

  void landAreaLostChanged(String value) {
    emit(state.copyWith(landAreaLost: Compulsory.dirty(value)));
  }

  void yearOflandLostChanged(String value) {
    emit(state.copyWith(yearOflandLost: Compulsory.dirty(value)));
  }

  void gotCompensationChanged(String value) {
    emit(state.copyWith(gotCompensation: Compulsory.dirty(value)));
  }

  void compensationChanged(String value) {
    emit(state.copyWith(compensation: value));
  }

  void cashCompensationChanged(String value) {
    emit(state.copyWith(cashCompensation: value));
  }

  void employmentDetailsChanged(String value) {
    emit(state.copyWith(employmentDetails: value));
  }

  void landDetailsChanged(String value) {
    emit(state.copyWith(landDetails: value));
  }

  void otherCommentsChanged(String value) {
    emit(state.copyWith(otherComments: value));
  }

  @override
  SectionFourState? fromJson(Map<String, dynamic> json) {
    return SectionFourState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SectionFourState state) {
    return SectionFourState.toMap(state);
  }
}
