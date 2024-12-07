part of 'section_one_cubit.dart';

class SectionOneState extends Equatable with FormzMixin {
  const SectionOneState({
    this.fullName = const Compulsory.pure(),
    this.relationship = const Compulsory.pure(),
    this.headOfHousehold = const Compulsory.pure(),
    this.age = const Compulsory.pure(),
    this.gender = const Compulsory.pure(),
    this.religion = const Compulsory.pure(),
    this.socialCategory = const Compulsory.pure(),
    this.nameOfCommunity = const Compulsory.pure(),
    this.villageName = const Compulsory.pure(),
    this.gramPanchayat = const Compulsory.pure(),
    this.cardholderCategory = const Compulsory.pure(),
    this.qualification = const Compulsory.pure(),
    this.primaryOccupation = const Compulsory.pure(),
    this.secondaryOccupation = const Compulsory.pure(),
    this.familyMemberDetails = const {},
    this.reloadToggle = false,
  });

  final Compulsory fullName;
  final Compulsory relationship;
  final Compulsory headOfHousehold;
  final Compulsory age;
  final Compulsory gender;
  final Compulsory religion;
  final Compulsory socialCategory;
  final Compulsory nameOfCommunity;
  final Compulsory villageName;
  final Compulsory gramPanchayat;
  final Compulsory cardholderCategory;
  final Compulsory qualification;
  final Compulsory primaryOccupation;
  final Compulsory secondaryOccupation;
  final Map<String, dynamic> familyMemberDetails;
  final bool reloadToggle;

  @override
  List<Object> get props {
    return [
      fullName,
      relationship,
      headOfHousehold,
      age,
      gender,
      religion,
      socialCategory,
      nameOfCommunity,
      villageName,
      gramPanchayat,
      cardholderCategory,
      qualification,
      primaryOccupation,
      secondaryOccupation,
      familyMemberDetails,
      reloadToggle,
    ];
  }

  SectionOneState copyWith({
    Compulsory? fullName,
    Compulsory? relationship,
    Compulsory? headOfHousehold,
    Compulsory? age,
    Compulsory? gender,
    Compulsory? religion,
    Compulsory? socialCategory,
    Compulsory? nameOfCommunity,
    Compulsory? villageName,
    Compulsory? gramPanchayat,
    Compulsory? cardholderCategory,
    Compulsory? qualification,
    Compulsory? primaryOccupation,
    Compulsory? secondaryOccupation,
    Map<String, dynamic>? familyMemberDetails,
    bool? reloadToggle,
  }) {
    return SectionOneState(
      fullName: fullName ?? this.fullName,
      relationship: relationship ?? this.relationship,
      headOfHousehold: headOfHousehold ?? this.headOfHousehold,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      religion: religion ?? this.religion,
      socialCategory: socialCategory ?? this.socialCategory,
      nameOfCommunity: nameOfCommunity ?? this.nameOfCommunity,
      villageName: villageName ?? this.villageName,
      gramPanchayat: gramPanchayat ?? this.gramPanchayat,
      cardholderCategory: cardholderCategory ?? this.cardholderCategory,
      qualification: qualification ?? this.qualification,
      primaryOccupation: primaryOccupation ?? this.primaryOccupation,
      secondaryOccupation: secondaryOccupation ?? this.secondaryOccupation,
      familyMemberDetails: familyMemberDetails ?? this.familyMemberDetails,
      reloadToggle: reloadToggle ?? this.reloadToggle,
    );
  }

  static Map<String, dynamic> toMap(SectionOneState state) {
    return {
      'fullName': state.fullName.value,
      'relationship': state.relationship.value,
      'headOfHousehold': state.headOfHousehold.value,
      'age': state.age.value,
      'gender': state.gender.value,
      'religion': state.religion.value,
      'socialCategory': state.socialCategory.value,
      'nameOfCommunity': state.nameOfCommunity.value,
      'villageName': state.villageName.value,
      'gramPanchayat': state.gramPanchayat.value,
      'cardholderCategory': state.cardholderCategory.value,
      'qualification': state.qualification.value,
      'primaryOccupation': state.primaryOccupation.value,
      'secondaryOccupation': state.secondaryOccupation.value,
      'familyMemberDetails': state.familyMemberDetails,
    };
  }

  factory SectionOneState.fromMap(Map<String, dynamic> map) {
    return SectionOneState(
      fullName: Compulsory.dirty(map['fullName']),
      relationship: Compulsory.dirty(map['relationship']),
      headOfHousehold: Compulsory.dirty(map['headOfHousehold']),
      age: Compulsory.dirty(map['age']),
      gender: Compulsory.dirty(map['gender']),
      religion: Compulsory.dirty(map['religion']),
      socialCategory: Compulsory.dirty(map['socialCategory']),
      nameOfCommunity: Compulsory.dirty(map['nameOfCommunity']),
      villageName: Compulsory.dirty(map['villageName']),
      gramPanchayat: Compulsory.dirty(map['gramPanchayat']),
      cardholderCategory: Compulsory.dirty(map['cardholderCategory']),
      qualification: Compulsory.dirty(map['qualification']),
      primaryOccupation: Compulsory.dirty(map['primaryOccupation']),
      secondaryOccupation: Compulsory.dirty(map['secondaryOccupation']),
      familyMemberDetails: map['familyMemberDetails'],
    );
  }

  @override
  List<FormzInput> get inputs => [
        fullName,
        relationship,
        headOfHousehold,
        age,
        gender,
        religion,
        socialCategory,
        nameOfCommunity,
        villageName,
        gramPanchayat,
        cardholderCategory,
        qualification,
        primaryOccupation,
        secondaryOccupation,
      ];
}
