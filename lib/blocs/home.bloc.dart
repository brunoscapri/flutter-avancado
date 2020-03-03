import 'package:flutter/material.dart';

import 'package:shopping/models/category-list-item.model.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/repositories/category.repository.dart';
import 'package:shopping/repositories/product.repository.dart';

class HomeBloc extends ChangeNotifier {
  ProductRepository productRepository = new ProductRepository();
  CategoryRepository categoryRepository = new CategoryRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;

  String selectedCategory = "all";

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(String tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners();
  }
}
