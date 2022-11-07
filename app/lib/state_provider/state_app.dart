import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StateApp extends HookConsumerWidget {
  const StateApp({Key? key}) : super(key: key);

  static const path = '/state';
  static const name = 'state';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('ssss'));
  }
}
