import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:geolocation_repository/geolocation_repository.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  EditUserBloc({
    required UserRepository userRepository,
    required GeolocationRepository geolocationRepository,
    User? user,
  })  : _userRepository = userRepository,
        _geolocationRepository = geolocationRepository,
        super(
          EditUserState(
            user: user,
            name: Name.pure(user?.name ?? ''),
            username: Username.pure(user?.username ?? ''),
            email: Email.pure(user?.email ?? ''),
            phone: Phone.pure(user?.phone ?? ''),
            street: Street.pure(user?.address.street ?? ''),
            suite: Suite.pure(user?.address.suite ?? ''),
            city: City.pure(user?.address.city ?? ''),
            zipcode: Zipcode.pure(user?.address.zipcode ?? ''),
          ),
        ) {
    on<EditUserNameChanged>(_onNameChanged);
    on<EditUserUsernameChanged>(_onUsernameChanged);
    on<EditUserEmailChanged>(_onEmailChanged);
    on<EditUserPhoneChanged>(_onPhoneChanged);
    on<EditUserStreetChanged>(_onStreetChanged);
    on<EditUserSuiteChanged>(_onSuiteChanged);
    on<EditUserCityChanged>(_onCityChanged);
    on<EditUserZipcodeChanged>(_onZipcodeChanged);
    on<EditUserSubmitted>(_onSubmitted);
  }

  final UserRepository _userRepository;
  final GeolocationRepository _geolocationRepository;

  void _onNameChanged(EditUserNameChanged event, Emitter<EditUserState> emit) {
    final name = Name.dirty(event.name);
    final status = Formz.validate([
      name,
      state.username,
      state.email,
      state.phone,
      state.street,
      state.suite,
      state.city,
      state.zipcode,
    ]);
    emit(state.copyWith(name: name, status: status));
  }

  void _onUsernameChanged(
    EditUserUsernameChanged event,
    Emitter<EditUserState> emit,
  ) {
    final username = Username.dirty(event.username);
    final status = Formz.validate([
      state.name,
      username,
      state.email,
      state.phone,
      state.street,
      state.suite,
      state.city,
      state.zipcode,
    ]);
    emit(state.copyWith(username: username, status: status));
  }

  void _onEmailChanged(
    EditUserEmailChanged event,
    Emitter<EditUserState> emit,
  ) {
    final email = Email.dirty(event.email);
    final status = Formz.validate([
      state.name,
      state.username,
      email,
      state.phone,
      state.street,
      state.suite,
      state.city,
      state.zipcode,
    ]);
    emit(state.copyWith(email: email, status: status));
  }

  void _onPhoneChanged(
    EditUserPhoneChanged event,
    Emitter<EditUserState> emit,
  ) {
    final phone = Phone.dirty(event.phone);
    final status = Formz.validate([
      state.name,
      state.username,
      state.email,
      phone,
      state.street,
      state.suite,
      state.city,
      state.zipcode,
    ]);
    emit(state.copyWith(phone: phone, status: status));
  }

  void _onStreetChanged(
    EditUserStreetChanged event,
    Emitter<EditUserState> emit,
  ) {
    final street = Street.dirty(event.street);
    final status = Formz.validate([
      state.name,
      state.username,
      state.email,
      state.phone,
      street,
      state.suite,
      state.city,
      state.zipcode,
    ]);
    emit(state.copyWith(street: street, status: status));
  }

  void _onSuiteChanged(
    EditUserSuiteChanged event,
    Emitter<EditUserState> emit,
  ) {
    final suite = Suite.dirty(event.suite);
    final status = Formz.validate([
      state.name,
      state.username,
      state.email,
      state.phone,
      state.street,
      suite,
      state.city,
      state.zipcode,
    ]);
    emit(state.copyWith(suite: suite, status: status));
  }

  void _onCityChanged(
    EditUserCityChanged event,
    Emitter<EditUserState> emit,
  ) {
    final city = City.dirty(event.city);
    final status = Formz.validate([
      state.name,
      state.username,
      state.email,
      state.phone,
      state.street,
      state.suite,
      city,
      state.zipcode,
    ]);
    emit(state.copyWith(city: city, status: status));
  }

  void _onZipcodeChanged(
    EditUserZipcodeChanged event,
    Emitter<EditUserState> emit,
  ) {
    final zipcode = Zipcode.dirty(event.zipcode);
    final status = Formz.validate([
      state.name,
      state.username,
      state.email,
      state.phone,
      state.street,
      state.suite,
      state.city,
      zipcode,
    ]);
    emit(state.copyWith(zipcode: zipcode, status: status));
  }

  Future<void> _onSubmitted(
    EditUserSubmitted event,
    Emitter<EditUserState> emit,
  ) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      User user;
      if (state.user != null) {
        user = state.user!.copyWith(
          name: state.name.value,
          username: state.username.value,
          email: state.email.value,
          address: state.user!.address,
          phone: state.phone.value,
        );
        await _userRepository.saveUser(user);
      } else {
        final position = await _geolocationRepository.getCurrentLocation();

        user = User(
          name: state.name.value,
          username: state.username.value,
          email: state.email.value,
          address: Address(
            street: state.street.value,
            suite: state.suite.value,
            city: state.city.value,
            zipcode: state.zipcode.value,
            geo: Geo(lat: position.latitude, lng: position.longitude),
          ),
          phone: state.phone.value,
        );
      }
      await _userRepository.saveUser(user);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
