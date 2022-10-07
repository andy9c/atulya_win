part of 'section_two_cubit.dart';

class SectionTwoState extends Equatable with FormzMixin {
  const SectionTwoState({
    this.generationCount = const Compulsory.pure(),
    this.ownLand = const Compulsory.pure(),
    this.yesName = "",
    this.noName = "",
    this.relationship = const Compulsory.pure(),
    this.isAlive = const Compulsory.pure(),
    this.countChulha = const Compulsory.pure(),
    this.totalPeople = const Compulsory.pure(),
    this.landHolding = const {},
    this.cultivateAnabadi = const Compulsory.pure(),
    this.yearsAnabadi = "",
    this.appliedOwnership = const Compulsory.pure(),
    this.receivedEntitlement = const Compulsory.pure(),
    this.cropTypes = "",
  });

  final Compulsory generationCount;
  final Compulsory ownLand;
  final String yesName;
  final String noName;
  final Compulsory relationship;
  final Compulsory isAlive;
  final Compulsory countChulha;
  final Compulsory totalPeople;
  final Map<String, dynamic> landHolding;
  final Compulsory cultivateAnabadi;
  final String yearsAnabadi;
  final Compulsory appliedOwnership;
  final Compulsory receivedEntitlement;
  final String cropTypes;

  @override
  List<Object> get props {
    return [
      generationCount,
      ownLand,
      yesName,
      noName,
      relationship,
      isAlive,
      countChulha,
      totalPeople,
      landHolding,
      cultivateAnabadi,
      yearsAnabadi,
      appliedOwnership,
      receivedEntitlement,
      cropTypes,
    ];
  }

  SectionTwoState copyWith({
    Compulsory? generationCount,
    Compulsory? ownLand,
    String? yesName,
    String? noName,
    Compulsory? relationship,
    Compulsory? isAlive,
    Compulsory? countChulha,
    Compulsory? totalPeople,
    Map<String, dynamic>? landHolding,
    Compulsory? cultivateAnabadi,
    String? yearsAnabadi,
    Compulsory? appliedOwnership,
    Compulsory? receivedEntitlement,
    String? cropTypes,
  }) {
    return SectionTwoState(
      generationCount: generationCount ?? this.generationCount,
      ownLand: ownLand ?? this.ownLand,
      yesName: yesName ?? this.yesName,
      noName: noName ?? this.noName,
      relationship: relationship ?? this.relationship,
      isAlive: isAlive ?? this.isAlive,
      countChulha: countChulha ?? this.countChulha,
      totalPeople: totalPeople ?? this.totalPeople,
      landHolding: landHolding ?? this.landHolding,
      cultivateAnabadi: cultivateAnabadi ?? this.cultivateAnabadi,
      yearsAnabadi: yearsAnabadi ?? this.yearsAnabadi,
      appliedOwnership: appliedOwnership ?? this.appliedOwnership,
      receivedEntitlement: receivedEntitlement ?? this.receivedEntitlement,
      cropTypes: cropTypes ?? this.cropTypes,
    );
  }

  static Map<String, dynamic> toMap(SectionTwoState state) {
    return {
      'generationCount': state.generationCount.value,
      'ownLand': state.ownLand.value,
      'yesName': state.yesName,
      'noName': state.noName,
      'relationship': state.relationship.value,
      'isAlive': state.isAlive.value,
      'countChulha': state.countChulha.value,
      'totalPeople': state.totalPeople.value,
      'landHolding': state.landHolding,
      'cultivateAnabadi': state.cultivateAnabadi.value,
      'yearsAnabadi': state.yearsAnabadi,
      'appliedOwnership': state.appliedOwnership.value,
      'receivedEntitlement': state.receivedEntitlement.value,
      'cropTypes': state.cropTypes,
    };
  }

  factory SectionTwoState.fromMap(Map<String, dynamic> map) {
    return SectionTwoState(
      generationCount: Compulsory.dirty(map['generationCount']),
      ownLand: Compulsory.dirty(map['ownLand']),
      yesName: map['yesName'],
      noName: map['noName'],
      relationship: Compulsory.dirty(map['relationship']),
      isAlive: Compulsory.dirty(map['isAlive']),
      countChulha: Compulsory.dirty(map['countChulha']),
      totalPeople: Compulsory.dirty(map['totalPeople']),
      landHolding: map['landHolding'],
      cultivateAnabadi: Compulsory.dirty(map['cultivateAnabadi']),
      yearsAnabadi: map['yearsAnabadi'],
      appliedOwnership: Compulsory.dirty(map['appliedOwnership']),
      receivedEntitlement: Compulsory.dirty(map['receivedEntitlement']),
      cropTypes: map['cropTypes'],
    );
  }

  @override
  List<FormzInput> get inputs => [
        generationCount,
        ownLand,
        relationship,
        isAlive,
        countChulha,
        totalPeople,
        cultivateAnabadi,
        appliedOwnership,
        receivedEntitlement,
      ];
}
