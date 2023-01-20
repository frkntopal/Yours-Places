import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:yoursplaces/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

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
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: () {},
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
