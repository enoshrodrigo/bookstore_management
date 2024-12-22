import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    List<Book> filteredBooks = selectedCategory == 'All'
        ? books
        : books.where((book) => book.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Wishlist',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFilterButton('All'),
                  const SizedBox(width: 10.0),
                  _buildFilterButton('Science Fiction'),
                  const SizedBox(width: 10.0),
                  _buildFilterButton('Fantasy'),
                  const SizedBox(width: 10.0),
                  _buildFilterButton('Horror'),
                  const SizedBox(width: 10.0),
                  _buildFilterButton('Romance'),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.65,
              ),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(book: filteredBooks[index]),
                      ),
                    );
                  },
                  child: _buildBookCard(filteredBooks[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    bool isSelected = selectedCategory == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 62, 144, 168) : const Color.fromARGB(255, 78, 204, 162),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBookCard(Book book) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              book.imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${book.price}',
                        style: const TextStyle(color: Colors.grey)),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16.0, color: Colors.amber),
                        Text('${book.rating}',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Book book;

  const ProductDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFFE0F7F1), // Light sea green background for the image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  book.imageUrl,
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  Text(
                    '${book.rating}',
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 32.0,
                        color: index < book.rating.round()
                            ? Colors.amber
                            : Colors.grey,
                      );
                    }),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Out of 5 stars',
                    style: TextStyle(fontSize: 16.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${book.price}',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Product Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              book.description,
              style: const TextStyle(fontSize: 16.0, height: 1.5, color: Colors.black54),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Updated button color
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final String imageUrl;
  final double price;
  final double rating;
  final String category;
  final String description;

  Book({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.category,
    required this.description,
  });
}

final List<Book> books = [
  Book(
      title: 'Dune',
      imageUrl: 'https://images.booksense.com/images/322/099/9780593099322.jpg',
      price: 29.99,
      rating: 4.8,
      category: 'Science Fiction',
      description: 'A science fiction masterpiece by Frank Herbert that explores politics, religion, and ecology on the desert planet of Arrakis.'),
  Book(
      title: '1984',
      imageUrl: 'https://cdn.waterstones.com/bookjackets/large/9780/1410/9780141036144.jpg',
      price: 19.99,
      rating: 4.7,
      category: 'Science Fiction',
      description: 'George Orwell’s dystopian novel set in a totalitarian society under constant surveillance.'),
  Book(
      title: 'Dracula',
      imageUrl: 'https://cdn.kobo.com/book-images/88a05cf1-a3b6-461b-a8f7-f0e25b06274a/1200/1200/False/dracula-bram-stoker.jpg',
      price: 15.99,
      rating: 4.6,
      category: 'Horror',
      description: 'Bram Stoker’s gothic horror classic about Count Dracula and his attempt to move from Transylvania to England.'),
  Book(
      title: 'Pride and Prejudice',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzPj2cpc0LYXo_LR4RLvXfTvDxeivF-y_mmg&s',
      price: 22.99,
      rating: 4.9,
      category: 'Romance',
      description: 'Jane Austen’s beloved tale of love, social standing, and moral character featuring Elizabeth Bennet and Mr. Darcy.'),
  Book(
      title: 'The Hobbit',
      imageUrl: 'https://i5.walmartimages.com/seo/Lord-of-the-Rings-The-Hobbit-Graphic-Novel-Paperback_663b1072-039c-4791-abe6-da4907097d67.b9d2dc96d22c02f55c2d08f2dba3a11b.jpeg',
      price: 25.99,
      rating: 5.0,
      category: 'Fantasy',
      description: 'J.R.R. Tolkien’s fantasy adventure about Bilbo Baggins’ journey to reclaim a treasure guarded by a dragon.'),
  Book(
      title: 'Project Hail Mary',
      imageUrl: 'https://bookholics.lk/wp-content/uploads/2024/04/81Ck2nTaH2L._AC_UF8941000_QL80_.jpg',
      price: 27.99,
      rating: 4.9,
      category: 'Science Fiction',
      description: 'Andy Weir’s thrilling space adventure about a lone astronaut’s mission to save humanity.'),
  Book(
      title: 'Circe',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1565909496i/35959740.jpg',
      price: 18.99,
      rating: 4.7,
      category: 'Fantasy',
      description: 'Madeline Miller’s feminist retelling of the Greek myth of Circe, a goddess with extraordinary powers.'),
  Book(
      title: 'Mexican Gothic',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1607462569i/53152636.jpg',
      price: 16.99,
      rating: 4.6,
      category: 'Horror',
      description: 'Silvia Moreno-Garcia’s chilling gothic horror set in a remote Mexican mansion.'),
  Book(
      title: 'The Song of Achilles',
      imageUrl: 'https://books.lk/wp-content/uploads/2021/01/achilles.jpg',
      price: 21.99,
      rating: 4.8,
      category: 'Romance',
      description: 'Madeline Miller’s lyrical retelling of the relationship between Achilles and Patroclus during the Trojan War.')
];
