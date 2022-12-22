import 'package:formz/formz.dart';

///
enum SuiteValidationError {
  ///
  invalid;
}

/// {@template suite}
/// Form input for a suite input.
/// {@endtemplate}
class Suite extends FormzInput<String, SuiteValidationError> {
  /// {@macro suite}
  const Suite.pure(super.value) : super.pure();

  /// {@macro suite}
  const Suite.dirty(super.value) : super.dirty();

  @override
  SuiteValidationError? validator(String value) {
    if (value.length < 4) return SuiteValidationError.invalid;
    return null;
  }
}
