import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing_poc/presentation/details.dart';

import '../app_state.dart';
import '../router/ui_pages.dart';

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final items = List<String>.generate(10000, (i) => 'Item $i');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        title: const Text(
          'Items for sale',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => appState.currentAction =
                PageAction(state: PageState.addPage, page: SettingsPageConfig),
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_sharp),
            onPressed: () => appState.currentAction =
                PageAction(state: PageState.addPage, page: CheckoutPageConfig),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
              onTap: () {
                appState.currentAction = PageAction(
                    state: PageState.addWidget,
                    widget: Details(index),
                    page: DetailsPageConfig);
              },
            );
          },
        ),
      ),
    );
  }
}
