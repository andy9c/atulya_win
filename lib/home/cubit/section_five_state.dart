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

  static Map<String, dynamic> toMap(SectionFiveState state) {
    return {
      'oclAcquiring': state.oclAcquiring.value,
      'looseLand': state.looseLand.value,
      'landHoldingLost': state.landHoldingLost,
      'gotNotification': state.gotNotification.value,
      'whatAction': state.whatAction.value,
      'givenConsent': state.givenConsent.value,
      'reason': state.reason,
      'aware': state.aware.value,
      'law': state.law.value,
      'gramsabha': state.gramsabha.value,
      'participate': state.participate.value,
      'resolution': state.resolution,
      'compensationAware': state.compensationAware.value,
      'compensationDetails': state.compensationDetails,
      'happyWithCompensation': state.happyWithCompensation.value,
      'resettlementPlan': state.resettlementPlan.value,
      'resettlementOpinion': state.resettlementOpinion,
    };
  }

  factory SectionFiveState.fromMap(Map<String, dynamic> map) {
    return SectionFiveState(
      oclAcquiring: Compulsory.dirty(map['oclAcquiring']),
      looseLand: Compulsory.dirty(map['looseLand']),
      landHoldingLost: map['landHoldingLost'],
      gotNotification: Compulsory.dirty(map['gotNotification']),
      whatAction: Compulsory.dirty(map['whatAction']),
      givenConsent: Compulsory.dirty(map['givenConsent']),
      reason: map['reason'],
      aware: Compulsory.dirty(map['aware']),
      law: Compulsory.dirty(map['law']),
      gramsabha: Compulsory.dirty(map['gramsabha']),
      participate: Compulsory.dirty(map['participate']),
      resolution: map['resolution'],
      compensationAware: Compulsory.dirty(map['compensationAware']),
      compensationDetails: map['compensationDetails'],
      happyWithCompensation: Compulsory.dirty(map['happyWithCompensation']),
      resettlementPlan: Compulsory.dirty(map['resettlementPlan']),
      resettlementOpinion: map['resettlementOpinion'],
    );
  }

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
