import 'package:api_practice/data/repository_impl/product_repository_impl.dart';
import 'package:api_practice/data/source/product_api.dart';
import 'package:api_practice/dio/custom_interceptor.dart';
import 'package:api_practice/domain/model/product_model.dart';
import 'package:api_practice/presentation/product/product_view_model.dart';
import 'package:api_practice/presentation/product_detail/product_detail_view.dart';
import 'package:api_practice/presentation/product_detail/product_detail_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("API 테스트"),
      ),
      body: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.products.length,
              itemBuilder: (_, index) => _item(viewModel.products[index]),
            ),
    );
  }

  Widget _item(ProductModel data) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => ProductDetailViewModel(
                    id: data.id,
                    repository: ProductRepositoryImpl(
                      ProductApi(
                        Dio()..interceptors.add(CustomInterceptor()),
                        baseUrl: "https://dummyjson.com",
                      ),
                    ),
                  ),
              builder: (_, __) {
                return const ProductDetailView();
              }),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("title ${data.title}"),
          Text(
            "description ${data.description}",
          ),
          Text(
            "price ${data.price}원",
          ),
          Text(
            "discount ${data.discountPercentage}%",
          ),
          Text("rating ${data.rating}"),
          Text(
            "stock ${data.stock}",
          ),
          Text("brand ${data.brand}"),
          Text("category ${data.category}"),
          Image.network(data.thumbnail)
        ],
      ),
    );
  }
}

/// MVVM패턴(아키텍쳐)
///
/// V => 서용자의 입력을 받아서 뷰모델에 전달
/// VM => 뷰에서 전달받은 요청을 모델에 전달
/// M => 뷰모델로부터 전달받은 요청을 처리, 뷰모델에 전달
/// VM => 모델로부터 전달받은 결과를 뷰에 자동으로 갱신
