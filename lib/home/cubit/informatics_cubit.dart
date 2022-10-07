import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'informatics_state.dart';

class InformaticsCubit extends Cubit<InformaticsState> with HydratedMixin {
  InformaticsCubit() : super(const InformaticsState());

  void tabIndexChanged(int value) {
    emit(state.copyWith(tabIndex: value));
  }

  void isEnabledChanged(bool value) {
    emit(state.copyWith(isEnabled: value));
  }

  void toggleUndoRedoChanged() {
    emit(state.copyWith(toggleUndoRedo: !state.toggleUndoRedo));
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
