part of 'section_five_cubit.dart';

class SectionFiveState extends Equatable with FormzMixin {
  const SectionFiveState({
    this.oclAcquiring = const Compulsory.pure(),
    this.looseLand = const Compulsory.pure(),
    this.landHoldingLost = const {},
    this.gotNotification = const Compulsory.pure(),
    this.whatAction = const Compulsory.pure(),
    this.givenConsent = const Compulsory.pure(),
    this.reason = "",
    this.aware = const Compulsory.pure(),
    this.law = const Compulsory.pure(),
    this.gramsabha = const Compulsory.pure(),
    this.participate = const Compulsory.pure(),
    this.resolution = "",
    this.compensationAware = const Compulsory.pure(),
    this.compensationDetails = "",
    this.happyWithCompensation = const Compulsory.pure(),
    this.resettlementPlan = const Compulsory.pure(),
    this.resettlementOpinion = "",
  });

  final Compulsory oclAcquiring;
  final Compulsory looseLand;
  final Map<String, dynamic> landHoldingLost;
  final Compulsory gotNotification;
  final Compulsory whatAction;
  final Compulsory givenConsent;
  final String reason;
  final Compulsory aware;
  final Compulsory law;
  final Compulsory gramsabha;
  final Compulsory participate;
  final String resolution;
  final Compulsory compensationAware;
  final String compensationDetails;
  final Compulsory happyWithCompensation;
  final Compulsory resettlementPlan;
  final String resettlementOpinion;

  @override
  List<Object> get props {
    return [
      oclAcquiring,
      looseLand,
      landHoldingLost,
      gotNotification,
      whatAction,
      givenConsent,
      reason,
      aware,
      law,
      gramsabha,
      participate,
      resolution,
      compensationAware,
      compensationDetails,
      happyWithCompensation,
      resettlementPlan,
      resettlementOpinion,
    ];
  }

  @override
  List<FormzInput> get inputs => [
        oclAcquiring,
        looseLand,
        gotNotification,
        whatAction,
        givenConsent,
        aware,
        law,
        gramsabha,
        participate,
        compensationAware,
        happyWithCompensation,
        resettlementPlan,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'oclAcquiring': oclAcquiring.value,
      'looseLand': looseLand.value,
      'landHoldingLost': landHoldingLost,
      'gotNotification': gotNotification.value,
      'whatAction': whatAction.value,
      'givenConsent': givenConsent.value,
      'reason': reason,
      'aware': aware.value,
      'law': law.value,
      'gramsabha': gramsabha.value,
      'participate': participate.value,
      'resolution': resolution,
      'compensationAware': compensationAware.value,
      'compensationDetails': compensationDetails,
      'happyWithCompensation': happyWithCompensation.value,
      'resettlementPlan': resettlementPlan.value,
      'resettlementOpinion': resettlementOpinion,
    };
  }

  factory SectionFiveState.fromMap(Map<String, dynamic> map) {
    return SectionFiveState(
      oclAcquiring: map['oclAcquiring'],
      looseLand: map['looseLand'],
      landHoldingLost: map['landHoldingLost'],
      gotNotification: map['gotNotification'],
      whatAction: map['whatAction'],
      givenConsent: map['givenConsent'],
      reason: map['reason'],
      aware: map['aware'],
      law: map['law'],
      gramsabha: map['gramsabha'],
      participate: map['participate'],
      resolution: map['resolution'],
      compensationAware: map['compensationAware'],
      compensationDetails: map['compensationDetails'],
      happyWithCompensation: map['happyWithCompensation'],
      resettlementPlan: map['resettlementPlan'],
      resettlementOpinion: map['resettlementOpinion'],
    );
  }
  String toJson() => json.encode(toMap());

  factory SectionFiveState.fromJson(String source) =>
      SectionFiveState.fromMap(json.decode(source));

  SectionFiveState copyWith({
    Compulsory? oclAcquiring,
    Compulsory? looseLand,
    Map<String, dynamic>? landHoldingLost,
    Compulsory? gotNotification,
    Compulsory? whatAction,
    Compulsory? givenConsent,
    String? reason,
    Compulsory? aware,
    Compulsory? law,
    Compulsory? gramsabha,
    Compulsory? participate,
    String? resolution,
    Compulsory? compensationAware,
    String? compensationDetails,
    Compulsory? happyWithCompensation,
    Compulsory? resettlementPlan,
    String? resettlementOpinion,
  }) {
    return SectionFiveState(
      oclAcquiring: oclAcquiring ?? this.oclAcquiring,
      looseLand: looseLand ?? this.looseLand,
      landHoldingLost: landHoldingLost ?? this.landHoldingLost,
      gotNotification: gotNotification ?? this.gotNotification,
      whatAction: whatAction ?? this.whatAction,
      givenConsent: givenConsent ?? this.givenConsent,
      reason: reason ?? this.reason,
      aware: aware ?? this.aware,
      law: law ?? this.law,
      gramsabha: gramsabha ?? this.gramsabha,
      participate: participate ?? this.participate,
      resolution: resolution ?? this.resolution,
      compensationAware: compensationAware ?? this.compensationAware,
      compensationDetails: compensationDetails ?? this.compensationDetails,
      happyWithCompensation:
          happyWithCompensation ?? this.happyWithCompensation,
      resettlementPlan: resettlementPlan ?? this.resettlementPlan,
      resettlementOpinion: resettlementOpinion ?? this.resettlementOpinion,
    );
  }
}
