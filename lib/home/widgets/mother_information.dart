// ignore_for_file: must_be_immutable

import 'package:atulya/home/cubit/student_cubit.dart';
import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MotherFirstName extends StatelessWidget {
  const MotherFirstName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherFirstName != current.motherFirstName,
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
              initialValue: state.motherFirstName.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherFirstName_textField'),
              onChanged: (motherFirstName) => context
                  .read<StudentCubit>()
                  .motherFirstNameChanged(motherFirstName),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's First Name",
                helperText: '',
                errorText:
                    state.motherFirstName.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherMiddleName extends StatelessWidget {
  const MotherMiddleName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherMiddleName != current.motherMiddleName,
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
              initialValue: state.motherMiddleName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherMiddleName_textField'),
              onChanged: (motherMiddleName) => context
                  .read<StudentCubit>()
                  .motherMiddleNameChanged(motherMiddleName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Mother's Middle Name",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherLastName extends StatelessWidget {
  const MotherLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherLastName != current.motherLastName,
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
              initialValue: state.motherLastName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherLastName_textField'),
              onChanged: (motherLastName) => context
                  .read<StudentCubit>()
                  .motherLastNameChanged(motherLastName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Mother's Last Name",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherAdditionalQualification extends StatelessWidget {
  const MotherAdditionalQualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherAdditionalQualification !=
          current.motherAdditionalQualification,
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
              initialValue: state.motherAdditionalQualification,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key(
                  'studentForm_motherAdditionalQualification_textField'),
              onChanged: (motherAdditionalQualification) => context
                  .read<StudentCubit>()
                  .motherAdditionalQualificationChanged(
                      motherAdditionalQualification),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.menu_book_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Additional Qualification",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherHomeContact extends StatelessWidget {
  const MotherHomeContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherHomeContact != current.motherHomeContact,
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
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\+\,]')),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherHomeContact.value,
              maxLines: 3,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherHomeContact_textField'),
              onChanged: (motherHomeContact) => context
                  .read<StudentCubit>()
                  .motherHomeContactChanged(motherHomeContact),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.call, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's Home/Personal Contact",
                helperText: '',
                errorText:
                    state.motherHomeContact.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherOfficeContact extends StatelessWidget {
  const MotherOfficeContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherOfficeContact != current.motherOfficeContact,
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
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\+\,]')),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherOfficeContact,
              maxLines: 3,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherOfficeContact_textField'),
              onChanged: (motherOfficeContact) => context
                  .read<StudentCubit>()
                  .motherOfficeContactChanged(motherOfficeContact),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.call),
                ),
                border: OutlineInputBorder(),
                labelText: "Mother's Work/Office Contact",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherEmail extends StatelessWidget {
  const MotherEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherEmail != current.motherEmail,
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
                EmailTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherEmail.value,
              maxLines: 3,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherEmail_textField'),
              onChanged: (motherEmail) =>
                  context.read<StudentCubit>().motherEmailChanged(motherEmail),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.email_rounded, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's Email",
                helperText: 'Use comma to separate multiple emails',
                errorText: state.motherEmail.invalid
                    ? state.motherEmail.value.isEmpty
                        ? 'required field'
                        : 'invalid email address found'
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
