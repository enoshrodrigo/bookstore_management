import 'package:flutter/material.dart';
import 'screens/get_started.dart';
import 'screens/register.dart';
import 'screens/login.dart';
import 'screens/home.dart';

void main() {
  runApp( const BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  const BookstoreApp({super.key});
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/get_started',
      routes: {
        '/get_started': (context) => const GetStartedScreen(),
        '/register': (context) =>const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) =>  const HomeScreen(),
      },
    );
  }
}
