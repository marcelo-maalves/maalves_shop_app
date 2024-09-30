import 'package:auth/sign_in/domain/repository/sign_in_repository.dart';
import 'package:auth/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.signRepository,
  }) : super(const SignInState(status: SignInStatus.initial));

  final SignRepository signRepository;

  void fetchData() {

  }

  Future<void> signInWithGoogle() async {
    emit(const SignInState(status: SignInStatus.loading));
    final response = await signRepository.signInWithGoogle();
    emit(SignInState(status: SignInStatus.success, user: response));
  }
}

class SigInProvider extends BlocProvider<SignInCubit> {
  SigInProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          create: (context) => SignInCubit(
            signRepository: di<SignRepository>(),
          )..fetchData(),
          child: child,
        );

  static SignInCubit of(BuildContext context) => BlocProvider.of(context);
}
