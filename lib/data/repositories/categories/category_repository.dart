import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_splash_test1/features/shop/models/category_model.dart';
import 'package:flutter_splash_test1/data/services/cloud_storage/cloudinary_service.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
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

  /// Get sub categories

  /// upload category to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the categories along with their images
      final storage = Get.put(MCloudinaryStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its URL
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // Assign URL category image attribute
        category.image = url!;

        // Store Category in firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
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
}
