import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../router/ui_pages.dart';

class Details extends StatelessWidget {
  final int id;

  const Details(this.id);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Item $id',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.addToCart('Item $id');
                  appState.currentAction = PageAction(state: PageState.pop);
                },
                child: const Text('Add to Cart'),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () => appState.currentAction = PageAction(state: PageState.addPage, page: CartPageConfig),
                child: const Text('Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
