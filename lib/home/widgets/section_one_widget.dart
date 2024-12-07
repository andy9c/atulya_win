import 'package:atulya/home/cubit/cubit.dart';
import 'package:atulya/home/home.dart';
import 'package:atulya/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sizer/sizer.dart';

class VillageName extends StatefulWidget {
  const VillageName({super.key});

  @override
  State<VillageName> createState() => _VillageNameState();
}

class _VillageNameState extends State<VillageName> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.villageName != current.villageName,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 5.w,
          ),
          child: TextFormField(
            enabled: context.read<InformaticsCubit>().state.isEnabled,
            key: const Key('sectionOne_villageName'),
            inputFormatters: [
              nameFormat(),
              UpperCaseFormatter(),
            ],
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.characters,
            controller: _controller = TextEditingController()
              ..text = state.villageName.value ?? ''
              ..selection = TextSelection.fromPosition(
                TextPosition(
                  offset: state.villageName.value == null
                      ? 0
                      : _controller.selection.base.offset >
                              state.villageName.value.length
                          ? state.villageName.value.length
                          : _controller.selection.base.offset,
                ),
              ),
            // initialValue: state.name.value,
            onChanged: (value) =>
                context.read<SectionOneCubit>().villageNameChanged(value),
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                child: Icon(Icons.place_rounded, color: Colors.lightBlue),
              ),
              border: const OutlineInputBorder(),
              labelText: "Village Name",
              helperText: '',
              errorText: state.villageName.invalid ? 'required field' : null,
            ),
          ),
        );
      },
    );
  }
}

class MemberName extends StatefulWidget {
  const MemberName({super.key});

  @override
  State<MemberName> createState() => _MemberNameState();
}

class _MemberNameState extends State<MemberName> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          enabled: context.read<InformaticsCubit>().state.isEnabled,
          key: const Key('sectionOne_familyMember_name'),
          inputFormatters: [
            nameFormat(),
            UpperCaseFormatter(),
          ],
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.characters,
          controller: _controller = TextEditingController()
            ..text = state.name.value ?? ''
            ..selection = TextSelection.fromPosition(
              TextPosition(
                offset: state.name.value == null
                    ? 0
                    : _controller.selection.base.offset >
                            state.name.value.length
                        ? state.name.value.length
                        : _controller.selection.base.offset,
              ),
            ),
          // initialValue: state.name.value,
          onChanged: (value) =>
              context.read<FamilyMemberCubit>().nameChanged(value),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.place_rounded, color: Colors.lightBlue),
            ),
            border: const OutlineInputBorder(),
            labelText: "Name",
            helperText: '',
            errorText: state.name.invalid ? 'required field' : null,
          ),
        );
      },
    );
  }
}

class MemberRelationship extends StatefulWidget {
  const MemberRelationship({super.key});

  @override
  State<MemberRelationship> createState() => _MemberRelationshipState();
}

class _MemberRelationshipState extends State<MemberRelationship> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
      buildWhen: (previous, current) =>
          previous.relationship != current.relationship,
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          key: const Key('SectionOne_familyMember_relationship'),
          value: state.relationship.value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_downward_rounded),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.connect_without_contact_rounded,
                  color: Colors.lightBlue),
            ),
            border: const OutlineInputBorder(),
            labelText: "Relationship with head",
            helperText: '',
            errorText: state.relationship.invalid ? 'required field' : null,
          ),
          onChanged: !context.read<InformaticsCubit>().state.isEnabled
              ? null
              : (value) =>
                  context.read<FamilyMemberCubit>().relationshipChanged(value!),
          items: relationshipList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            "Please select relationship",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}

class MemberAge extends StatefulWidget {
  const MemberAge({super.key});

  @override
  State<MemberAge> createState() => _MemberAgeState();
}

