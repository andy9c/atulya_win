import 'package:atulya/home/cubit/cubit.dart';
import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PattaNumber extends StatelessWidget {
  const PattaNumber({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionOneCubit, SectionOneState>(
      buildWhen: (previous, current) => previous.pattaNo != current.pattaNo,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: TextFormField(
              inputFormatters: [
                NameUpperCaseTextFormatter(),
              ],
              initialValue: state.pattaNo.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              onChanged: (value) =>
                  context.read<SectionOneCubit>().pattaChanged(value),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Patta No",
                helperText: '',
                errorText: state.pattaNo.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class RespondentFullName extends StatelessWidget {
  const RespondentFullName({Key? key}) : super(key: key);

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
              inputFormatters: [
                NameUpperCaseTextFormatter(),
              ],
              initialValue: state.fullName.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
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

class HeadOfHousehold extends StatelessWidget {
  const HeadOfHousehold({Key? key}) : super(key: key);

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
              inputFormatters: [
                NameUpperCaseTextFormatter(),
              ],
              initialValue: state.headOfHousehold.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              onChanged: (value) =>
                  context.read<SectionOneCubit>().headOfHouseholdChanged(value),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
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

class RespondentAge extends StatelessWidget {
  const RespondentAge({Key? key}) : super(key: key);

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
              maxLines: 1,
              showCursor: true,
              readOnly: false,
              textInputAction: TextInputAction.next,
              initialValue: state.age.value,
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

class CommunityName extends StatelessWidget {
  const CommunityName({Key? key}) : super(key: key);

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
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              initialValue: state.nameOfCommunity.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_placeOfBirth_textField'),
              onChanged: (value) =>
                  context.read<SectionOneCubit>().nameOfCommunityChanged(value),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.place_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Name of the Community",
                helperText: '',
                errorText:
                    state.nameOfCommunity.invalid ? 'required field' : null,
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
              onChanged: (String? gender) {
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
              onChanged: (String? motherTongue) => context
                  .read<SectionOneCubit>()
                  .relationshipChanged(motherTongue!),
              items: motherTongueList
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
                  child: Icon(Icons.bloodtype_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Gram Panchayat",
                helperText: '',
                errorText:
                    state.gramPanchayat.invalid ? 'required field' : null,
              ),
              onChanged: (String? bloodGroup) => context
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
              onChanged: (String? religion) =>
                  context.read<SectionOneCubit>().religionChanged(religion!),
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
              onChanged: (String? socialCategory) => context
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
              isExpanded: true,
              value: state.cardholderCategory.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.credit_card, color: Colors.lightBlue),
                ),
                border: OutlineInputBorder(),
                labelText: "Cardholder Category",
                helperText: '',
              ),
              onChanged: (String? value) {
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
              onChanged: (String? value) =>
                  context.read<SectionOneCubit>().qualificationChanged(value!),
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
              onChanged: (String? value) => context
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
              onChanged: (String? value) => context
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

class MotherQualificationSelection extends StatelessWidget {
  const MotherQualificationSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherQualification != current.motherQualification,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.motherQualification.value,
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
                labelText: "Mother's Qualification",
                helperText: '',
                errorText:
                    state.motherQualification.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? motherQualification) => context
                      .read<StudentCubit>()
                      .motherQualificationChanged(motherQualification!)
                  : null,
              items: qualificationList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Mother's Qualification",
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
