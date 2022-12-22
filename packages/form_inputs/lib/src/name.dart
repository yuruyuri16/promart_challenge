import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

///
enum NameValidationError {
  ///
  invalid;
}

/// {@template name}
/// Form input for a name input.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro name}
  const Name.pure(super.value) : super.pure();

  /// {@macro name}
  const Name.dirty(super.value) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.length < 4) return NameValidationError.invalid;
    return null;
  }
}
