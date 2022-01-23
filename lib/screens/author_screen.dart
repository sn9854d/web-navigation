import 'package:book_app_nav_2/model/author.dart';
import 'package:book_app_nav_2/screens/book_details_screen.dart';
import 'package:flutter/material.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({Key? key, this.author}) : super(key: key);
  final Author? author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${author?.firstName ?? ''} ${author?.middleName ?? ''}'
                  ' ${author?.lastName ?? ''}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),

                //About the author,
                const SizedBox(height: 50),
                const Text(
                  'About the Author',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                const BuildDesciptionText(),
              ],
            ),
          )),
    );
  }
}
