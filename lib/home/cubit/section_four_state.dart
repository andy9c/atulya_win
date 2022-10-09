part of 'section_four_cubit.dart';

class SectionFourState extends Equatable with FormzMixin {
  const SectionFourState({
    this.lostland = const Compulsory.pure(),
    this.lostLandtoprojects = const Compulsory.pure(),
    this.landAreaLost = const Compulsory.pure(),
    this.yearOflandLost = const Compulsory.pure(),
    this.gotCompensation = const Compulsory.pure(),
    this.compensation = "",
    this.cashCompensation = "",
    this.employmentDetails = "",
    this.landDetails = "",
    this.otherComments = "",
    this.reloadToggle = false,
  });

  final Compulsory lostland;
  final Compulsory lostLandtoprojects;
  final Compulsory landAreaLost;
  final Compulsory yearOflandLost;
  final Compulsory gotCompensation;
  final String compensation;
  final String cashCompensation;
  final String employmentDetails;
  final String landDetails;
  final String otherComments;
  final bool reloadToggle;

  @override
  List<Object> get props {
    return [
      lostland,
      lostLandtoprojects,
      landAreaLost,
      yearOflandLost,
      gotCompensation,
      compensation,
      cashCompensation,
      employmentDetails,
      landDetails,
      otherComments,
      reloadToggle,
    ];
  }

  SectionFourState copyWith({
    Compulsory? lostland,
    Compulsory? lostLandtoprojects,
    Compulsory? landAreaLost,
    Compulsory? yearOflandLost,
    Compulsory? gotCompensation,
    String? compensation,
    String? cashCompensation,
    String? employmentDetails,
    String? landDetails,
    String? otherComments,
    bool? reloadToggle,
  }) {
    return SectionFourState(
      lostland: lostland ?? this.lostland,
      lostLandtoprojects: lostLandtoprojects ?? this.lostLandtoprojects,
      landAreaLost: landAreaLost ?? this.landAreaLost,
      yearOflandLost: yearOflandLost ?? this.yearOflandLost,
      gotCompensation: gotCompensation ?? this.gotCompensation,
      compensation: compensation ?? this.compensation,
      cashCompensation: cashCompensation ?? this.cashCompensation,
      employmentDetails: employmentDetails ?? this.employmentDetails,
      landDetails: landDetails ?? this.landDetails,
      otherComments: otherComments ?? this.otherComments,
      reloadToggle: reloadToggle ?? this.reloadToggle,
    );
  }

  static Map<String, dynamic> toMap(SectionFourState state) {
    return {
      'lostland': state.lostland.value,
      'lostLandtoprojects': state.lostLandtoprojects.value,
      'landAreaLost': state.landAreaLost.value,
      'yearOflandLost': state.yearOflandLost.value,
      'gotCompensation': state.gotCompensation.value,
      'compensation': state.compensation,
      'cashCompensation': state.cashCompensation,
      'employmentDetails': state.employmentDetails,
      'landDetails': state.landDetails,
      'otherComments': state.otherComments,
    };
  }

  factory SectionFourState.fromMap(Map<String, dynamic> map) {
    return SectionFourState(
      lostland: Compulsory.dirty(map['lostland']),
      lostLandtoprojects: Compulsory.dirty(map['lostLandtoprojects']),
      landAreaLost: Compulsory.dirty(map['landAreaLost']),
      yearOflandLost: Compulsory.dirty(map['yearOflandLost']),
      gotCompensation: Compulsory.dirty(map['gotCompensation']),
      compensation: map['compensation'],
      cashCompensation: map['cashCompensation'],
      employmentDetails: map['employmentDetails'],
      landDetails: map['landDetails'],
      otherComments: map['otherComments'],
    );
  }

  @override
  List<FormzInput> get inputs => [
        lostland,
        lostLandtoprojects,
        landAreaLost,
        yearOflandLost,
        gotCompensation,
      ];
}
