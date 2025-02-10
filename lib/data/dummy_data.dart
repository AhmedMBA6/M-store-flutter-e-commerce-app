import 'package:flutter_splash_test1/features/shop/models/category_model.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';

class MDummyData {
  /// -- List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: MImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Furniture',
        image: MImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: MImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: MImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Electronics',
        image: MImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: MImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: MImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '8',
        name: 'Jewelery',
        image: MImages.jeweleryIcon,
        isFeatured: true),

    /// subCategories
    CategoryModel(
        id: '12',
        name: 'sport shoes',
        image: MImages.sportIcon,
        isFeatured: false,
        parentId: '1'),

    CategoryModel(
        id: '15',
        name: 'track suits',
        image: MImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '14',
        name: 'Sports Equipments',
        image: MImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
  ];
}
