import 'package:app/state_provider/state_app.dart';
import 'package:app/stream/stream_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      title: '',
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: StreamApp.path,
    routes: [
      GoRoute(
        path: StreamApp.path,
        name: StreamApp.name,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const StreamApp()),
      ),
      GoRoute(
          path: StateApp.path,
          name: StateApp.name,
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: const StateApp()))
    ],
  );
}
