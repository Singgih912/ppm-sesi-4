import 'package:flutter/foundation.dart';
import '../models/book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({
    required this.book,
    this.quantity = 1,
  });

  int get subtotal => book.price * quantity;
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => Map.unmodifiable(_items);

  List<CartItem> get itemList => _items.values.toList();

  int get totalItems {
    int total = 0;
    for (final item in _items.values) {
      total += item.quantity;
    }
    return total;
  }

  int get totalPrice {
    int total = 0;
    for (final item in _items.values) {
      total += item.book.price * item.quantity;
    }
    return total;
  }

  void addItem(Book book) {
    if (_items.containsKey(book.id)) {
      _items[book.id]!.quantity += 1;
    } else {
      _items[book.id] = CartItem(book: book, quantity: 1);
    }
    notifyListeners();
  }

  void removeItem(String bookId) {
    if (!_items.containsKey(bookId)) return;

    if (_items[bookId]!.quantity > 1) {
      _items[bookId]!.quantity -= 1;
    } else {
      _items.remove(bookId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}