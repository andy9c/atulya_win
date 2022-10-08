part of 'informatics_cubit.dart';

class InformaticsState extends Equatable {
  const InformaticsState({
    this.tabIndex = 0,
    this.isEnabled = false,
    this.hasInternet = false,
  });

  final int tabIndex;
  final bool isEnabled;
  final bool hasInternet;

  @override
  List<Object> get props => [tabIndex, isEnabled, hasInternet];

  InformaticsState copyWith({
    int? tabIndex,
    bool? isEnabled,
    bool? hasInternet,
  }) {
    return InformaticsState(
      tabIndex: tabIndex ?? this.tabIndex,
      isEnabled: isEnabled ?? this.isEnabled,
      hasInternet: hasInternet ?? this.hasInternet,
    );
  }

  static Map<String, dynamic> toMap(InformaticsState state) {
    return {
      'tabIndex': state.tabIndex,
      'isEnabled': state.isEnabled,
      'hasInternet': state.hasInternet,
    };
  }

  factory InformaticsState.fromMap(Map<String, dynamic> map) {
    return InformaticsState(
      tabIndex: map['tabIndex'],
      isEnabled: map['isEnabled'],
      hasInternet: map['hasInternet'],
    );
  }
}
