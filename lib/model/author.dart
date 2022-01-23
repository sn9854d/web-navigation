import 'package:book_app_nav_2/model/book.dart';

class Author {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final DateTime? dateOfBirth;
  final List<Book>? books;
  final String? address;
  final String? email;
  final String? phoneNumber;

  Author({
    this.books,
    this.dateOfBirth,
    this.firstName,
    this.id,
    this.lastName,
    this.middleName,
    this.address,
    this.email,
    this.phoneNumber,
  });
}
