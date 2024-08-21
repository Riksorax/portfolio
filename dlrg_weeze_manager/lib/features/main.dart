import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/general/settings/settings.dart';
import 'presentation/member_cards/member_cards.dart';
import 'presentation/menu/menu_drawer.dart';
import 'shared/presentation/theme/theme.dart';
import 'shared/providers/current_page.provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DLRG Weeze Manager',
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
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
    final currentPage = ref.watch(currentPageNotifierProvider);

    void setCurrentPage(int index){
      ref.read(currentPageNotifierProvider.notifier).setCurrentPage(index);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('DLRG Weeze Manager'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            child: const Icon(Icons.account_circle),
          ),
        ],
      ),
      backgroundColor: MaterialTheme.lightScheme().surfaceContainerLow,
      drawer: MenuDrawer(onItemTapped: setCurrentPage),
      body: Row(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentPage,
              children: const [
                MemberCards(),
                Settings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}