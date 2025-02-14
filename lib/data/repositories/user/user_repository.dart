import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_splash_test1/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../features/authentication/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _auth = AuthenticationRepository.instance;

  /// Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw MFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatExceptions();
    } on PlatformException catch (e) {
      throw MPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong please try again';
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db.collection("Users").doc(_auth.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw MFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatExceptions();
    } on PlatformException catch (e) {
      throw MPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong please try again';
    }
  }

  /// Function to update user data in firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw MFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatExceptions();
    } on PlatformException catch (e) {
      throw MPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong please try again';
    }
  }

  /// Update any field in specific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw MFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatExceptions();
    } on PlatformException catch (e) {
      throw MPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong please try again';
    }
  }

  /// Function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw MFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatExceptions();
    } on PlatformException catch (e) {
      throw MPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong please try again';
    }
  }

  /// upload image using cloudinary storage
  Future<String> uploadImageC(FilePickerResult filePickerResult) async {
    try {
      File file = File(filePickerResult.files.single.path!);

      String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';

      // create a multipartRequest to upload the file
      var uri =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/raw/upload");
      var request = http.MultipartRequest("POST", uri);

      // read the file content as bytes
      var fileBytes = await file.readAsBytes();
      var multipartFile = http.MultipartFile.fromBytes(
        'file', // The formfield name for the file
        fileBytes,
        filename:
            file.path.split("/").last, // The file name to send in the request
      );

      // Add the file part to the request
      request.files.add(multipartFile);

      request.fields['upload_preset'] = "preset-for-file-upload";
      request.fields['resource_type'] = "raw";

      // send the request and await the response
      var response = await request.send();

      // Get the response as text
      var responseBody = await response.stream.bytesToString();
      var jsonMap = jsonDecode(responseBody);
      final url = jsonMap['url'];
      return url;
    } on FirebaseException catch (e) {
      throw MFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatExceptions();
    } on PlatformException catch (e) {
      throw MPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong please try again';
    }
  }

  /// upload any image using fire storage
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw MFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatExceptions();
    } on PlatformException catch (e) {
      throw MPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong please try again';
    }
  }
}