class _MemberAgeState extends State<MemberAge> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
      buildWhen: (previous, current) => previous.age != current.age,
      builder: (context, state) {
        return TextFormField(
          enabled: context.read<InformaticsCubit>().state.isEnabled,
          key: const Key('SectionOne_familyMember_age'),
          inputFormatters: [
            intFormat(),
          ],
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.characters,
          keyboardType: TextInputType.number,
          controller: _controller = TextEditingController()
            ..text = state.age.value ?? ''
            ..selection = TextSelection.fromPosition(
              TextPosition(
                offset: state.age.value == null
                    ? 0
                    : _controller.selection.base.offset > state.age.value.length
                        ? state.age.value.length
                        : _controller.selection.base.offset,
              ),
            ),
          // initialValue: state.age.value,
          onChanged: (value) =>
              context.read<FamilyMemberCubit>().ageChanged(value),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.place_rounded, color: Colors.lightBlue),
            ),
            border: const OutlineInputBorder(),
            labelText: "Age",
            helperText: '',
            errorText: state.age.invalid ? 'required field' : null,
          ),
        );
      },
    );
  }
}

class MemberGender extends StatefulWidget {
  const MemberGender({super.key});

  @override
  State<MemberGender> createState() => _MemberGenderState();
}

class _MemberGenderState extends State<MemberGender> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          key: const Key('SectionOne_familyMember_gender'),
          value: state.gender.value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_downward_rounded),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.connect_without_contact_rounded,
                  color: Colors.lightBlue),
            ),
            border: const OutlineInputBorder(),
            labelText: "Gender",
            helperText: '',
            errorText: state.gender.invalid ? 'required field' : null,
          ),
          onChanged: !context.read<InformaticsCubit>().state.isEnabled
              ? null
              : (value) =>
                  context.read<FamilyMemberCubit>().genderChanged(value!),
          items: genderList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            "Please select gender",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}

class MemberQualification extends StatefulWidget {
  const MemberQualification({super.key});

  @override
  State<MemberQualification> createState() => _MemberQualificationState();
}

class _MemberQualificationState extends State<MemberQualification> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
      buildWhen: (previous, current) =>
          previous.qualification != current.qualification,
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          key: const Key('SectionOne_familyMember_qualification'),
          value: state.qualification.value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_downward_rounded),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.connect_without_contact_rounded,
                  color: Colors.lightBlue),
            ),
            border: const OutlineInputBorder(),
            labelText: "Qualification",
            helperText: '',
            errorText: state.qualification.invalid ? 'required field' : null,
          ),
          onChanged: !context.read<InformaticsCubit>().state.isEnabled
              ? null
              : (value) => context
                  .read<FamilyMemberCubit>()
                  .qualificationChanged(value!),
          items:
              qualificationList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            "Please select qualification",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}

class MemberOccupation extends StatefulWidget {
  const MemberOccupation({super.key});

  @override
  State<MemberOccupation> createState() => _MemberOccupationState();
}

class _MemberOccupationState extends State<MemberOccupation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
      buildWhen: (previous, current) =>
          previous.occupation != current.occupation,
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          key: const Key('SectionOne_familyMember_occupation'),
          isExpanded: true,
          value: state.occupation.value,
          icon: const Icon(Icons.arrow_downward_rounded),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.connect_without_contact_rounded,
                  color: Colors.lightBlue),
            ),
            border: const OutlineInputBorder(),
            labelText: "Occupation",
            helperText: '',
            errorText: state.occupation.invalid ? 'required field' : null,
          ),
          onChanged: !context.read<InformaticsCubit>().state.isEnabled
              ? null
              : (value) =>
                  context.read<FamilyMemberCubit>().occupationChanged(value!),
          items: professionList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            "Please select occupation",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}

class RespondentFullName extends StatefulWidget {
  const RespondentFullName({Key? key}) : super(key: key);

  @override
  State<RespondentFullName> createState() => _RespondentFullNameState();
}

class _RespondentFullNameState extends State<RespondentFullName> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) => previous.fullName != current.fullName,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: TextFormField(
              enabled: context.read<InformaticsCubit>().state.isEnabled,
              inputFormatters: [
                nameFormat(),
                UpperCaseFormatter(),
              ],
              key: const Key('sectionOne_fullName'),
              // initialValue: state.fullName.value,
              controller: _controller = TextEditingController()
                ..text = state.fullName.value ?? ''
                ..selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: state.fullName.value == null
                        ? 0
                        : _controller.selection.base.offset >
                                state.fullName.value.length
                            ? state.fullName.value.length
                            : _controller.selection.base.offset,
                  ),
                ),
              maxLines: 1,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.next,
              onChanged: (value) =>
                  context.read<SectionOneCubit>().fullNameChanged(value),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Respondent's Full Name",
                helperText: '',
                errorText: state.fullName.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class HeadOfHousehold extends StatefulWidget {
  const HeadOfHousehold({Key? key}) : super(key: key);

  @override
  State<HeadOfHousehold> createState() => _HeadOfHouseholdState();
}

