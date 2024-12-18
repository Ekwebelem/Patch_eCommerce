import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patch_ecommerce/controllers/product_controller.dart';
import 'package:patch_ecommerce/models/product_model.dart';
import 'package:patch_ecommerce/utils/constants/colors.dart';

class TCategoryScreen extends StatelessWidget {
  const TCategoryScreen({
    super.key,
    required this.controller,
  });

  final TProductController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categoryValues.map.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final categoryEnum = Category.values[index];
                  final categoryName = categoryValues.reverse[categoryEnum]!;

                  // Find the first product in the category
                  final categoryProduct = controller.productsList.firstWhere(
                    (product) => product.category == categoryEnum,
                    orElse: () => Products(
                      id: -1,
                      title: '',
                      price: 0.0,
                      description: '',
                      category: categoryEnum,
                      image: 'No image found',
                      rating: Rating(rate: 0.0, count: 0),
                    ),
                  );

                  return GestureDetector(
                    onTap: () {
                      controller.filterByCategory(
                          categoryName); // Updates selectedCategory
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Obx(
                        () {
                          // Observe selectedCategory to dynamically update UI
                          final isSelected =
                              controller.selectedCategory.value == categoryName;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? TColors.primary2
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    categoryProduct.image,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 85,
                                child: Text(
                                  categoryName[0].toUpperCase() +
                                      categoryName.substring(1).toLowerCase(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
