part of 'family_member_cubit.dart';

class FamilyMemberState extends Equatable with FormzMixin {
  const FamilyMemberState({
    this.name = const Compulsory.pure(),
    this.relationship = const Compulsory.pure(),
    this.age = const Compulsory.pure(),
    this.gender = const Compulsory.pure(),
    this.qualification = const Compulsory.pure(),
    this.occupation = const Compulsory.pure(),
  });

  final Compulsory name;
  final Compulsory relationship;
  final Compulsory age;
  final Compulsory gender;
  final Compulsory qualification;
  final Compulsory occupation;

  @override
  List<Object> get props {
    return [
      name,
      relationship,
      age,
      gender,
      qualification,
      occupation,
    ];
  }

  FamilyMemberState copyWith({
    Compulsory? name,
    Compulsory? relationship,
    Compulsory? age,
    Compulsory? gender,
    Compulsory? qualification,
    Compulsory? occupation,
  }) {
    return FamilyMemberState(
      name: name ?? this.name,
      relationship: relationship ?? this.relationship,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      qualification: qualification ?? this.qualification,
      occupation: occupation ?? this.occupation,
    );
  }

  static Map<String, dynamic> toMap(FamilyMemberState state) {
    return {
      'name': state.name.value,
      'relationship': state.relationship.value,
      'age': state.age.value,
      'gender': state.gender.value,
      'qualification': state.qualification.value,
      'occupation': state.occupation.value,
    };
  }

  factory FamilyMemberState.fromMap(Map<String, dynamic> map) {
    return FamilyMemberState(
      name: Compulsory.dirty(map['name']),
      relationship: Compulsory.dirty(map['relationship']),
      age: Compulsory.dirty(map['age']),
      gender: Compulsory.dirty(map['gender']),
      qualification: Compulsory.dirty(map['qualification']),
      occupation: Compulsory.dirty(map['occupation']),
    );
  }

  @override
  List<FormzInput> get inputs => [
        name,
        relationship,
        age,
        gender,
        qualification,
        occupation,
      ];
}
