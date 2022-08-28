import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/splashscreen/splash_screen_page.dart';
import 'package:pustok/providers/authentication/authentication_provider.dart';
import 'package:pustok/providers/onboarding/onboarding_provider.dart';
import 'package:pustok/providers/purchase/purchase_provider.dart';
import 'package:pustok/providers/wishlist/wishlist_provider.dart';

import 'providers/books_provider/books_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<OnboardingProvider>(
        create: (context) => OnboardingProvider(),
      ),
      ChangeNotifierProvider<AuthenticationProvider>(
        create: (context) => AuthenticationProvider(),
      ),
      ChangeNotifierProvider<BooksProvider>(
        create: (context) => BooksProvider(),
      ),
      ChangeNotifierProvider<WishListProvider>(
        create: (context) => WishListProvider(),
      ),
      ChangeNotifierProvider<PurchaseProvider>(
        create: (context) => PurchaseProvider(),
      ),

    ],
      child: Pustok(),
    ),
  );

}

class Pustok extends StatelessWidget {
  const Pustok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}