class _HeadOfHouseholdState extends State<HeadOfHousehold> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.headOfHousehold != current.headOfHousehold,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: TextFormField(
              enabled: context.read<InformaticsCubit>().state.isEnabled,
              inputFormatters: [
                nameFormat(),
                UpperCaseFormatter(),
              ],
              key: const Key('sectionOne_head'),
              // initialValue: state.headOfHousehold.value,
              controller: _controller = TextEditingController()
                ..text = state.headOfHousehold.value ?? ''
                ..selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: state.headOfHousehold.value == null
                        ? 0
                        : _controller.selection.base.offset >
                                state.headOfHousehold.value.length
                            ? state.headOfHousehold.value.length
                            : _controller.selection.base.offset,
                  ),
                ),
              maxLines: 1,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.next,
              onChanged: (value) =>
                  context.read<SectionOneCubit>().headOfHouseholdChanged(value),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Head of the household (Full Name)",
                helperText: '',
                errorText:
                    state.headOfHousehold.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class RespondentAge extends StatefulWidget {
  const RespondentAge({Key? key}) : super(key: key);

  @override
  State<RespondentAge> createState() => _RespondentAgeState();
}

class _RespondentAgeState extends State<RespondentAge> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) => previous.age != current.age,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: TextFormField(
              enabled: context.read<InformaticsCubit>().state.isEnabled,
              inputFormatters: [
                intFormat(),
              ],
              key: const Key('sectionOne_age'),
              maxLines: 1,
              showCursor: true,
              readOnly: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              // initialValue: state.age.value,
              controller: _controller = TextEditingController()
                ..text = state.age.value ?? ''
                ..selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: state.age.value == null
                        ? 0
                        : _controller.selection.base.offset >
                                state.age.value.length
                            ? state.age.value.length
                            : _controller.selection.base.offset,
                  ),
                ),
              onChanged: (value) =>
                  context.read<SectionOneCubit>().ageChanged(value),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.calendar_today_rounded,
                      color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Respondent's Age",
                helperText: '',
                errorText: state.age.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CommunityName extends StatefulWidget {
  const CommunityName({Key? key}) : super(key: key);

  @override
  State<CommunityName> createState() => _CommunityNameState();
}

