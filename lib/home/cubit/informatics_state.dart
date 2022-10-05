part of 'informatics_cubit.dart';

class InformaticsState extends Equatable {
  const InformaticsState({
    this.tabIndex = 0,
    this.isEnabled = true,
  });

  final int tabIndex;
  final bool isEnabled;

  @override
  List<Object> get props => [tabIndex, isEnabled];

  InformaticsState copyWith({
    int? tabIndex,
    bool? isEnabled,
  }) {
    return InformaticsState(
      tabIndex: tabIndex ?? this.tabIndex,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
