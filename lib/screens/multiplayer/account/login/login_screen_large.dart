import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle_map/providers.dart';
import 'package:puzzle_map/utils/validators.dart';
import 'package:puzzle_map/widgets/multiplayer_screen/email_error_text.dart';
import 'package:puzzle_map/widgets/multiplayer_screen/puzzle_side_image.dart';
import 'package:puzzle_map/widgets/multiplayer_screen/sign_in_button.dart';

class LoginScreenLarge extends ConsumerStatefulWidget {
  const LoginScreenLarge({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginScreenLargeState();
}

class _LoginScreenLargeState extends ConsumerState<LoginScreenLarge> {
  final _loginFormKey = GlobalKey<FormState>();

  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            PuzzleSideImage(width: screenSize.width * 0.45),
            SizedBox(
              width: screenSize.width * 0.55,
              child: Form(
                key: _loginFormKey,
                onChanged: () => setState(() {}),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _emailFocusNode,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        cursorColor: Theme.of(context).colorScheme.primary,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 3,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 2,
                            ),
                          ),
                          hintText: 'Enter email',
                          hintStyle: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        validator: (value) => Validators.validateEmail(
                          email: value,
                        ),
                        // onChanged: (value) => widget.onChange(value),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordTextController,
                        focusNode: _passwordFocusNode,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        cursorColor: Theme.of(context).colorScheme.primary,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 3,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 2,
                            ),
                          ),
                          hintText: 'Enter password',
                          hintStyle: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        validator: (value) => Validators.validatePassword(
                          password: value,
                        ),
                        // onChanged: (value) => widget.onChange(value),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(isLoginNotifier.notifier)
                                    .selectRegister();
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const EmailErrorText(),
                      const SizedBox(height: 32),
                      SignInButton(
                        loginFormKey: _loginFormKey,
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
