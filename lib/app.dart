import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patch_ecommerce/navigation_menu.dart';
import 'package:patch_ecommerce/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home: TNavigationMenu());
  }
}
