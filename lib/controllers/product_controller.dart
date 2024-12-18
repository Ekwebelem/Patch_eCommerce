import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:patch_ecommerce/models/product_model.dart';

class TProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Products> productsList = <Products>[].obs;
  RxList<Products> filteredProducts = <Products>[].obs;

  // Track the selected sort option
  RxString selectedSortOption = ''.obs;

  // Track the selected category
  RxString selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // Fetch products from the API
  fetchProducts() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://fakestoreapi.com/products?limit=50'));
      if (response.statusCode == 200) {
        List<Products> products = productsFromJson(response.body);
        productsList.value = products;

        // Initialize filtered products with all products
        filteredProducts.value = products;
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }

  // Sorting by price in ascending order
  void sortByPriceAscending() {
    filteredProducts.sort((a, b) => a.price.compareTo(b.price));
    selectedSortOption.value = 'lowest';
  }

  // Sorting by price in descending order
  void sortByPriceDescending() {
    filteredProducts.sort((a, b) => b.price.compareTo(a.price));
    selectedSortOption.value = 'highest';
  }

  // // Filter products by category
  void filterByCategory(String category) {
    if (category == 'All') {
      filteredProducts.value = productsList; // Show all products
    } else {
      filteredProducts.value = productsList
          .where(
              (product) => categoryValues.reverse[product.category] == category)
          .toList();
    }
    selectedCategory.value = category; // Update the selected category

    // Reset the sort option when the category is changed
    selectedSortOption.value = '';
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.value =
          productsList; // Show all products if query is empty
    } else {
      filteredProducts.value = productsList
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
