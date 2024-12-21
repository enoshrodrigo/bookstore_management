import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Receipt'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 1),
              child: Row(
                children: [
                  Icon(
                    Icons.receipt_long,
                    color: Colors.green,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Receipt Details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildDetailRow(Icons.shopping_cart, 'Order Number', '#123456'),
            const SizedBox(height: 12),

            _buildDetailRow(Icons.credit_card, 'Payment Method', 'Credit Card'),
            const SizedBox(height: 12),

            _buildDetailRow(Icons.attach_money, 'Amount', '\$50.00'),
            const SizedBox(height: 12),

            _buildDetailRow(Icons.calendar_today, 'Date', '12/21/2024'),
            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                shadowColor: Colors.black,
                elevation: 5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back to Payment Success',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.brown,
          size: 30,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '$title: $value',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
