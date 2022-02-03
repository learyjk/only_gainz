import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:only_gainz/repositories/storage/storage_repository.dart';

class CustomImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            top: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            left: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            right: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: IconButton(
            iconSize: 56,
            onPressed: () async {
              ImagePicker _picker = ImagePicker();
              final XFile? _image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (_image == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('No image was selected.'),
                  ),
                );
              }
              if (_image != null) {
                print('Uploading...');
                StorageRepository().uploadImage(_image);
              }
            },
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
