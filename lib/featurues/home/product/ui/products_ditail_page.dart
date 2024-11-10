import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final List<dynamic> ingredients;
  final double price;
  final double calories;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.calories,
    required this.ingredients
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.image);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 81, 180, 109),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(widget.image, fit: BoxFit.cover,)
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(widget.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Price: ${widget.price} sum',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text('Calories: ${widget.calories}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(height: 7),
              const Divider(),
              const SizedBox(height: 7),
              Text(
                  'Description: ${widget.description}',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 30),
              Text(
                  'Ingredients: ${widget.ingredients.join(', ')}',),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 40, // Full-width button
        child: ElevatedButton(
          onPressed: () {
            // Add product action
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: const Color.fromARGB(255, 54, 152, 82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Color.fromARGB(255, 35, 199, 82), // Border color
                width: 2, // Border width
              ),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Order Product',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(width: 15),
              Icon(Icons.shopping_cart, color: Colors.white),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
