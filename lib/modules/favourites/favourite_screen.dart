import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<Product> favourites = [
    Product(
        id: 1,
        name: 'Cabbage',
        image: 'assets/images/cabbage.png',
        description: 'Green crop',
        price: 250,
        category: 'Vegetables',
        unit: '2kg'),
    Product(
        id: 2,
        name: 'Tuna',
        image: 'assets/images/cabbage.png',
        description: 'Healthy fish',
        price: 550,
        category: 'Fish',
        unit: '1pc'),
    Product(
        id: 3,
        name: 'Mango',
        image: 'assets/images/cabbage.png',
        description: 'Tasty',
        price: 150,
        category: 'Fruit',
        unit: '1kg'),
    Product(
        id: 4,
        name: 'Chicken',
        image: 'assets/images/cabbage.png',
        description: 'Fiesty',
        price: 250,
        category: 'Meat',
        unit: '1kg'),
    Product(
        id: 5,
        name: 'Mutton',
        image: 'assets/images/cabbage.png',
        description: 'Tender',
        price: 500,
        category: 'Meat',
        unit: '1kg'),
    Product(
        id: 6,
        name: 'Salmon',
        image: 'assets/images/cabbage.png',
        description: 'Slender body',
        price: 1550,
        category: 'Fish',
        unit: '5pcs'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              leading: Image.asset(favourites[index].image),
              title: Text(favourites[index].name),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                                'Are you sure you want to remove this item?'),
                            content: Text('Yes'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      favourites.removeAt(index);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text('Remove'))
                            ],
                          ));
                },
                icon: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
