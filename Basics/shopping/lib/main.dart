import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingApp());
}

// Main application
class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      home: ShoppingList(),
    );
  }
}

// Product model
class Product {
  const Product({required this.name});

  final String name;
}

// Shopping list item
class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
    super.key,
  });

  final Product product;
  final bool inCart;
  final ValueChanged<bool> onCartChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onCartChanged(!inCart),

      leading: CircleAvatar(
        backgroundColor: inCart ? Colors.grey : Colors.blue,
        child: Text(
          product.name[0].toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),

      title: Text(
        product.name,
        style: TextStyle(
          color: inCart ? Colors.grey : Colors.black,
          decoration: inCart ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),

      trailing: Icon(
        inCart ? Icons.check_circle : Icons.shopping_bag_outlined,
        color: inCart ? Colors.green : Colors.grey,
      ),
    );
  }
}

// Shopping List screen
class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  // CHANGE 1: Initialize products directly.
  final List<Product> _products = [
    Product(name: 'Eggs'),
    Product(name: 'Flour'),
    Product(name: 'Chocolate chips'),
  ];

  // Stores purchased products.
  final Set<Product> _shoppingCart = {};

  // CHANGE 2: Input controller.
  final TextEditingController _itemController = TextEditingController();

  // CHANGE 3: Add item at the END of the queue.
  void _addItem() {
    final String itemName = _itemController.text.trim();

    if (itemName.isEmpty) return;

    setState(() {
      _products.add(Product(name: itemName));
      _itemController.clear();
    });
  }

  // CHANGE 4: Delete item from the BEGINNING.
  void _deleteFirstItem() {
    if (_products.isEmpty) return;

    setState(() {
      final Product removedProduct = _products.removeAt(0);
      _shoppingCart.remove(removedProduct);
    });
  }

  // CHANGE 5: Mark item as purchased or unpurchased.
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // CHANGE 6: Shopping item input.
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: 'Shopping item',
                      hintText: 'Enter item name',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),

                const SizedBox(width: 8),

                ElevatedButton(onPressed: _addItem, child: const Text('Add')),
              ],
            ),

            const SizedBox(height: 16),

            // CHANGE 7: Item count and delete button.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shopping Items: ${_products.length}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: _products.isEmpty ? null : _deleteFirstItem,
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete First'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // CHANGE 8: Scrollable shopping list.
            // The list occupies the remaining screen space.
            Expanded(
              child: _products.isEmpty
                  ? const Center(child: Text('Your shopping list is empty!'))
                  : ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final Product product = _products[index];

                        return ShoppingListItem(
                          key: ObjectKey(product),
                          product: product,
                          inCart: _shoppingCart.contains(product),
                          onCartChanged: (inCart) {
                            _handleCartChanged(product, inCart);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
