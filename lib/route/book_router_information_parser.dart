import 'package:book_app_nav_2/route/book_route_path.dart';
import 'package:flutter/material.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    // handle '/'
    if (uri.pathSegments.isEmpty) {
      return BookRoutePath.homePage();
    }

    // handle '/<something>/:<somethig-slug>
    if (uri.pathSegments.length >= 2) {
      if (uri.pathSegments[0] != 'book' && uri.pathSegments[0] != 'author') {
        return BookRoutePath.unknown();
      }

      // handle '/book/:slug'
      if (uri.pathSegments[0] == 'book') {
        return BookRoutePath.detailPage(uri.pathSegments[1]);
      }

      // handle '/author/:authorSlug'
      var authorId = int.tryParse(uri.pathSegments[1]);
      return BookRoutePath.authorPage(authorId, '');
    }

    return BookRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    if (configuration.isAuthorPage) {
      return RouteInformation(location: '/author/${configuration.authorId}');
    }
    if (configuration.isDetailPage) {
      return RouteInformation(location: '/book/${configuration.slug}');
    }
    if (configuration.isHomePage) return const RouteInformation(location: '/');
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/404');
    }
  }
}
