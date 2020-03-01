import 'package:shopping/models/category-list-item.model.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/repositories/category.repository.dart';
import 'package:shopping/repositories/product.repository.dart';

class HomeBloc {
  ProductRepository productRepository = new ProductRepository();
  CategoryRepository categoryRepository = new CategoryRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;

  String selectedCategory = "all";

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      this.products = data;
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      this.products = data;
    });
  }

  changeCategory(String tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
  }
}
