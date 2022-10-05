import 'package:formz/formz.dart';

/// Validation errors for the [Compulsory] [FormzInput].
enum CompulsoryValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template compulsory}
/// Form input for an compulsory input.
/// {@endtemplate}
class Compulsory extends FormzInput<dynamic, CompulsoryValidationError> {
  /// {@macro compulsory}
  const Compulsory.pure() : super.pure(null);

  /// {@macro compulsory}
  const Compulsory.dirty([dynamic value = null]) : super.dirty(value);

  //r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // static final RegExp _compulsoryRegExp = RegExp(
  //   r'^(?!\s*$).+$',
  // );

  @override
  CompulsoryValidationError? validator(dynamic value) {
    if (value == null) return null;

    if (value is String) value = value.trim();
    if (value is int || value is double) value = value.toString();
    return (value != null && value.length > 0)
        ? null
        : CompulsoryValidationError.invalid;
  }
}
