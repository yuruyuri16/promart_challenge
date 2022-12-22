import 'package:formz/formz.dart';

///
enum StreetValidationError {
  ///
  invalid;
}

/// {@template street}
/// Form input for a street input.
/// {@endtemplate}
class Street extends FormzInput<String, StreetValidationError> {
  /// {@macro street}
  const Street.pure(super.value) : super.pure();

  /// {@macro street}
  const Street.dirty(super.value) : super.dirty();

  @override
  StreetValidationError? validator(String value) {
    if (value.length < 4) return StreetValidationError.invalid;
    return null;
  }
}
