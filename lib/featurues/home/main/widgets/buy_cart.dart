import 'package:flutter/material.dart';

class MealCards extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final int calories;

  const MealCards({
    super.key,
    required this.price,
    required this.name,
    required this.image,
    required this.calories,
  });

  @override
  State<MealCards> createState() => _MealCardsState();
}

class _MealCardsState extends State<MealCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 234, 216),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(widget.image, fit: BoxFit.cover,),
              )
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.price} sum', style: const TextStyle(fontWeight: FontWeight.w600),),
                      Text(widget.name, style: const TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.w600),),
                      Text('${widget.calories} cal', style: const TextStyle(fontSize: 10)),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Icon(Icons.favorite_outline_outlined),
                    ],
                  )
                ],
              )
            ],
          )),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
                onPressed: () {
                  setState(() {
                    showDialog(context: context, builder: (builder) {
                      return AlertDialog(
                        title: const Text('Order'),
                        content: const Text('Are you sure?'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Yes')),
                        ],
                      );
                    });
                  });
                },
                child: const Text('+', style: TextStyle(fontSize: 18))),
          )
        ],
      ),
    );
  }
}
