import 'package:book_app_nav_2/model/author.dart';
import 'package:book_app_nav_2/model/publication.dart';
import 'package:book_app_nav_2/model/review.dart';

class Book {
  final String title;
  final String author;
  final String? imageUrl;
  final String slug;
  final List<Review>? reviewList;
  final Publication? publication;
  final Author? authors;
  final double? rating;
  final int? ratingCount;
  final String? publishedDate;

  Book(
    this.title,
    this.author,
    this.slug, {
    this.imageUrl,
    this.reviewList,
    this.publication,
    this.authors,
    this.rating,
    this.ratingCount,
    this.publishedDate,
  });
}
