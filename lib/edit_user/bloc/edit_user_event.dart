part of 'edit_user_bloc.dart';

abstract class EditUserEvent extends Equatable {
  const EditUserEvent();

  @override
  List<Object> get props => [];
}

class EditUserNameChanged extends EditUserEvent {
  const EditUserNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class EditUserUsernameChanged extends EditUserEvent {
  const EditUserUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class EditUserEmailChanged extends EditUserEvent {
  const EditUserEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class EditUserPhoneChanged extends EditUserEvent {
  const EditUserPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class EditUserStreetChanged extends EditUserEvent {
  const EditUserStreetChanged(this.street);

  final String street;

  @override
  List<Object> get props => [street];
}

class EditUserSuiteChanged extends EditUserEvent {
  const EditUserSuiteChanged(this.suite);

  final String suite;

  @override
  List<Object> get props => [suite];
}

class EditUserCityChanged extends EditUserEvent {
  const EditUserCityChanged(this.city);

  final String city;

  @override
  List<Object> get props => [city];
}

class EditUserZipcodeChanged extends EditUserEvent {
  const EditUserZipcodeChanged(this.zipcode);

  final String zipcode;

  @override
  List<Object> get props => [zipcode];
}

class EditUserSubmitted extends EditUserEvent {}
