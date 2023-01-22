import 'package:flutter/material.dart';
import 'dart:io';

import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:yoursplaces/providers/great_places.dart';
import 'package:yoursplaces/widgets/image_input.dart';
import 'package:yoursplaces/widgets/location_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savedPlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectImage),
                  const SizedBox(
                    height: 10,
                  ),
                  const LocationInput(),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _savedPlace,
            style: ElevatedButton.styleFrom(
              primary: Colors.black.withOpacity(0.2),
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: const Icon(Ionicons.add_sharp),
            label: const Text(
              'Add Place',
            ),
          )
        ],
      ),
    );
  }
}
