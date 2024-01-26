import 'package:api_practice/domain/model/product_add_model.dart';
import 'package:api_practice/domain/model/product_model.dart';
import 'package:api_practice/domain/model/request_model.dart';
import 'package:api_practice/domain/model/search_products_model.dart';
import 'package:api_practice/domain/model/search_query_model.dart';
import 'package:api_practice/domain/repository/product_repository.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final ProductRepository repository;
  final int id;

  ProductAddModel? data;
  ProductModel? state;
  bool isLoading = false;
  SearchProductsModel? searchResult;

  ProductDetailViewModel({
    required this.id,
    required this.repository
  }) {
     _fetch();
  }

  Future<void> _fetch() async {
    isLoading = true;
    notifyListeners();
    state = await repository.retrieveSingle(id: id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> addProduct() async {
    data = await repository.add(body: RequestModel(state!.title));
    notifyListeners();
  }

  Future<void> search({required SearchQueryModel param}) async {
    isLoading = true;
    notifyListeners();
    searchResult = await repository.search(param: param);
    isLoading = false;
    notifyListeners();
  }


}