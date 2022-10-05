import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'informatics_state.dart';

class InformaticsCubit extends Cubit<InformaticsState> {
  InformaticsCubit() : super(const InformaticsState());

  void tabIndexChanged(int value) {
    emit(state.copyWith(tabIndex: value));
  }

  void isEnabledChanged(bool value) {
    emit(state.copyWith(isEnabled: value));
  }
}
