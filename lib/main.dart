import 'package:bex/features/product/presentation/product_list/grid_view.dart';
import 'package:bex/features/product/presentation/product_list/product_list_screen.dart';
import 'package:bex/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bex Stores',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: 'Gilroy',
          appBarTheme: const AppBarTheme(
            backgroundColor: bexColor,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: bexColor,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        home: const ProductListScreen());
  }
}
