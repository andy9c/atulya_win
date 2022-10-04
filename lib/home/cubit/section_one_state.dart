part of 'section_one_cubit.dart';

class SectionOneState extends Equatable with FormzMixin {
  const SectionOneState({
    this.pattaNo = const Compulsory.pure(),
    this.fullName = const Compulsory.pure(),
    this.relationship = const Compulsory.pure(),
    this.headOfHousehold = const Compulsory.pure(),
    this.age = const Compulsory.pure(),
    this.gender = const Compulsory.pure(),
    this.religion = const Compulsory.pure(),
    this.socialCategory = const Compulsory.pure(),
    this.nameOfCommunity = const Compulsory.pure(),
    this.gramPanchayat = const Compulsory.pure(),
    this.cardholderCategory = const Compulsory.pure(),
    this.qualification = const Compulsory.pure(),
    this.primaryOccupation = const Compulsory.pure(),
    this.secondaryOccupation = const Compulsory.pure(),
    this.familyMemberDetails = const {},
  });

  final Compulsory pattaNo;
  final Compulsory fullName;
  final Compulsory relationship;
  final Compulsory headOfHousehold;
  final Compulsory age;
  final Compulsory gender;
  final Compulsory religion;
  final Compulsory socialCategory;
  final Compulsory nameOfCommunity;
  final Compulsory gramPanchayat;
  final Compulsory cardholderCategory;
  final Compulsory qualification;
  final Compulsory primaryOccupation;
  final Compulsory secondaryOccupation;
  final Map<String, dynamic> familyMemberDetails;

  @override
  List<Object> get props {
    return [
      pattaNo,
      fullName,
      relationship,
      headOfHousehold,
      age,
      gender,
      religion,
      socialCategory,
      nameOfCommunity,
      gramPanchayat,
      cardholderCategory,
      qualification,
      primaryOccupation,
      secondaryOccupation,
      familyMemberDetails,
    ];
  }

  SectionOneState copyWith({
    Compulsory? pattaNo,
    Compulsory? fullName,
    Compulsory? relationship,
    Compulsory? headOfHousehold,
    Compulsory? age,
    Compulsory? gender,
    Compulsory? religion,
    Compulsory? socialCategory,
    Compulsory? nameOfCommunity,
    Compulsory? gramPanchayat,
    Compulsory? cardholderCategory,
    Compulsory? qualification,
    Compulsory? primaryOccupation,
    Compulsory? secondaryOccupation,
    Map<String, dynamic>? familyMemberDetails,
  }) {
    return SectionOneState(
      pattaNo: pattaNo ?? this.pattaNo,
      fullName: fullName ?? this.fullName,
      relationship: relationship ?? this.relationship,
      headOfHousehold: headOfHousehold ?? this.headOfHousehold,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      religion: religion ?? this.religion,
      socialCategory: socialCategory ?? this.socialCategory,
      nameOfCommunity: nameOfCommunity ?? this.nameOfCommunity,
      gramPanchayat: gramPanchayat ?? this.gramPanchayat,
      cardholderCategory: cardholderCategory ?? this.cardholderCategory,
      qualification: qualification ?? this.qualification,
      primaryOccupation: primaryOccupation ?? this.primaryOccupation,
      secondaryOccupation: secondaryOccupation ?? this.secondaryOccupation,
      familyMemberDetails: familyMemberDetails ?? this.familyMemberDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pattaNo': pattaNo,
      'fullName': fullName,
      'relationship': relationship,
      'headOfHousehold': headOfHousehold,
      'age': age,
      'gender': gender,
      'religion': religion,
      'socialCategory': socialCategory,
      'nameOfCommunity': nameOfCommunity,
      'gramPanchayat': gramPanchayat,
      'cardholderCategory': cardholderCategory,
      'qualification': qualification,
      'primaryOccupation': primaryOccupation,
      'secondaryOccupation': secondaryOccupation,
      'familyMemberDetails': familyMemberDetails,
    };
  }

  factory SectionOneState.fromMap(Map<String, dynamic> map) {
    return SectionOneState(
      pattaNo: map['pattaNo'],
      fullName: map['fullName'],
      relationship: map['relationship'],
      headOfHousehold: map['headOfHousehold'],
      age: map['age'],
      gender: map['gender'],
      religion: map['religion'],
      socialCategory: map['socialCategory'],
      nameOfCommunity: map['nameOfCommunity'],
      gramPanchayat: map['gramPanchayat'],
      cardholderCategory: map['cardholderCategory'],
      qualification: map['qualification'],
      primaryOccupation: map['primaryOccupation'],
      secondaryOccupation: map['secondaryOccupation'],
      familyMemberDetails: map['familyMemberDetails'],
    );
  }
  String toJson() => json.encode(toMap());
  factory SectionOneState.fromJson(String source) =>
      SectionOneState.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<FormzInput> get inputs => [
        pattaNo,
        fullName,
        relationship,
        headOfHousehold,
        age,
        gender,
        religion,
        socialCategory,
        nameOfCommunity,
        gramPanchayat,
        cardholderCategory,
        qualification,
        primaryOccupation,
        secondaryOccupation,
      ];
}
