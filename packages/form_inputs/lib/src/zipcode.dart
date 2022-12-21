import 'package:formz/formz.dart';

///
enum ZipcodeValidationError {
  ///
  invalid;
}

/// {@template zipcode}
/// Form input for a zipcode input.
/// {@endtemplate}
class Zipcode extends FormzInput<String, ZipcodeValidationError> {
  /// {@macro zipcode}
  const Zipcode.pure(super.value) : super.pure();

  /// {@macro zipcode}
  const Zipcode.dirty(super.value) : super.dirty();

  @override
  ZipcodeValidationError? validator(String value) {
    return null;
  }
}
