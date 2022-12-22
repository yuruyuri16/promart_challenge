import 'package:formz/formz.dart';

///
enum UsernameValidationError {
  ///
  invalid;
}

/// {@template username}
/// Form input for a username input.
/// {@endtemplate}
class Username extends FormzInput<String, UsernameValidationError> {
  /// {@macro username}
  const Username.pure(super.value) : super.pure();

  /// {@macro username}
  const Username.dirty(super.value) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.length < 4) return UsernameValidationError.invalid;
    return null;
  }
}
