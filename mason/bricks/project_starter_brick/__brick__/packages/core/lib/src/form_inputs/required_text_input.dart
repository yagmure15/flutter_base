import 'package:formz/formz.dart';

/// Validation errors for the [RequiredTextInput] [FormzInput].
enum RequiredTextValidationError {
  /// Generic empty error.
  empty,
}

/// {@template required_text}
/// Form input for a required text input.
/// {@endtemplate}
class RequiredTextInput
    extends FormzInput<String, RequiredTextValidationError> {
  /// {@macro required_text}
  const RequiredTextInput.pure() : super.pure('');

  /// {@macro required_text}
  const RequiredTextInput.dirty([super.value = '']) : super.dirty();

  @override
  RequiredTextValidationError? validator(String? value) {
    return (value ?? '').isNotEmpty ? null : RequiredTextValidationError.empty;
  }
}
