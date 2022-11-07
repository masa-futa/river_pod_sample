import 'dart:async';

import 'package:app/state_provider/state_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

StreamController<int> streamController = StreamController<int>();

final streamProvider =
    StreamProvider.autoDispose<int>((ref) => streamController.stream);

class StreamApp extends HookConsumerWidget {
  const StreamApp({Key? key}) : super(key: key);

  static const path = '/stream';
  static const name = 'stream';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamProvider.stream);
    final index = useFuture(stream.first);

    // useEffect(() {
    //   if (streamController.hasListener) {
    //     streamController = StreamController<int>();
    //   }
    //   streamController.stream.listen((index) {
    //     print('$index番');
    //   });
    //   return null;
    // }, []);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${index.data ?? 0}番'),
        const SecondApp(),
      ],
    );
  }
}

class SecondApp extends StatelessWidget {
  const SecondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () =>
              streamController.sink.addStream(Stream<int>.value(1)),
          child: const Text('tap'),
        ),
        ElevatedButton(
          onPressed: () => context.goNamed(StateApp.name),
          child: const Text('Stream系へ遷移'),
        ),
      ],
    );
  }
}
