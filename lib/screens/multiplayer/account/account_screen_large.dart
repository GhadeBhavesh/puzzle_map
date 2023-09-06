import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle_map/providers.dart';
import 'package:puzzle_map/screens/multiplayer/account/login/login_screen_large.dart';
import 'package:puzzle_map/screens/multiplayer/account/register/register_screen_large.dart';

class AccountScreenLarge extends ConsumerWidget {
  const AccountScreenLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(isLoginNotifier);

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: state ? const LoginScreenLarge() : const RegisterScreenLarge(),
        );
      },
    );
  }
}