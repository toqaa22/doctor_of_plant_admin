part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccessfully extends LoginState {}
final class LoginError extends LoginState {}
final class ChangeObscure extends LoginState {}
final class ClearAllTextFormFields extends LoginState {}
