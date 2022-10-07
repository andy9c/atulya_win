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

  static Map<String, dynamic> toMap(InformaticsState state) {
    return {
      'tabIndex': state.tabIndex,
      'isEnabled': state.isEnabled,
      'toggleUndoRedo': state.toggleUndoRedo,
    };
  }

  factory InformaticsState.fromMap(Map<String, dynamic> map) {
    return InformaticsState(
      tabIndex: map['tabIndex'],
      isEnabled: map['isEnabled'],
      toggleUndoRedo: map['toggleUndoRedo'],
    );
  }
}
