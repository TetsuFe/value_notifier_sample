import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_notifier.dart';
import 'cart_repository.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カート'),
      ),
      body: CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  final cartNotifier = CartNotifier(repository: CartRepository());
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Cart>(
      valueListenable: cartNotifier,
      builder: (context, cart, _) {
        if (cart == null) {
          return const CircularProgressIndicator();
        }
        return Center(
          child: Column(
            children: [
              cart.items.length == 0
                  ? Text('カートは空です。')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text('${cart.items[index].name}'),
                        subtitle: Text('${cart.items[index].priceWithUnit}'),
                        trailing: FlatButton(
                          onPressed: () {
                            cartNotifier.remove(cart.items[index]);
                          },
                          color: Theme.of(context).accentColor,
                          child: Text('削除'),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
              Text('合計金額: ${cart.totalPriceWithUnit}'),
            ],
          ),
        );
      },
    );
  }
}
