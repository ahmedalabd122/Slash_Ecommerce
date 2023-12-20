import 'package:flutter/material.dart';
import 'package:slash_internship_assignment/core/theme/app_color_theme.dart';
import 'package:slash_internship_assignment/features/products_page/presentation/pages/products_page.dart';

import 'core/routes/route_generator.dart';

void main() {
  runApp(const SlashECommerceApp());
}

class SlashECommerceApp extends StatelessWidget {
  const SlashECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsPage(),
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: AppColorTheme.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
            centerTitle: true, backgroundColor: AppColorTheme.backGround),
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: AppColorTheme.primaryColor,
          background: AppColorTheme.backGround,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
