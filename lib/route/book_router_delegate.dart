import 'package:book_app_nav_2/model/author.dart';
import 'package:book_app_nav_2/model/book.dart';
import 'package:book_app_nav_2/model/book_list.dart';
import 'package:book_app_nav_2/route/book_pages.dart';
import 'package:book_app_nav_2/route/book_route_path.dart';
import 'package:flutter/material.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _naviagationKey;

  BookRouterDelegate() : _naviagationKey = GlobalKey<NavigatorState>();

  Book? selectedBook;
  bool show404 = false;
  Author? selectedAuthor;

  void handleBookTapped(Book book) {
    selectedBook = book;

    notifyListeners();
  }

  void handleAuthor(Author author) {
    selectedAuthor = author;

    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _naviagationKey,
        pages: [
          BookListPage(books, handleBookTapped),
          if (selectedBook != null) BookDetailPage(selectedBook!, handleAuthor),
          if (selectedAuthor != null) AuthorPage(author: selectedAuthor),
          if (show404) const UnknowPage(),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;

          selectedBook = null;
          selectedAuthor = null;

          show404 = false;
          notifyListeners();

          return true;
        });
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _naviagationKey;

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    if (configuration.isUnknowPage) {
      selectedBook = null;
      show404 = true;

      return;
    }

    if (configuration.isDetailPage) {
      var index =
          books.indexWhere((element) => element.slug == configuration.slug);
      if (index == -1) {
        show404 = true;
        return;
      }
      selectedBook = books[index];
    } else {
      selectedBook = null;
    }

    if (configuration.isAuthorPage) {
      var index = configuration.authorId;

      if (index! < -1 || index > authorList.length - 1) {
        show404 = true;
        return;
      }

      selectedAuthor = authorList[index];
    } else {
      selectedAuthor = null;
    }

    show404 = false;
  }

  @override
  BookRoutePath? get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    if (selectedAuthor != null) {
      return BookRoutePath.authorPage(selectedAuthor?.id);
    }
    if (selectedBook != null) {
      BookRoutePath.detailPage(selectedBook?.slug);
    }
    return BookRoutePath.homePage();
  }
}
