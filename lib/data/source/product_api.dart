import 'package:api_practice/domain/model/product_add_model.dart';
import 'package:api_practice/domain/model/product_list_model.dart';
import 'package:api_practice/domain/model/product_model.dart';
import 'package:api_practice/domain/model/request_model.dart';
import 'package:api_practice/domain/model/search_products_model.dart';
import 'package:api_practice/domain/model/search_query_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'product_api.g.dart';

@RestApi()
abstract class ProductApi {
  factory ProductApi(Dio dio, {required String baseUrl}) = _ProductApi;

  @GET("/products")
  Future<ProductListModel> retrieve();

  /// /products/1
  @GET("/products/{id}")
  Future<ProductModel> retrieveSingle({
    @Path() required int id,
  });

  /// /products/search?q=phone'
  @GET("/products/search")
  Future<SearchProductsModel> search({
    @Queries() required SearchQueryModel param,
  });

  /// https://dummyjson.com/products/add
  /// request{
  ///     title: 'BMW Pencil',
  ///     /* other product data */
  ///   }
  /** response: {
      ///   "id": 101,
      //   "title": "BMW Pencil",
      //   /* other product data */
      //   }

   **/
  @POST("/products/add")
  Future<ProductAddModel> add({@Body() required RequestModel body});
}
