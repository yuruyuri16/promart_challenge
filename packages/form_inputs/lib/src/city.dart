import 'package:formz/formz.dart';

///
enum CityValidationError {
  ///
  invalid;
}

/// {@template city}
/// Form input for a city input.
/// {@endtemplate}
class City extends FormzInput<String, CityValidationError> {
  /// {@macro city}
  const City.pure(super.value) : super.pure();

  /// {@macro city}
  const City.dirty(super.value) : super.dirty();

  @override
  CityValidationError? validator(String value) {
    return null;
  }
}
