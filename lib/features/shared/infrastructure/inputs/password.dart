import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length, format }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {


  static final RegExp passwordRegExp = RegExp(
    // Mismas reglas que la API (ASP.NET Identity): número, mayúscula, minúscula y un símbolo.
    r'^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^A-Za-z0-9]).*$',
  );

  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty( String value ) : super.dirty(value);


  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == PasswordError.empty ) return 'El campo es requerido';
    if ( displayError == PasswordError.length ) return 'Mínimo 8 caracteres';
    if ( displayError == PasswordError.format ) return 'Debe tener mayúscula, minúscula, un número y un símbolo (ej: !)';

    return null;
  }


  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {

    if ( value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if ( value.length < 8 ) return PasswordError.length;
    if ( !passwordRegExp.hasMatch(value) ) return PasswordError.format;

    return null;
  }
}