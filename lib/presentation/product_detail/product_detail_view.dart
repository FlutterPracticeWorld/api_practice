import 'package:api_practice/domain/model/search_query_model.dart';
import 'package:api_practice/presentation/product_detail/product_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductDetailViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                GestureDetector(
                  onTap: viewModel.addProduct,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("title ${state!.title}"),
                      Text(
                        "description ${state.description}",
                      ),
                      Text(
                        "price ${state.price}원",
                      ),
                      Text(
                        "discount ${state.discountPercentage}%",
                      ),
                      Text("rating ${state.rating}"),
                      Text(
                        "stock ${state.stock}",
                      ),
                      Text("brand ${state.brand}"),
                      Text("category ${state.category}"),
                      Image.network(state.thumbnail),
                    ],
                  ),
                ),
                // collection if, collection for
                Consumer<ProductDetailViewModel>(
                  builder: (_, viewModel, __) {
                    return Column(
                      children: [
                        if (viewModel.data != null) ...[
                          Text(viewModel.data!.id.toString()),
                          Text(viewModel.data!.title),
                        ]
                      ],
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () => Scaffold.of(context).showBottomSheet(
                        (context) => const SearchBottomSheet(),
                      ),
                      child: Text("검색 뷰"),
                    );
                  }
                ),
              ],
            ),
    );
  }
}

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductDetailViewModel>();

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onSubmitted: (text) => viewModel.search(param: SearchQueryModel(keyword: text)),
            ),
            if (viewModel.searchResult != null)
              ...viewModel.searchResult!.products.map((e) => Text(e.toJson().toString()))
          ],
        ),
      ),
    );
  }
}

