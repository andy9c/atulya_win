part of 'informatics_cubit.dart';

class InformaticsState extends Equatable {
  const InformaticsState({
    this.tabIndex = 0,
    this.isEnabled = true,
    this.toggleUndoRedo = true,
  });

  final int tabIndex;
  final bool isEnabled;
  final bool toggleUndoRedo;

  @override
  List<Object> get props => [tabIndex, isEnabled, toggleUndoRedo];

  InformaticsState copyWith({
    int? tabIndex,
    bool? isEnabled,
    bool? toggleUndoRedo,
  }) {
    return InformaticsState(
      tabIndex: tabIndex ?? this.tabIndex,
      isEnabled: isEnabled ?? this.isEnabled,
      toggleUndoRedo: toggleUndoRedo ?? this.toggleUndoRedo,
    );
  }
}
