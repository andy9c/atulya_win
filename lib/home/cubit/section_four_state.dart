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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lostland': lostland.value,
      'lostLandtoprojects': lostLandtoprojects.value,
      'landAreaLost': landAreaLost.value,
      'yearOflandLost': yearOflandLost.value,
      'gotCompensation': gotCompensation.value,
      'compensation': compensation,
      'cashCompensation': cashCompensation,
      'employmentDetails': employmentDetails,
      'landDetails': landDetails,
      'otherComments': otherComments,
    };
  }

  factory SectionFourState.fromMap(Map<String, dynamic> map) {
    return SectionFourState(
      lostland: map['lostland'],
      lostLandtoprojects: map['lostLandtoprojects'],
      landAreaLost: map['landAreaLost'],
      yearOflandLost: map['yearOflandLost'],
      gotCompensation: map['gotCompensation'],
      compensation: map['compensation'],
      cashCompensation: map['cashCompensation'],
      employmentDetails: map['employmentDetails'],
      landDetails: map['landDetails'],
      otherComments: map['otherComments'],
    );
  }
  String toJson() => json.encode(toMap());
  factory SectionFourState.fromJson(String source) =>
      SectionFourState.fromMap(json.decode(source));
  @override
  bool get stringify => true;

  @override
  List<FormzInput> get inputs => [
        lostland,
        lostLandtoprojects,
        landAreaLost,
        yearOflandLost,
        gotCompensation,
      ];
}
