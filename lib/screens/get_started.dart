import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/// The GetStartedScreen provides an engaging entry point for the app with an illustration,
/// motivational text, and navigation buttons to the Register and Login screens.
/// It ensures the layout is displayed properly within a SafeArea to handle notches or insets.
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 163, 240, 219), // Green color for the status bar
    ));
    return Scaffold(
      body: SafeArea(
        // Set the SafeArea background color to green
        
        child: Container(
          color: Colors.green, // Green color for the SafeArea
          child: Stack(
            children: [
              // Background
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 163, 240, 219),
                ),
              ),
              // Content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Illustration
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('./assets/bookmark.webp'), // Add an illustration here
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Title
                  const Text(
                    'Read Books\nBe Smart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Subtitle
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Explore a world of knowledge. Start your journey today with our curated books.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(179, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40.0),
                    child: Column(
                      children: [
                        // Get Started Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Let's Get Started",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Sign In Button
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GetStartedScreen(),
  ));
}
