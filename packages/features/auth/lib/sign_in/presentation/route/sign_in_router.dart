import 'package:auth/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:auth/sign_in/presentation/container/sign_in_container.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:foundation/go_router.dart';

class AuthRouter extends GoRoute {
  AuthRouter()
      : super(
          parentNavigatorKey: rootNavigatorKey,
          path: AuthRoutes.signIn,
          name: AuthRoutes.signIn,
          pageBuilder: (context, state) {
            return MaterialTransition(
              key: state.pageKey,
              builder: (context) {
                return SigInProvider(
                  child: SignInContainer(
                    onBackPressed: Navigator.of(context).pop,
                  ),
                );
              },
            );
          },
        );
}
