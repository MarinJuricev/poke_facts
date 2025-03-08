import 'package:flutter/material.dart';
import 'package:poke_facts/navigation/router_declaration.dart';

import 'di.dart';
import 'sync/usecase/sync_pokemons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadDependencies();

  final syncPokemons = getIt<SyncPokemons>();
  syncPokemons().run().then((result) {
    result.match(
      (failure) => debugPrint("Sync failed: $failure"),
      (unit) => debugPrint("Sync succeeded!"),
    );
  });

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: const [Locale('en', 'US'), Locale('hr', 'HR')],
    );
  }
}
