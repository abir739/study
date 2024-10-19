// product for sale filtred by category

// user products

// get all categories List

// get all products List

// get user cart: user products

//add item to cart

// delete item from cart

import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';

class ShopModel {
  final List<CategoryModel> _categoryList = [
    CategoryModel(
        id: 'c1', image: 'lib/images/men.jpg', name: 'Men', productList: []),
    CategoryModel(
        id: 'c2',
        image: 'lib/images/women.webp',
        name: 'Women',
        productList: []),
    CategoryModel(
        id: 'c3',
        image: 'lib/images/child.avif',
        name: 'Child',
        productList: []),
    CategoryModel(
        id: 'c4',
        image: 'lib/images/shoes.webp',
        name: 'Shoes',
        productList: []),
    CategoryModel(
        id: 'c5',
        image: 'lib/images/robe.jpeg',
        name: 'Robes',
        productList: []),
  ];

  final List<ProductModel> _productList = [
    ProductModel(
        id: 'p1',
        name: 'Men\'s Shirt',
        description: 'A stylish shirt',
        price: '29.99',
        image: 'lib/images/shirt.jpg',
        categoryId: '1'),
    ProductModel(
        id: 'p2',
        name: 'Women\'s Dress',
        description: 'A beautiful dress',
        price: '49.99',
        image: 'lib/images/dress.jpg',
        categoryId: '2'),
    ProductModel(
        id: 'p3',
        name: 'Men\'s Shirt',
        description: 'A stylish shirt',
        price: '29.99',
        image: 'lib/images/shirt.jpg',
        categoryId: '1'),
    ProductModel(
        id: 'p4',
        name: 'Women\'s Dress',
        description: 'A beautiful dress',
        price: '49.99',
        image: 'lib/images/dress.jpg',
        categoryId: '2'),
  ];

  // Assign products to categories based on categoryId
  void _populateProducts() {
    for (var product in _productList) {
      final category = _categoryList.firstWhere(
          (cat) => cat.id == product.categoryId,
          orElse: () =>
              CategoryModel(id: '', name: '', image: '', productList: []));
      if (category.id.isNotEmpty) {
        category.productList.add(product);
      }
    }
  }

// get Categories

  List<CategoryModel> getCategories() {
    return _categoryList;
  }

// get products by category

  List<ProductModel> getProductsByCategory(String categoryId) {
    return _categoryList.firstWhere((cat) => cat.id == categoryId).productList;
  }
}
