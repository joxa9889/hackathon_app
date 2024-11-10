import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/featurues/home/main/bloc/products_bloc.dart';
import 'package:hackathon_app/featurues/home/main/widgets/buy_cart.dart';
import 'package:hackathon_app/featurues/home/product/ui/products_ditail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductsBloc productBloc = ProductsBloc();

  @override
  void initState() {
    productBloc.add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 189, 191, 189),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 164, 161, 161),
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 221, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 12),
                          Text(
                            'Search',
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                right: 10, top: 10, bottom: 10),
                            height: 100,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/imgs/temp_add.jpg', fit: BoxFit.cover)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Meals with love :)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    BlocConsumer<ProductsBloc, ProductsState>(
                      bloc: productBloc,
                      listenWhen: (previous, current) =>
                          current is ProductsActionState,
                      buildWhen: (previous, current) =>
                          current is! ProductsActionState,
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is ProductsLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (state is ProductsErrorState) {
                          return Center(child: Text(state.errorMessage));
                        }

                        if (state is ProductsFetchedState) {
                          final successState = state as ProductsFetchedState;
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: successState.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Get.to(() => ProductDetailPage(
                                      price: (successState.products[index]['price'] ?? 0.0).toDouble(),
                                      image: successState.products[index]['image'],
                                      description: successState.products[index]['description'],
                                      name: successState.products[index]['name'],
                                      calories: (successState.products[index]['calories'] ?? 0.0).toDouble(),
                                      ingredients: successState.products[index]['ingredients'],
                                    ));
                                  },
                                  child: MealCards(
                                    price: (successState.products[index]['price'] ?? 0.0).toDouble(),
                                    name: successState.products[index]['name'],
                                    image: successState.products[index]['image'],
                                    calories: successState.products[index]
                                        ['calories'],
                                  ));
                            },
                          );
                        }

                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
