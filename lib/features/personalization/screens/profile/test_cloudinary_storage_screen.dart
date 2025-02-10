import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/constants/sizes.dart';

class TestCloudinaryStorageScreen extends StatefulWidget {
  const TestCloudinaryStorageScreen({super.key});

  @override
  State<TestCloudinaryStorageScreen> createState() =>
      _TestCloudinaryStorageScreenState();
}

class _TestCloudinaryStorageScreenState
    extends State<TestCloudinaryStorageScreen> {
  File? _imageFile;
  String? _imageUrl;
  String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
  }

  Future<void> _uploadImage() async {
    final url = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/upload");
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'preset-for-file-upload'
      ..files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      setState(() {
        final url = jsonMap['url'];
        _imageUrl = url;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your files"),
      ),
      body: Column(
        children: [
          if (_imageFile != null) ...{
            SizedBox(
              width: 100,
              height: 100,
              child: Image.file(_imageFile!),
            )
          },
          const Padding(
              padding: EdgeInsets.only(left: 20, top: 60, bottom: 100)),
          if (_imageUrl != null) ...{
            Padding(
                padding: const EdgeInsets.all(MSizes.defaultSpace),
                child: Column(children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(_imageUrl!),
                  ),
                  const SizedBox(height: MSizes.spaceBetweenItems),
                  Text(
                    "CloudinaryUrl: $_imageUrl",
                    style: const TextStyle(fontSize: 15),
                  ),
                ])),
            const Padding(
                padding: EdgeInsets.only(left: 20, top: 60, bottom: 100)),
          }
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: const Icon(Icons.camera),
          ),
          const SizedBox(height: MSizes.spaceBetweenSections),
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: const Icon(Icons.browse_gallery),
          ),
          const SizedBox(height: MSizes.spaceBetweenSections),
          if (_imageFile != null) ...{
            FloatingActionButton(
              onPressed: () => _uploadImage(),
              child: const Text("Upload"),
            ),
          },
        ],
      ),
    );
  }
}
