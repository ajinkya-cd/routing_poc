import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../router/ui_pages.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final items = appState.cartItems;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        title: const Text(
          'Checkout',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${items[index]}'),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      appState.currentAction = PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
                    },
                    child: const Text('Back To List'),
                  ),
                  const SizedBox(width: 16,),
                  ElevatedButton(
                    onPressed: () {
                      appState.clearCart();
                      appState.currentAction = PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
                    },
                    child: const Text('Clear Cart'),
                  ),
                ],
              ),
              const SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
