import 'package:flutter/material.dart';
import 'package:slash_internship_assignment/features/product_details_page/presentation/pages/product_details_page.dart';
import 'package:slash_internship_assignment/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SlashECommerceApp());
      case '/productDetailsPage':
        return MaterialPageRoute(
          builder: (_) =>
              ProductDetailsPage(productId: int.parse(args.toString())),
        );
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
