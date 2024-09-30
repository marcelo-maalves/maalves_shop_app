//Implement state class with loading, success and error

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum SignInStatus { initial, loading, success, error }

class SignInState extends Equatable {
  const SignInState({
    required this.status,
    this.user,
  });

  final SignInStatus status;
  final UserCredential? user;

  SignInState copyWith({
    SignInStatus? status,
  }) {
    return SignInState(
      status: status ?? this.status,
      user: user,
    );
  }

  @override
  List<Object?> get props => [status, user];
}
