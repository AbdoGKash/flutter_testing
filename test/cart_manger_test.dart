import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/widgets/cart_manger.dart';

void main() {
  group('CartManager', () {
    late CartManager cart;

    setUp(() {
      cart = CartManager();
    });

    test('adds a new item correctly', () {
      cart.addItem('1', 'Phone', 1000);
      expect(cart.items.length, 1);
      expect(cart.totalItems, 1);
    });

    test('adding duplicate item increases quantity', () {
      cart.addItem('1', 'Phone', 1000);
      cart.addItem('1', 'Phone', 1000);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 2);
    });

    test('discount is applied correctly', () {
      cart.addItem('1', 'Phone', 100, discount: 0.1);
      expect(cart.totalDiscount, 10);
      expect(cart.totalAmount, 90);
    });

    test('removing item works', () {
      cart.addItem('1', 'Phone', 100);
      cart.removeItem('1');
      expect(cart.items.isEmpty, true);
    });

    test('clearing cart empties all items', () {
      cart.addItem('1', 'Phone', 100);
      cart.addItem('2', 'Tablet', 200);
      cart.clearCart();
      expect(cart.items.isEmpty, true);
    });

    test('handles empty cart correctly', () {
      expect(cart.totalAmount, 0);
    });

    test('handles 100% discount', () {
      cart.addItem('1', 'Free Item', 100, discount: 1.0);
      expect(cart.totalAmount, 0);
    });

    test('quantity cannot go below 0', () {
      cart.addItem('1', 'Item', 50);
      cart.updateQuantity('1', 0);
      expect(cart.items.isEmpty, true);
    });
  });
}
