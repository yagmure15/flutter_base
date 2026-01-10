import 'package:formz/formz.dart';

/// Validation errors for the [PasswordInput] [FormzInput].
enum PasswordValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template password}
/// Form input for a password input.
/// {@endtemplate}
class PasswordInput extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const PasswordInput.pure() : super.pure('');

  /// {@macro password}
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    return (value ?? '').length >= 6 ? null : PasswordValidationError.invalid;
  }
}