class _CommunityNameState extends State<CommunityName> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.nameOfCommunity != current.nameOfCommunity,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_communityName'),
              isExpanded: true,
              value: state.nameOfCommunity.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.group, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Name of the Community",
                helperText: '',
                errorText:
                    state.nameOfCommunity.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? community) {
                      context
                          .read<SectionOneCubit>()
                          .nameOfCommunityChanged(community!);
                    },
              items:
                  communityList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Community Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GenderSelection extends StatelessWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_gender'),
              isExpanded: true,
              value: state.gender.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Gender",
                helperText: '',
                errorText: state.gender.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? gender) {
                      context.read<SectionOneCubit>().genderChanged(gender!);
                    },
              items: genderList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Gender",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RespondentRelationship extends StatelessWidget {
  const RespondentRelationship({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.relationship != current.relationship,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_relationship'),
              isExpanded: true,
              value: state.relationship.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.connect_without_contact_rounded,
                      color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Respondent relation with the head of household",
                helperText: '',
                errorText: state.relationship.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? motherTongue) => context
                      .read<SectionOneCubit>()
                      .relationshipChanged(motherTongue!),
              items: relationshipList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select relationship",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GramPanchayat extends StatelessWidget {
  const GramPanchayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.gramPanchayat != current.gramPanchayat,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_gramPanchayat'),
              isExpanded: true,
              value: state.gramPanchayat.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.place_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Gram Panchayat",
                helperText: '',
                errorText:
                    state.gramPanchayat.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? bloodGroup) => context
                      .read<SectionOneCubit>()
                      .gramPanchayatChanged(bloodGroup!),
              items:
                  bloodGroupList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Gram Panchayat",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReligionSelection extends StatelessWidget {
  const ReligionSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) => previous.religion != current.religion,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_religion'),
              isExpanded: true,
              value: state.religion.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.self_improvement_rounded,
                      color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Religion",
                helperText: '',
                errorText: state.religion.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? religion) => context
                      .read<SectionOneCubit>()
                      .religionChanged(religion!),
              items: religionList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Religion",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SocialCategorySelection extends StatelessWidget {
  const SocialCategorySelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.socialCategory != current.socialCategory,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_socialCategory'),
              isExpanded: true,
              value: state.socialCategory.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.group_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Social Category",
                helperText: '',
                errorText:
                    state.socialCategory.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? socialCategory) => context
                      .read<SectionOneCubit>()
                      .socialCategoryChanged(socialCategory!),
              items: socialCategoryList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Social Category",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CardHolder extends StatelessWidget {
  const CardHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.cardholderCategory != current.cardholderCategory,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_cardHolder'),
              isExpanded: true,
              value: state.cardholderCategory.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.credit_card, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Cardholder Category",
                helperText: '',
                errorText:
                    state.cardholderCategory.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? value) {
                      context.read<SectionOneCubit>().cardholderChanged(value!);
                    },
              items: hasAadharCardList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select cardholder category",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RespondentQualification extends StatelessWidget {
  const RespondentQualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.qualification != current.qualification,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_qualification'),
              isExpanded: true,
              value: state.qualification.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.menu_book_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Respondent's Qualification",
                helperText: '',
                errorText:
                    state.qualification.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? value) => context
                      .read<SectionOneCubit>()
                      .qualificationChanged(value!),
              items: qualificationList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Respondent's Qualification",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RespondentPrimaryOccupation extends StatelessWidget {
  const RespondentPrimaryOccupation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.primaryOccupation != current.primaryOccupation,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_primaryOccupation'),
              isExpanded: true,
              value: state.primaryOccupation.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child:
                      Icon(Icons.engineering_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Respondent's Primary Occupation",
                helperText: '',
                errorText:
                    state.primaryOccupation.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? value) => context
                      .read<SectionOneCubit>()
                      .primaryOccupationChanged(value!),
              items:
                  professionList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Respondent's Primary Occupation",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RespondentSecondaryOccupation extends StatelessWidget {
  const RespondentSecondaryOccupation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) =>
          previous.secondaryOccupation != current.secondaryOccupation,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              key: const Key('sectionOne_secondaryOccupation'),
              isExpanded: true,
              value: state.secondaryOccupation.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child:
                      Icon(Icons.engineering_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Respondent's Secondary Occupation",
                helperText: '',
                errorText:
                    state.secondaryOccupation.invalid ? 'required field' : null,
              ),
              onChanged: !context.read<InformaticsCubit>().state.isEnabled
                  ? null
                  : (String? value) => context
                      .read<SectionOneCubit>()
                      .secondaryOccupationChanged(value!),
              items:
                  professionList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Respondent's Secondary Occupation",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FamilyMember extends StatefulWidget {
  const FamilyMember({super.key});

  @override
  State<FamilyMember> createState() => _FamilyMemberState();
}

class _FamilyMemberState extends State<FamilyMember> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      builder: (context, state) {
        Map<String, dynamic> familyMembers = state.familyMemberDetails;

