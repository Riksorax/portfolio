import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/presentation/general/settings/settings.dart';
import 'features/presentation/indoor_pool/entrance.dart';
import 'features/presentation/member_cards/member_cards.dart';
import 'features/shared/presentation/theme/theme.dart';
import 'features/shared/presentation/widgets/base_scaffold.dart';
import 'firebase_options.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DLRG Weeze Manager',
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case '/member_cards':
            return MaterialPageRoute(builder: (context) => const MemberCards());
          case '/entrance':
            return MaterialPageRoute(builder: (context) => const Entrance());
          case '/settings':
            return MaterialPageRoute(builder: (context) => const Settings());
          default:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
        }
      },
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: 'DLRG Weeze Manager',
        body: const Center(
          child: Text(
              "TODO: \nEine Dashbord erstllen. \nWähle eine Seite aus dem Menü aus."),
        ),
        onItemTapped: _onItemTapped);
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/member_cards');
      case 1:
        Navigator.pushNamed(context, '/entrance');
      case 2:
        Navigator.pushNamed(context, '/settings');
    }
  }
}
