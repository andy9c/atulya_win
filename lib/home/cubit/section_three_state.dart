part of 'section_three_cubit.dart';

class SectionThreeState extends Equatable with FormzMixin {
  const SectionThreeState({
    this.incomeSources = const Compulsory.pure(),
    this.otherAssetsCount = const {},
    this.annualIncome = const Compulsory.pure(),
    this.cropsPattern = const {},
    this.vegetablesPattern = const {},
    this.forestProduce = const [],
    this.otherForestProduce = "",
    this.freshWaterItems = const [],
    this.otherFreshWaterItems = "",
  });

  final Compulsory incomeSources;
  final Map<String, dynamic> otherAssetsCount;
  final Compulsory annualIncome;
  final Map<String, dynamic> cropsPattern;
  final Map<String, dynamic> vegetablesPattern;
  final List<dynamic> forestProduce;
  final String otherForestProduce;
  final List<dynamic> freshWaterItems;
  final String otherFreshWaterItems;

  @override
  List<Object> get props {
    return [
      incomeSources,
      otherAssetsCount,
      annualIncome,
      cropsPattern,
      vegetablesPattern,
      forestProduce,
      otherForestProduce,
      freshWaterItems,
      otherFreshWaterItems,
    ];
  }

  SectionThreeState copyWith({
    Compulsory? incomeSources,
    Map<String, dynamic>? otherAssetsCount,
    Compulsory? annualIncome,
    Map<String, dynamic>? cropsPattern,
    Map<String, dynamic>? vegetablesPattern,
    List<String>? forestProduce,
    String? otherForestProduce,
    List<String>? freshWaterItems,
    String? otherFreshWaterItems,
  }) {
    return SectionThreeState(
      incomeSources: incomeSources ?? this.incomeSources,
      otherAssetsCount: otherAssetsCount ?? this.otherAssetsCount,
      annualIncome: annualIncome ?? this.annualIncome,
      cropsPattern: cropsPattern ?? this.cropsPattern,
      vegetablesPattern: vegetablesPattern ?? this.vegetablesPattern,
      forestProduce: forestProduce ?? this.forestProduce,
      otherForestProduce: otherForestProduce ?? this.otherForestProduce,
      freshWaterItems: freshWaterItems ?? this.freshWaterItems,
      otherFreshWaterItems: otherFreshWaterItems ?? this.otherFreshWaterItems,
    );
  }

  static Map<String, dynamic> toMap(SectionThreeState state) {
    return {
      'incomeSources': state.incomeSources.value,
      'otherAssetsCount': state.otherAssetsCount,
      'annualIncome': state.annualIncome.value,
      'cropsPattern': state.cropsPattern,
      'vegetablesPattern': state.vegetablesPattern,
      'forestProduce': state.forestProduce,
      'otherForestProduce': state.otherForestProduce,
      'freshWaterItems': state.freshWaterItems,
      'otherFreshWaterItems': state.otherFreshWaterItems,
    };
  }

  factory SectionThreeState.fromMap(Map<String, dynamic> map) {
    return SectionThreeState(
      incomeSources: Compulsory.dirty(map['incomeSources']),
      otherAssetsCount: map['otherAssetsCount'],
      annualIncome: Compulsory.dirty(map['annualIncome']),
      cropsPattern: map['cropsPattern'],
      vegetablesPattern: map['vegetablesPattern'],
      forestProduce: map['forestProduce'],
      otherForestProduce: map['otherForestProduce'],
      freshWaterItems: map['freshWaterItems'],
      otherFreshWaterItems: map['otherFreshWaterItems'],
    );
  }

  @override
  List<FormzInput> get inputs => [incomeSources, annualIncome];
}
