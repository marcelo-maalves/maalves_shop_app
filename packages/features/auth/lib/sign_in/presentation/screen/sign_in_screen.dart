import 'package:design_system/design_system.dart';
import 'package:design_system/utils/spacings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foundation/foundation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
    required this.onBackPressed,
    required this.onSignInPressed,
    required this.onGoogleSignInPressed,
  });

  final VoidCallback onBackPressed;
  final VoidCallback onSignInPressed;
  final VoidCallback onGoogleSignInPressed;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()..addListener(_emailListener);
    _passwordController = TextEditingController()
      ..addListener(_passwordListener);
  }

  void _emailListener() {
    //_checkIfSaveButtonIsEnable();
  }

  void _passwordListener() {
    //_checkIfSaveButtonIsEnable();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryMain,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(x4),
          child: Column(
            children: [
              const SizedBox(height: x4),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(x4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: x4),
                        TextFormField(
                          controller: _emailController,
                          style: theme.textTheme.titleSmall,
                          validator: (value) {
                            if (!_emailController.value.text.isEmail) {
                              return 'Email inválido';
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus();
                          },
                          decoration:
                              const InputDecoration(labelText: 'E-mail'),
                        ),
                        const SizedBox(height: x4),
                        TextFormField(
                          controller: _emailController,
                          style: theme.textTheme.titleSmall,
                          validator: (value) {
                            if (!_emailController.value.text.isEmail) {
                              return 'Senha inválido';
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus();
                          },
                          decoration: const InputDecoration(labelText: 'Senha'),
                        ),
                        const SizedBox(height: x4),
                        ElevatedButton(
                          onPressed: widget.onSignInPressed,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(x12),
                          ),
                          child: Text(
                            'Entrar',
                            style: theme.textTheme.headLine1.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.white),
                          ),
                        ),
                        Divider(
                          color: theme.colorScheme.white,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: x4),
              ElevatedButton.icon(
                icon: const Icon(FontAwesomeIcons.google),
                onPressed: widget.onGoogleSignInPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(x12),
                  backgroundColor: theme.colorScheme.blueLight,
                ),
                label: Text(
                  'Entrar com Google',
                  style: theme.textTheme.headLine2.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
