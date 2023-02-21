import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yoursplaces/providers/great_places.dart';
import 'package:yoursplaces/screens/add_place_screen.dart';
import 'package:yoursplaces/screens/place_detail_screen.dart';
import 'package:yoursplaces/screens/places_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yours Places',
        theme: ThemeData(
          primaryColor: Colors.white54,
          accentColor: Colors.black87,
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen(),
          PlaceDetailScreen.routeName: (ctx) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}
