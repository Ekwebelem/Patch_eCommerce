import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:patch_ecommerce/screens/home.dart';
import 'package:patch_ecommerce/utils/constants/colors.dart';
import 'package:patch_ecommerce/utils/helpers/helper_functions.dart';

class TNavigationMenu extends StatelessWidget {
  const TNavigationMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 1,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? TColors.secondary : TColors.white,
            indicatorColor: darkMode
                ? TColors.white.withOpacity(0.1)
                : TColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.search), label: 'Discover'),
              NavigationDestination(
                  icon: Icon(Icons.card_travel), label: 'Cart'),
              NavigationDestination(
                  icon: Icon(Icons.add_circle_outline_outlined), label: 'Sell'),
              NavigationDestination(
                  icon: Icon(Icons.inbox_outlined), label: 'Inbox'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    THomeScreen(),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    ),
  ];
}