        Widget addButton = Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 8,
          ),
          child: ElevatedButton(
            onPressed: !context.read<InformaticsCubit>().state.isEnabled
                ? null
                : () {
                    addFamilyMembers(null, null);
                  },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // backgroundColor: Colors.blueAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                ),
                spacerWidget(),
                const Text(
                  'Add Family Members',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );

        List<Widget> widgets = [spacerWidget(), addButton, spacerWidget()];

        familyMembers.forEach(
          (key, value) {
            String name = value['name'] ?? '';
            String relationship = value['relationship'] ?? '';
            String age = value['age'] ?? '';
            String gender = value['gender'] ?? '';
            String qualification = value['qualification'] ?? '';
            String occupation = value['occupation'] ?? '';

            Widget x = Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 8,
              ),
              child: BlocBuilder<SectionOneCubit, SectionOneState>(
                builder: (context, state) {
                  return state.familyMemberDetails.containsKey(key)
                      ? ElevatedButton(
                          onLongPress: !context
                                  .read<InformaticsCubit>()
                                  .state
                                  .isEnabled
                              ? null
                              : () {
                                  String message = "Confirm Delete ($name) !";

                                  globalScaffoldMessenger.currentState
                                    ?..removeCurrentMaterialBanner()
                                    ..showMaterialBanner(
                                      MaterialBanner(
                                        //backgroundColor: Colors.blue,
                                        content: Text(message),
                                        //contentTextStyle: const TextStyle(color: Colors.white),
                                        onVisible: () => Future.delayed(
                                          const Duration(seconds: 7),
                                          () => globalScaffoldMessenger
                                              .currentState!
                                              .hideCurrentMaterialBanner(),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .read<SectionOneCubit>()
                                                  .familyMemberDetailsRemove(
                                                      [key]);

                                              globalScaffoldMessenger
                                                  .currentState!
                                                  .hideCurrentMaterialBanner();
                                            },
                                            child: const Text("DELETE"),
                                          ),
                                          TextButton(
                                            //style: TextButton.styleFrom(foregroundColor: Colors.white),
                                            onPressed: () {
                                              globalScaffoldMessenger
                                                  .currentState!
                                                  .hideCurrentMaterialBanner();
                                            },
                                            child: const Text("CANCEL"),
                                          )
                                        ],
                                      ),
                                    );
                                },
                          onPressed: !context
                                  .read<InformaticsCubit>()
                                  .state
                                  .isEnabled
                              ? null
                              : () {
                                  FamilyMemberState currentState =
                                      context.read<FamilyMemberCubit>().state;

                                  FamilyMemberState? seeState =
                                      FamilyMemberCubit().fromJson(
                                          value as Map<String, dynamic>);

                                  context
                                      .read<FamilyMemberCubit>()
                                      .setState(seeState);

                                  addFamilyMembers(key, currentState);
                                },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // backgroundColor: Colors.blueAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '$name, $relationship, $age, $gender, $qualification, $occupation',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container();
                },
              ),
            );
            widgets.add(x);
          },
        );

        return Column(
          children: widgets,
        );
      },
    );
  }

  void addFamilyMembers(String? key, FamilyMemberState? currentState) async {
    final ScrollController scrollController = ScrollController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
            'Family Member Details'), // To display the title it is optional
        content: SizedBox(
          height: 600,
          width: 400,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: FocusScope(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16.0),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: false,
                children: <Widget>[
                  const MemberName(),
                  spacerWidget(),
                  const MemberRelationship(),
                  spacerWidget(),
                  const MemberAge(),
                  spacerWidget(),
                  const MemberGender(),
                  spacerWidget(),
                  const MemberQualification(),
                  spacerWidget(),
                  const MemberOccupation(),
                  spacerWidget(),
                ],
              ),
            ),
          ),
        ), // Message which will be pop up on the screen
        // Action widget which will provide the user to acknowledge the choice
        actions: [
          BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
            builder: (context, state) {
              return ElevatedButton(
                // FlatButton widget is used to make a text to work like a button
                //textColor: Colors.black,
                onPressed: state.status.isValidated
                    ? () {
                        if (key == null) {
                          context
                              .read<SectionOneCubit>()
                              .familyMemberDetailsAdd(
                                  FamilyMemberState.toMap(state));
                        } else {
                          context
                              .read<SectionOneCubit>()
                              .familyMemberDetailsUpdate(
                                  key, FamilyMemberState.toMap(state));
                        }

                        context.read<FamilyMemberCubit>().reset();
                        Navigator.pop(context);
                      }
                    : null, // function used to perform after pressing the button
                child: const Text('SAVE'),
              );
            },
          ),
          ElevatedButton(
            // FlatButton widget is used to make a text to work like a button
            //textColor: Colors.black,

            onPressed: () {
              Navigator.pop(context);
              context.read<FamilyMemberCubit>().setState(currentState);
            }, // function used to perform after pressing the button
            child: const Text('CANCEL'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
