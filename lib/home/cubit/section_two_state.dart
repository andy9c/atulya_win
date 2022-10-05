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

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'generationCount': generationCount.value,
      'ownLand': ownLand.value,
      'yesName': yesName,
      'noName': noName,
      'relationship': relationship.value,
      'isAlive': isAlive.value,
      'countChulha': countChulha.value,
      'totalPeople': totalPeople.value,
      'landHolding': landHolding,
      'cultivateAnabadi': cultivateAnabadi.value,
      'yearsAnabadi': yearsAnabadi,
      'appliedOwnership': appliedOwnership.value,
      'receivedEntitlement': receivedEntitlement.value,
      'cropTypes': cropTypes,
    };
  }

  factory SectionTwoState.fromMap(Map<String, dynamic> map) {
    return SectionTwoState(
      generationCount: map['generationCount'],
      ownLand: map['ownLand'],
      yesName: map['yesName'],
      noName: map['noName'],
      relationship: map['relationship'],
      isAlive: map['isAlive'],
      countChulha: map['countChulha'],
      totalPeople: map['totalPeople'],
      landHolding: map['landHolding'],
      cultivateAnabadi: map['cultivateAnabadi'],
      yearsAnabadi: map['yearsAnabadi'],
      appliedOwnership: map['appliedOwnership'],
      receivedEntitlement: map['receivedEntitlement'],
      cropTypes: map['cropTypes'],
    );
  }
  String toJson() => json.encode(toMap());
  factory SectionTwoState.fromJson(String source) =>
      SectionTwoState.fromMap(json.decode(source));

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
