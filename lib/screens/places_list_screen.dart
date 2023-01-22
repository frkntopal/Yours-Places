// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:yoursplaces/providers/great_places.dart';
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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: const Center(
                  child: Text('Start adding some'),
                ),
                builder: (ctx, greatPlace, ch) => greatPlace.items.length <= 0
                    ? ch! // include ! for null safety to make sure that you telling dart it will not be a null
                    : ListView.builder(
                        itemCount: greatPlace.items.length,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlace.items[index].image),
                          ),
                          title: Text(greatPlace.items[index].title),
                          onTap: () {
                            // go to detail screen
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
