import 'package:formz/formz.dart';

///
enum PhoneValidationError {
  ///
  invalid;
}

/// {@template phone}
/// Form input for a phone input.
/// {@endtemplate}
class Phone extends FormzInput<String, PhoneValidationError> {
  /// {@macro phone}
  const Phone.pure(super.value) : super.pure();

  /// {@macro phone}
  const Phone.dirty(super.value) : super.dirty();

  @override
  PhoneValidationError? validator(String value) {
    return null;
  }
}
