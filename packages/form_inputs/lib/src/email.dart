import 'package:formz/formz.dart';

///
enum EmailValidationError {
  ///
  invalid;
}

/// {@template email}
/// Form input for a email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure(super.value) : super.pure();

  /// {@macro email}
  const Email.dirty(super.value) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    return null;
  }
}
