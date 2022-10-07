import 'dart:async';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: ((previous, current) => previous.status != current.status),
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          shrinkWrap: false,
          children: <Widget>[
            const SizedBox(height: 200),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 340,
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 40,
                ),
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.grey,
                  // ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Hello ! Sign in",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.passionOne(
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _EmailInput(),
                    const SizedBox(height: 8),
                    _PasswordInput(),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 320,
                      child: _LoginButton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          inputFormatters: [
            LowerCaseTextFormatter(),
          ],
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.mail),
            labelText: 'email',
            helperText: '',
            errorText: state.email.invalid ? 'invalid registration ID' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          textInputAction: TextInputAction.done,
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.lock),
            labelText: 'password',
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const SizedBox(
                width: 54,
                height: 54,
                child: Center(child: CircularProgressIndicator()),
              )
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
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
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginCubit>().logInWithCredentials();
                      }
                    : null,
                child: const Text('LOGIN'),
              );
      },
    );
  }
}
