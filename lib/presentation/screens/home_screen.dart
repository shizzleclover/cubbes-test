import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: const Image(
                image: NetworkImage(""),
              ),
            ),

            const SizedBox(height: 20,),
            Padding(padding: Edgeinsets.symmetric(horizontal: 20)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Add your content here
                ],
              ),
            ),
          
        ),
      ),
    );
  }
}