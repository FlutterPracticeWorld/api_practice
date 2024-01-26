import 'package:api_practice/domain/model/product_model.dart';
import 'package:api_practice/domain/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository;

  List<ProductModel> products = [];
  bool isLoading = false;

  ProductViewModel({required this.repository}) {
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      isLoading = true;
      notifyListeners();

      final response  = await repository.retrieve();
      products = response.products;

      isLoading= false;
      notifyListeners();
    } catch (e) {
        // 예외처리
    }
  }
}