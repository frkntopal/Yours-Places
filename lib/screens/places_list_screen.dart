import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:yoursplaces/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.3),
        title: const Text(
          'Your Places',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              }),
              icon: const Icon(Ionicons.location))
        ],
      ),
      body: const Center(
        child: null,
      ),
    );
  }
}
