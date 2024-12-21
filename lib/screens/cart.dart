import 'package:flutter/material.dart';
import 'package:bookstore_management/screens/shipping_address_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Dracula',
      'price': 15.0,
      'quantity': 1,
      'imageUrl': 'https://cdn.kobo.com/book-images/88a05cf1-a3b6-461b-a8f7-f0e25b06274a/1200/1200/False/dracula-bram-stoker.jpg'
    },
    {
      'name': 'Pride and Prejudice',
      'price': 20.0,
      'quantity': 2,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzPj2cpc0LYXo_LR4RLvXfTvDxeivF-y_mmg&s'
    },
    {
      'name': 'Circe',
      'price': 30.0,
      'quantity': 2,
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1565909496i/35959740.jpg'
    },
    {
      'name': 'The Song of Achilles',
      'price': 25.0,
      'quantity': 1,
      'imageUrl': 'https://books.lk/wp-content/uploads/2021/01/achilles.jpg'
    },
    {
      'name': '1984',
      'price': 40.0,
      'quantity': 3,
      'imageUrl': 'https://cdn.waterstones.com/bookjackets/large/9780/1410/9780141036144.jpg'
    }, 
     
  ];

  final TextEditingController _promoController = TextEditingController();

  double get _subTotal {
    return _cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    const double deliveryFee = 25.0;
    const double discount = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                        item['imageUrl'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['name']),
                      subtitle: Text('Price: \$${item['price']} x ${item['quantity']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (item['quantity'] > 1) {
                                  item['quantity']--;
                                }
                              });
                            },
                          ),
                          Text('${item['quantity']}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                item['quantity']++;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _cartItems.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: 
                 const Color.fromARGB(255, 56, 207, 144)
                  , // Seaborn-inspired blue
              ),
              onPressed: () {
                _showCheckoutSummary(context, _subTotal, deliveryFee, discount);
              },
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCheckoutSummary(BuildContext context, double subTotal, double deliveryFee, double discount) {
    final totalCost = subTotal + deliveryFee - discount;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _promoController,
                      decoration: InputDecoration(
                        hintText: 'Promo Code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 56, 207, 144), // Seaborn-inspired blue
                    ),
                    onPressed: () {
                      // Handle promo code application
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sub-Total:'),
                  Text('\$${subTotal.toStringAsFixed(2)}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Delivery Fee:'),
                  Text('\$${deliveryFee.toStringAsFixed(2)}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Discount:'),
                  Text('-\$${discount.toStringAsFixed(2)}'),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Cost:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalCost.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color.fromARGB(255, 56, 207, 144), // Seaborn-inspired blue
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShippingAddressScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Confirm and Pay',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }
}
