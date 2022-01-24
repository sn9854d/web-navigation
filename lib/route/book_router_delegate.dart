import 'package:book_app_nav_2/model/author.dart';
import 'package:book_app_nav_2/model/book.dart';
import 'package:book_app_nav_2/model/book_list.dart';
import 'package:book_app_nav_2/route/book_pages.dart';
import 'package:book_app_nav_2/route/book_route_path.dart';
import 'package:flutter/material.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> naviagationKey;
  Book? _selectedBook;
  bool show404 = false;
  Author? _selectedAuthor;

  BookRouterDelegate() : naviagationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: naviagationKey,
      pages: [
        BookListPage(books, handleBookTapped),
        if (_selectedBook != null) BookDetailPage(_selectedBook!, handleAuthor),
        if (_selectedAuthor != null) AuthorPage(author: _selectedAuthor),
        if (show404) const UnknowPage(),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        var data = route.settings.name;

        if (data == AuthorPage.routeName) _selectedAuthor = null;

        if (data == BookDetailPage.routeName) _selectedBook = null;

        show404 = false;

        notifyListeners();

        return true;
      },
    );
  }

  void handleBookTapped(Book book) {
    _selectedBook = book;

    notifyListeners();
  }

  void handleAuthor(Author author) {
    _selectedAuthor = author;

    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => naviagationKey;

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    if (configuration.isUnknowPage) {
      _selectedBook = null;
      _selectedAuthor = null;
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
      _selectedBook = books[index];
    } else {
      _selectedBook = null;
    }

    if (configuration.isAuthorPage) {
      var index = configuration.authorId;

      if (index! < 0 || index > authorList.length - 1) {
        show404 = true;
        return;
      }

      _selectedAuthor = authorList[index];
    } else {
      _selectedAuthor = null;
    }

    show404 = false;
  }

  @override
  BookRoutePath? get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    } else if (_selectedAuthor != null) {
      return BookRoutePath.authorPage(_selectedAuthor?.id);
    } else if (_selectedBook != null) {
      BookRoutePath.detailPage(_selectedBook?.slug);
    } else {
      return BookRoutePath.homePage();
    }
  }
}
