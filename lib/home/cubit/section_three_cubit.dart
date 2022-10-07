import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'section_three_state.dart';

class SectionThreeCubit extends Cubit<SectionThreeState>
    with HydratedMixin, ReplayCubitMixin {
  SectionThreeCubit() : super(const SectionThreeState());

  void reset() {
    emit(const SectionThreeState());
  }

  void incomeSourcesChanged(List<String> value) {
    emit(state.copyWith(incomeSources: Compulsory.dirty(value)));
  }

  void otherAssetsCountChanged(Map<String, dynamic> value) {
    Map<String, dynamic> newData = Map.from(state.otherAssetsCount);
    newData.addAll(value);
    emit(state.copyWith(otherAssetsCount: newData));
  }

  void annualIncomeChanged(String value) {
    emit(state.copyWith(annualIncome: Compulsory.dirty(value)));
  }

  void cropsPatternChanged(Map<String, dynamic> value) {
    Map<String, dynamic> newData = Map.from(state.cropsPattern);
    newData.addAll(value);
    emit(state.copyWith(cropsPattern: newData));
  }

  void vegetablesPatternChanged(Map<String, dynamic> value) {
    Map<String, dynamic> newData = Map.from(state.vegetablesPattern);
    newData.addAll(value);
    emit(state.copyWith(vegetablesPattern: newData));
  }

  void forestProduceChanged(List<String> value) {
    emit(state.copyWith(forestProduce: value));
  }

  void otherForestProduceChanged(String value) {
    emit(state.copyWith(otherForestProduce: value));
  }

  void freshWaterItemsChanged(List<String> value) {
    emit(state.copyWith(freshWaterItems: value));
  }

  void otherFreshWaterItemsChanged(String value) {
    emit(state.copyWith(otherFreshWaterItems: value));
  }

  @override
  SectionThreeState? fromJson(Map<String, dynamic> json) {
    return SectionThreeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SectionThreeState state) {
    return SectionThreeState.toMap(state);
  }
}
