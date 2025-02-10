// uploading files and images to cloudaniry
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

class MCloudinaryStorageService extends GetxController {
  static MCloudinaryStorageService get instance => Get.find();

  /// Upload local assets from IDE
  /// Returns a Uint8List containing image data.
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      // handle exception gracefully
      throw 'Error loading image data: $e';
    }
  }

  /// Upload Image using ImageData on cloud
  /// Returns the download URL of the uploaded image.
  Future<String?> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      // final ref = FirebaseStorage.instance.ref(path).child(name);
      // await ref.putData(image);
      // final url = await ref.getDownloadURL();
      // return url;

      final String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ??
          ''; // Replace with your Cloudinary cloud name
      const uploadPreset =
          "preset-for-file-upload"; // Set this in Cloudinary settings

      final url = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

      final request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(http.MultipartFile.fromBytes(path, image, filename: name));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);
        return jsonResponse['secure_url']; // Cloudinary Image URL
      } else {
        print("Cloudinary Upload Failed: ${response.reasonPhrase}");
        return null;
      }
    } catch (e) {
      // Handle the exception
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something went wrong! please try again';
      }
    }
  }

  /// Upload Image on cloud
  /// Returns the download URL of the uploaded image.
  Future<String?> uploadImageFile(String path, XFile image) async {
    final String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ??
        ''; // Replace with your Cloudinary cloud name
    const uploadPreset =
        "preset-for-file-upload"; // Set this in Cloudinary settings

    final url = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";
    try {
      // final ref = FirebaseStorage.instance.ref(path).child(image.name);
      // await ref.putFile(File(image.path));
      // final url = await ref.getDownloadURL();
      // return url;

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', image.path));

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);

      if (response.statusCode == 200) {
        return jsonResponse['secure_url']; // Cloudinary Image URL
      } else {
        print("Cloudinary Upload Failed: ${jsonResponse['error']['message']}");
        return null;
      }
    } catch (e) {
      // Handle the exception
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something went wrong! please try again';
      }
    }
  }
}
