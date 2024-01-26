import 'package:api_practice/data/source/product_api.dart';
import 'package:api_practice/domain/model/product_add_model.dart';
import 'package:api_practice/domain/model/product_list_model.dart';
import 'package:api_practice/domain/model/product_model.dart';
import 'package:api_practice/domain/model/request_model.dart';
import 'package:api_practice/domain/model/search_products_model.dart';
import 'package:api_practice/domain/model/search_query_model.dart';
import 'package:api_practice/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi api;

  ProductRepositoryImpl(this.api);

  @override
  Future<ProductListModel> retrieve() async {
    return api.retrieve();
  }

  @override
  Future<ProductModel> retrieveSingle({required int id}) {
    return api.retrieveSingle(id: id);
  }

  @override
  Future<SearchProductsModel> search({required SearchQueryModel param}) {
    return api.search(param: param);
  }

  @override
  Future<ProductAddModel> add({required RequestModel body}) {
    return api.add(body: body);
  }
}