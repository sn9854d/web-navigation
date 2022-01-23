import 'package:book_app_nav_2/model/review.dart';

class Publication {
  final int? id;
  final String? name;
  final String? address;
  final String? email;
  final List<String>? phoneNumber;
  final DateTime? estibleshDate;
  final int? numberOfPublication;
  final List<Review>? reviewList;
  final String? slug;

  Publication({
    this.address,
    this.email,
    this.estibleshDate,
    this.id,
    this.name,
    this.numberOfPublication,
    this.phoneNumber,
    this.reviewList,
    this.slug,
  });
}
