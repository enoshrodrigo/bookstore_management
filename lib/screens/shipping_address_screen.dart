import 'package:flutter/material.dart';
import 'add_shipping_address_screen.dart';
import 'package:bookstore_management/screens/payment_method_screen.dart'; 

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  List<Map<String, String>> addresses = [
    {'type': 'Home', 'address': '1901 Thornridge Cir. Shiloh, Hawaii 81063'},
    {'type': 'Office', 'address': '4517 Washington Ave. Manchester, Kentucky 39495'},
  ];

  int? selectedAddressIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipping Address'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  title: Text(addresses[index]['type']!),
                  subtitle: Text(addresses[index]['address']!),
                  value: index,
                  groupValue: selectedAddressIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedAddressIndex = value;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final newAddress = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddShippingAddressScreen(),
                  ),
                );
                if (newAddress != null) {
                  setState(() {
                    addresses.add(newAddress);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color.fromARGB(255, 69, 148, 194),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Text(
                'Add New Address',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (selectedAddressIndex != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a shipping address!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color.fromARGB(255, 56, 207, 144),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}