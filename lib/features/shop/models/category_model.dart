import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  /// Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: "", name: "", image: "", isFeatured: false);

  /// Convert model to json structure
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  /// Map json oriented document snapshot to the model
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map json record to the model
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
          parentId: data['ParentId'] ?? '');
    } else {
      return CategoryModel.empty();
    }
  }
}
