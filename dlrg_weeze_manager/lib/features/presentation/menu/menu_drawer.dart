import 'package:flutter/material.dart';

import 'widgets/cards/cards_menu.dart';
import 'widgets/general/general_menu.dart';
import 'widgets/indoor_pool/indoor_pool_menu.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationDrawer(
      children: [
        CardsMenu(),
        Divider(),
        IndoorPoolMenu(),
        Divider(),
        GeneralMenu(),
      ],
    );
  }
}
