import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patch_ecommerce/controllers/product_controller.dart';
import 'package:patch_ecommerce/screens/widgets/search_container.dart';
import 'package:patch_ecommerce/utils/constants/colors.dart';
import 'package:patch_ecommerce/screens/widgets/category.dart';
import 'package:patch_ecommerce/screens/widgets/product.dart';
import 'package:patch_ecommerce/screens/widgets/sort_product.dart';

class THomeScreen extends StatelessWidget {
  THomeScreen({super.key});

  final TProductController controller = Get.put(TProductController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: TColors.primary,
                ),
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: TSearchContainer(
                      text: 'What are you looking for?',
                      icon: Icons.search,
                      controller: searchController,
                      onChanged: (value) {
                        controller.searchProducts(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose from any category',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  TCategoryScreen(controller: controller),
                  SizedBox(height: 10),
                  Obx(
                    () => Text(
                      '${controller.filteredProducts.length} products to choose from',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10),
                  TSortProductsScreen(controller: controller),
                  SizedBox(width: 30),
                  TProductScreen(controller: controller),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
