import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'cart.dart';
import 'cart_repository.dart';
import 'item.dart';

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier({@required this.repository}) : super(null) {
    init();
  }

  void init() async {
    state = await repository.get();
  }

  void update(Cart cart) {
    state = cart;
  }

  void remove(Item item) {
    this.state = state.remove(item);
  }

  final CartRepository repository;
}
