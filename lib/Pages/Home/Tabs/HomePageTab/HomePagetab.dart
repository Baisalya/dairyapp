import 'package:flutter/material.dart';

class HomePageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(title: 'Milk', icon: Icons.local_drink),
                  CategoryItem(title: 'Cheese', icon: Icons.emoji_food_beverage),
                  CategoryItem(title: 'Butter', icon: Icons.bakery_dining),
                  CategoryItem(title: 'Yogurt', icon: Icons.icecream),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7, // Adjust this to control the aspect ratio
                ),
                itemBuilder: (context, index) {
                  return ProductItem(
                    title: index == 0 ? 'Fresh Milk' : index == 1 ? 'Cheese' : index == 2 ? 'Butter' : 'Yogurt',
                    price: index == 0 ? '₹2.99' : index == 1 ? '\₹5.99' : index == 2 ? '\₹3.99' : '\₹1.99',
                    imageUrl: index == 0
                        ? 'https://cdn.zeptonow.com/production///tr:w-600,ar-1000-1000,pr-true,f-auto,q-80/cms/product_variant/ed7d2861-406b-4340-b2b7-43c6b25115ac.jpeg'
                        : index == 1
                        ? 'https://m.media-amazon.com/images/I/61+AzywctoL.jpg'
                        : index == 2
                        ? 'https://m.media-amazon.com/images/I/61duEBwvXdL.jpg'
                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRq1hbNnValesYGilSUF6u83d7y9Sr5H8z0cF-E1GSeCNEM4djWttQfq87GkCZJG24Avg&usqp=CAU',
                  );
                },
              ),
            ),
          ],
        ),
      ),
     /* bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),*/
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryItem({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40.0),
              SizedBox(height: 5.0),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductItem({Key? key, required this.title, required this.price, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price, style: TextStyle(fontSize: 14.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement add to cart functionality here
              },
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
