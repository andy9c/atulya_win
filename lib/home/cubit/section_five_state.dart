part of 'section_five_cubit.dart';

class SectionFiveState extends Equatable with FormzMixin {
  const SectionFiveState({
    this.oclAcquiring = const Compulsory.pure(),
    this.looseLand = const Compulsory.pure(),
    this.totalLandToLoose = const Compulsory.pure(),
    this.landHoldingLost = const {},
    this.gotNotification = const Compulsory.pure(),
    this.whatAction = const Compulsory.pure(),
    this.givenConsent = const Compulsory.pure(),
    this.reason = "",
    this.aware = const Compulsory.pure(),
    this.gramsabha = const Compulsory.pure(),
    this.participate = const Compulsory.pure(),
    this.resolution = "",
    this.compensationAware = const Compulsory.pure(),
    this.compensationDetails = "",
    this.happyWithCompensation = const Compulsory.pure(),
    this.resettlementPlan = const Compulsory.pure(),
    this.resettlementOpinion = "",
    this.reloadToggle = false,
  });

  final Compulsory oclAcquiring;
  final Compulsory looseLand;
  final Compulsory totalLandToLoose;
  final Map<String, dynamic> landHoldingLost;
  final Compulsory gotNotification;
  final Compulsory whatAction;
  final Compulsory givenConsent;
  final String reason;
  final Compulsory aware;
  final Compulsory gramsabha;
  final Compulsory participate;
  final String resolution;
  final Compulsory compensationAware;
  final String compensationDetails;
  final Compulsory happyWithCompensation;
  final Compulsory resettlementPlan;
  final String resettlementOpinion;
  final bool reloadToggle;

  @override
  List<Object> get props {
    return [
      oclAcquiring,
      looseLand,
      totalLandToLoose,
      landHoldingLost,
      gotNotification,
      whatAction,
      givenConsent,
      reason,
      aware,
      gramsabha,
      participate,
      resolution,
      compensationAware,
      compensationDetails,
      happyWithCompensation,
      resettlementPlan,
      resettlementOpinion,
      reloadToggle,
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
      'totalLandToLoose': state.totalLandToLoose.value,
      'landHoldingLost': state.landHoldingLost,
      'gotNotification': state.gotNotification.value,
      'whatAction': state.whatAction.value,
      'givenConsent': state.givenConsent.value,
      'reason': state.reason,
      'aware': state.aware.value,
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
      totalLandToLoose: Compulsory.dirty(map['totalLandToLoose'] ?? ''),
      landHoldingLost: map['landHoldingLost'],
      gotNotification: Compulsory.dirty(map['gotNotification']),
      whatAction: Compulsory.dirty(map['whatAction']),
      givenConsent: Compulsory.dirty(map['givenConsent']),
      reason: map['reason'],
      aware: Compulsory.dirty(map['aware']),
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
    Compulsory? totalLandToLoose,
    Map<String, dynamic>? landHoldingLost,
    Compulsory? gotNotification,
    Compulsory? whatAction,
    Compulsory? givenConsent,
    String? reason,
    Compulsory? aware,
    Compulsory? gramsabha,
    Compulsory? participate,
    String? resolution,
    Compulsory? compensationAware,
    String? compensationDetails,
    Compulsory? happyWithCompensation,
    Compulsory? resettlementPlan,
    String? resettlementOpinion,
    bool? reloadToggle,
  }) {
    return SectionFiveState(
      oclAcquiring: oclAcquiring ?? this.oclAcquiring,
      looseLand: looseLand ?? this.looseLand,
      totalLandToLoose: totalLandToLoose ?? this.totalLandToLoose,
      landHoldingLost: landHoldingLost ?? this.landHoldingLost,
      gotNotification: gotNotification ?? this.gotNotification,
      whatAction: whatAction ?? this.whatAction,
      givenConsent: givenConsent ?? this.givenConsent,
      reason: reason ?? this.reason,
      aware: aware ?? this.aware,
      gramsabha: gramsabha ?? this.gramsabha,
      participate: participate ?? this.participate,
      resolution: resolution ?? this.resolution,
      compensationAware: compensationAware ?? this.compensationAware,
      compensationDetails: compensationDetails ?? this.compensationDetails,
      happyWithCompensation:
          happyWithCompensation ?? this.happyWithCompensation,
      resettlementPlan: resettlementPlan ?? this.resettlementPlan,
      resettlementOpinion: resettlementOpinion ?? this.resettlementOpinion,
      reloadToggle: reloadToggle ?? this.reloadToggle,
    );
  }
}
