import 'package:auth/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:auth/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:auth/sign_in/presentation/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInContainer extends BlocBuilder<SignInCubit, SignInState> {
  SignInContainer({
    Key? key,
    required VoidCallback onBackPressed,
  }) : super(
          key: key,
          builder: (context, state) {
            return SignInScreen(
              onBackPressed: onBackPressed,
              onSignInPressed: () {},
              onGoogleSignInPressed: SigInProvider.of(context).signInWithGoogle,
            );
          },
        );
}
