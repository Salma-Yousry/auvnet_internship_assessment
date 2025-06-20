abstract class SignupEvent {}

class SignupRequested extends SignupEvent {
  final String email;
  final String password;

  SignupRequested(this.email, this.password);
}
