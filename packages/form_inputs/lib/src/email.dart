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

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (_emailRegExp.doesNotMatch(value)) return EmailValidationError.invalid;
    return null;
  }
}

extension on RegExp {
  bool doesNotMatch(String input) => !hasMatch(input);
}
