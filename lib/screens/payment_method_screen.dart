import 'package:bookstore_management/screens/add_card_screen.dart';
import 'package:bookstore_management/screens/payment_success_screen.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Credit & Debit Card'),
            leading: const Icon(Icons.credit_card),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AddCardScreen()));
              },
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Paypal'),
            leading: Icon(Icons.payment),
          ),
          const ListTile(
            title: Text('Apple Pay'),
            leading: Icon(Icons.apple),
          ),
          const ListTile(
            title: Text('Google Pay'),
            leading: Icon(Icons.payments),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.brown,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentSuccessScreen()));
              },
              child: const Text('Confirm Payment', style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
