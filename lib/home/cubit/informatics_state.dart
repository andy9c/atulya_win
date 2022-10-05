part of 'informatics_cubit.dart';

class InformaticsState extends Equatable {
  const InformaticsState({
    this.tabIndex = 0,
  });

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
  InformaticsState copyWith({
    int? tabIndex,
  }) {
    return InformaticsState(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}
