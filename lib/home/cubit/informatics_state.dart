part of 'informatics_cubit.dart';

class InformaticsState extends Equatable {
  const InformaticsState({
    this.tabIndex = 0,
    this.isEnabled = true,
    this.hasInternet = false,
    this.isEditMode = false,
    this.isLoadingDocument = false,
    this.documentID = const Compulsory.pure(),
  });

  final int tabIndex;
  final bool isEnabled;
  final bool hasInternet;
  final bool isEditMode;
  final bool isLoadingDocument;
  final Compulsory documentID;

  @override
  List<Object> get props {
    return [
      tabIndex,
      isEnabled,
      hasInternet,
      isEditMode,
      isLoadingDocument,
      documentID,
    ];
  }

  InformaticsState copyWith({
    int? tabIndex,
    bool? isEnabled,
    bool? hasInternet,
    bool? isEditMode,
    bool? isLoadingDocument,
    Compulsory? documentID,
  }) {
    return InformaticsState(
      tabIndex: tabIndex ?? this.tabIndex,
      isEnabled: isEnabled ?? this.isEnabled,
      hasInternet: hasInternet ?? this.hasInternet,
      isEditMode: isEditMode ?? this.isEditMode,
      isLoadingDocument: isLoadingDocument ?? this.isLoadingDocument,
      documentID: documentID ?? this.documentID,
    );
  }

  static Map<String, dynamic> toMap(InformaticsState state) {
    return {
      'tabIndex': state.tabIndex,
    };
  }

  factory InformaticsState.fromMap(Map<String, dynamic> map) {
    return InformaticsState(
      tabIndex: map['tabIndex'],
    );
  }
}
