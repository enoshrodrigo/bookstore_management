import 'package:flutter/material.dart';

void main() {
  runApp(const SearchPage());
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shop',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 56, 207, 144),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      home: const SearchPageScreen(),
    );
  }
}

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key});

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  final List<Book> books = [
    Book(
      title: 'Dune',
      imageUrl:
          'https://images.booksense.com/images/322/099/9780593099322.jpg',
      price: 29.99,
      rating: 4.8,
      category: 'Science Fiction',
    ),
    Book(
      title: '1984',
      imageUrl:
          'https://cdn.waterstones.com/bookjackets/large/9780/1410/9780141036144.jpg',
      price: 19.99,
      rating: 4.7,
      category: 'Science Fiction',
    ),
    Book(
      title: 'Dracula',
      imageUrl:
          'https://cdn.kobo.com/book-images/88a05cf1-a3b6-461b-a8f7-f0e25b06274a/1200/1200/False/dracula-bram-stoker.jpg',
      price: 15.99,
      rating: 4.6,
      category: 'Horror',
    ),
     Book(
      title: 'Pride and Prejudice',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzPj2cpc0LYXo_LR4RLvXfTvDxeivF-y_mmg&s',
      price: 22.99,
      rating: 4.9,
      category: 'Romance', ),
  Book(
      title: 'The Hobbit',
      imageUrl: 'https://i5.walmartimages.com/seo/Lord-of-the-Rings-The-Hobbit-Graphic-Novel-Paperback_663b1072-039c-4791-abe6-da4907097d67.b9d2dc96d22c02f55c2d08f2dba3a11b.jpeg',
      price: 25.99,
      rating: 5.0,
      category: 'Fantasy',
      ),
  Book(
      title: 'Project Hail Mary',
      imageUrl: 'https://bookholics.lk/wp-content/uploads/2024/04/81Ck2nTaH2L._AC_UF8941000_QL80_.jpg',
      price: 27.99,
      rating: 4.9,
      category: 'Science Fiction',
      ),
  Book(
      title: 'Circe',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1565909496i/35959740.jpg',
      price: 18.99,
      rating: 4.7,
      category: 'Fantasy',
      ),
  Book(
      title: 'Mexican Gothic',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1607462569i/53152636.jpg',
      price: 16.99,
      rating: 4.6,
      category: 'Horror',
      ),
  Book(
      title: 'The Song of Achilles',
      imageUrl: 'https://books.lk/wp-content/uploads/2021/01/achilles.jpg',
      price: 21.99,
      rating: 4.8,
      category: 'Romance',
      )

  ];

  String selectedCategory = 'All';
  double minRating = 0.0;

  @override
  Widget build(BuildContext context) {
    List<Book> filteredBooks = books
        .where((book) =>
            (selectedCategory == 'All' || book.category == selectedCategory) &&
            book.rating >= minRating)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 56, 207, 144),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    items: const [
                      DropdownMenuItem(value: 'All', child: Text('All')),
                      DropdownMenuItem(
                          value: 'Science Fiction',
                          child: Text('Science Fiction')),
                      DropdownMenuItem(value: 'Horror', child: Text('Horror')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButton<double>(
                    value: minRating,
                    items: const [
                      DropdownMenuItem(value: 0.0, child: Text('All Ratings')),
                      DropdownMenuItem(value: 4.0, child: Text('4+ Stars')),
                      DropdownMenuItem(value: 4.5, child: Text('4.5+ Stars')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        minRating = value!;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.blueAccent),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(4.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${book.title} selected')),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.network(
                            book.imageUrl,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '\$${book.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  const SizedBox(width: 4),
                                  Text('${book.rating}',
                                      style: const TextStyle(
                                          fontSize: 16)),
                                ],
                              ),
                              const SizedBox(height: 5),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text('Buy Now'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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

  Book({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.category,
  });
}
