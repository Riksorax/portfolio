import 'package:dlrg_weeze_manager/features/presentation/member_cards/member_cards.dart';
import 'package:dlrg_weeze_manager/features/presentation/menu/menu_drawer.dart';
import 'package:dlrg_weeze_manager/features/shared/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DLRG Weeze Manager',
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(Icons.menu),
          title: const Text('DLRG Weeze Manager'),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 24),
                child: const Icon(Icons.account_circle)),
          ],
        ),
        //TODO check themeMode
        backgroundColor: MaterialTheme.lightScheme().surfaceContainerLow,
        body: const Row(
          children: [
            MenuDrawer(),
            MemberCards(),
          ],
        ),
      ),
    );
  }
}
