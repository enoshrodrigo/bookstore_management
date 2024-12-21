import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Back navigation
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Profile Picture and Name
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('https://i.pinimg.com/736x/59/37/5f/59375f2046d3b594d59039e8ffbf485a.jpg'), // Replace with your image
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Esther Howard',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // List of Menu Items
            ListTile(
              leading: const Icon(Icons.person, color: Colors.brown),
              title: const Text('Your Profile'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Your Profile Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.brown),
              title: const Text('Payment Methods'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Payment Methods Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.brown),
              title: const Text('My Orders'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to My Orders Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.brown),
              title: const Text('Settings'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Settings Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.brown),
              title: const Text('Help Center'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Help Center Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.brown),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Privacy Policy Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.group_add, color: Colors.brown),
              title: const Text('Invite Friends'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Invite Friends Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Log Out functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
