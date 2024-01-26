import 'package:api_practice/domain/model/product_add_model.dart';
import 'package:api_practice/domain/model/product_list_model.dart';
import 'package:api_practice/domain/model/product_model.dart';
import 'package:api_practice/domain/model/request_model.dart';
import 'package:api_practice/domain/model/search_products_model.dart';
import 'package:api_practice/domain/model/search_query_model.dart';

abstract interface class ProductRepository {
  Future<ProductListModel> retrieve();
  Future<ProductModel> retrieveSingle({required int id});
  Future<SearchProductsModel> search({required SearchQueryModel param});
  Future<ProductAddModel> add({required RequestModel body});
}