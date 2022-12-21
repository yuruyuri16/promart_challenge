// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_user_bloc.dart';

class EditUserState extends Equatable {
  const EditUserState({
    this.status = FormzStatus.pure,
    this.user,
    this.name = const Name.pure(''),
    this.username = const Username.pure(''),
    this.email = const Email.pure(''),
    this.phone = const Phone.pure(''),
    this.street = const Street.pure(''),
    this.suite = const Suite.pure(''),
    this.city = const City.pure(''),
    this.zipcode = const Zipcode.pure(''),
  });

  final FormzStatus status;
  final User? user;
  final Name name;
  final Username username;
  final Email email;
  final Phone phone;
  final Street street;
  final Suite suite;
  final City city;
  final Zipcode zipcode;

  bool get isNewUser => user == null;

  @override
  List<Object?> get props => [
        status,
        user,
        name,
        username,
        email,
        phone,
        street,
        suite,
        city,
        zipcode,
      ];

  EditUserState copyWith({
    FormzStatus? status,
    User? user,
    Name? name,
    Username? username,
    Email? email,
    Phone? phone,
    Street? street,
    Suite? suite,
    City? city,
    Zipcode? zipcode,
  }) {
    return EditUserState(
      status: status ?? this.status,
      user: user ?? this.user,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
    );
  }
}
