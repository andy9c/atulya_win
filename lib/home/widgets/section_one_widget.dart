import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../cubit/student_cubit.dart';

class PattaNumber extends StatelessWidget {
  const PattaNumber({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.candidateFirstName != current.candidateFirstName,
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
              enabled: state.setEnabled,
              initialValue: state.candidateFirstName.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_candidateFirstName_textField'),
              onChanged: (candidateFirstName) => context
                  .read<StudentCubit>()
                  .candidateFirstNameChanged(candidateFirstName),
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
                errorText:
                    state.candidateFirstName.invalid ? 'required field' : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.candidateMiddleName != current.candidateMiddleName,
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
              enabled: state.setEnabled,
              initialValue: state.candidateMiddleName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_candidateMiddleName_textField'),
              onChanged: (candidateMiddleName) => context
                  .read<StudentCubit>()
                  .candidateMiddleNameChanged(candidateMiddleName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Respondent's Full Name",
                helperText: '',
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
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.candidateLastName != current.candidateLastName,
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
              enabled: state.setEnabled,
              initialValue: state.candidateLastName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_candidateLastName_textField'),
              onChanged: (candidateLastName) => context
                  .read<StudentCubit>()
                  .candidateLastNameChanged(candidateLastName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Head of the household (Full Name)",
                helperText: '',
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
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.dateOfBirth != current.dateOfBirth,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: TextFormField(
              enabled: state.setEnabled,
              controller: TextEditingController(text: state.dateOfBirth.value),
              maxLines: 1,
              showCursor: true,
              readOnly: false,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_dateOfBirth_textField'),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.calendar_today_rounded,
                      color: Colors.lightBlue),
                ),
                border: OutlineInputBorder(),
                labelText: "Respondent's Age",
                helperText: '',
                //errorText: state.dateOfBirth.invalid ? 'required field' : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.placeOfBirth != current.placeOfBirth,
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
              enabled: state.setEnabled,
              initialValue: state.placeOfBirth.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_placeOfBirth_textField'),
              onChanged: (placeOfBirth) => context
                  .read<StudentCubit>()
                  .placeOfBirthChanged(placeOfBirth),
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
                errorText: state.placeOfBirth.invalid ? 'required field' : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
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
              onChanged: state.setEnabled
                  ? (String? gender) {
                      context.read<StudentCubit>().genderChanged(gender!);
                    }
                  : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherTongue != current.motherTongue,
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
              value: state.motherTongue.value,
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
                errorText: state.motherTongue.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? motherTongue) => context
                      .read<StudentCubit>()
                      .motherTongueChanged(motherTongue!)
                  : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.bloodGroup != current.bloodGroup,
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
              value: state.bloodGroup.value,
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
                errorText: state.bloodGroup.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? bloodGroup) => context
                      .read<StudentCubit>()
                      .bloodGroupChanged(bloodGroup!)
                  : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
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
              onChanged: state.setEnabled
                  ? (String? religion) =>
                      context.read<StudentCubit>().religionChanged(religion!)
                  : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
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
              onChanged: state.setEnabled
                  ? (String? socialCategory) => context
                      .read<StudentCubit>()
                      .socialCategoryChanged(socialCategory!)
                  : null,
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
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.hasAadharCard != current.hasAadharCard,
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
              value: state.hasAadharCard == "" ? null : state.hasAadharCard,
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
              onChanged: state.setEnabled
                  ? (String? hasAadharCard) {
                      if (hasAadharCard == "YES") {
                        context
                            .read<StudentCubit>()
                            .aadharEnrollmentIDChanged("");
                      } else {
                        context.read<StudentCubit>().aadharCardChanged("");
                      }

                      context
                          .read<StudentCubit>()
                          .hasAadharCardChanged(hasAadharCard!);
                    }
                  : null,
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