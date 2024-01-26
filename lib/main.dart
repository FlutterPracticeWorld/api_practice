import 'package:api_practice/data/repository_impl/product_repository_impl.dart';
import 'package:api_practice/data/source/product_api.dart';
import 'package:api_practice/dio/custom_interceptor.dart';
import 'package:api_practice/presentation/product/product_view.dart';
import 'package:api_practice/presentation/product/product_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ProductViewModel(
          repository: ProductRepositoryImpl(
            ProductApi(
              Dio()..interceptors.add(CustomInterceptor()),
              baseUrl: "https://dummyjson.com",
            ),
          ),
        ),
        builder: (_, __) {
          return const ProductView();
        },
      ),
    ),
  );
}
