import 'package:formz/formz.dart';

/// Validation errors for the [EmailInput] [FormzInput].
enum EmailValidationError {
  /// Generic invalid error.
  invalid,
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class EmailInput extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const EmailInput.pure() : super.pure('');

  /// {@macro email}
  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final Pattern _emailRegExp =
      // ignore: deprecated_member_use
      RegExp(
    r'^[a-zA-Z0-9.!#$%&'\''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}
