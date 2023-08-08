part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class signloading extends AuthState {}

class signsuccess extends AuthState {
  final RegisterdUser redistereduser;

  signsuccess({required this.redistereduser});
}

class signfailure extends AuthState {
  final String error;

  signfailure({required this.error});
}

class loginloading extends AuthState {}

class loginsuccess extends AuthState {
  final Loginuser loginuser;

  loginsuccess({required this.loginuser});
}

class loginfailure extends AuthState {
  final String error;

  loginfailure({required this.error});
}
