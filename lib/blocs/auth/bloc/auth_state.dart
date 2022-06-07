part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoggedIn extends AuthState {
  AuthLoggedIn({required this.user});
  final User user;
}

class AuthLoading extends AuthState {}

class AuthErrorState extends AuthState {
  AuthErrorState({required this.errorMessage});
  final String errorMessage;
}
