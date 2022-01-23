import 'package:book_app_nav_2/model/book.dart';
import 'package:flutter/material.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen(
      {Key? key, required this.books, required this.handleBookTapped})
      : super(key: key);
  final List<Book> books;
  final ValueChanged<Book> handleBookTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.extent(
            padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 1024 ? 50 : 16,
                vertical: 16),
            maxCrossAxisExtent: constraints.maxWidth > 1024 ? 300 : 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              for (var book in books)
                book.imageUrl != null
                    ? InkWell(
                        onTap: () => handleBookTapped(book),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  book.imageUrl!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 5,
                                  left: 5,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 30,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${book.rating}',
                                          style: const TextStyle(
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w700,
                                            height: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
