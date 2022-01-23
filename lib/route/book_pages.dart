import 'package:book_app_nav_2/model/author.dart';
import 'package:book_app_nav_2/model/book.dart';
import 'package:book_app_nav_2/screens/author_screen.dart';
import 'package:book_app_nav_2/screens/book_details_screen.dart';
import 'package:book_app_nav_2/screens/book_list_screen.dart';
import 'package:book_app_nav_2/screens/unknown_screnn.dart';
import 'package:flutter/material.dart';

class BookListPage extends Page {
  const BookListPage(this.books, this.handleBookTapped)
      : super(key: const ValueKey('homepage'));

  final List<Book> books;
  final ValueChanged<Book> handleBookTapped;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (context, anim1, anim2) =>
            BookListScreen(books: books, handleBookTapped: handleBookTapped),
        settings: this);
  }
}

class BookDetailPage extends Page {
  final Book book;
  final ValueChanged<Author> handleAuthorTapped;
  BookDetailPage(this.book, this.handleAuthorTapped)
      : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (context, anim1, anim2) => BookdDetailsScreen(
              book: book,
              handleAuthorTapped: handleAuthorTapped,
            ),
        settings: this);
  }
}

class UnknowPage extends Page {
  const UnknowPage() : super(key: const ValueKey('UnknowPage'));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (contex, anim1, anime2) => const UnknownScreen(),
      settings: this,
    );
  }
}

class AuthorPage extends Page {
  final Author? author;

  AuthorPage({this.author}) : super(key: ValueKey(author));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, anim1, anime2) => AuthorScreen(author: author),
      settings: this,
    );
  }
}
