import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patch_ecommerce/controllers/product_controller.dart';
import 'package:patch_ecommerce/utils/constants/colors.dart';

class TSortProductsScreen extends StatelessWidget {
  const TSortProductsScreen({
    super.key,
    required this.controller,
  });

  final TProductController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            controller.sortByPriceAscending();
          },
          child: Obx(
            () => Container(
              width: 160,
              height: 40,
              decoration: BoxDecoration(
                color: controller.selectedSortOption.value == 'lowest'
                    ? TColors.primary
                    : TColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Lowest price first',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedSortOption.value == 'lowest'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            controller.sortByPriceDescending();
          },
          child: Obx(
            () => Container(
              width: 160,
              height: 40,
              decoration: BoxDecoration(
                color: controller.selectedSortOption.value == 'highest'
                    ? TColors.primary
                    : TColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Highest price first',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedSortOption.value == 'highest'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
