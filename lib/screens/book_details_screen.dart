import 'package:book_app_nav_2/model/author.dart';
import 'package:book_app_nav_2/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BookdDetailsScreen extends StatelessWidget {
  const BookdDetailsScreen(
      {Key? key, required this.book, required this.handleAuthorTapped})
      : super(key: key);
  final Book book;
  final ValueChanged<Author> handleAuthorTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 1024 ? 50 : 16,
                vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      constraints.maxWidth > 1024
                          ? SizedBox(
                              width: 250, child: Image.asset(book.imageUrl!))
                          : const SizedBox(),
                      constraints.maxWidth > 750
                          ? const SizedBox(width: 20)
                          : const SizedBox(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: buildTitleTextStyle(),
                            ),
                            InkWell(
                              onTap: () => handleAuthorTapped(book.authors!),
                              child: Text(
                                book.author,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            constraints.maxWidth > 1024
                                ? const SizedBox()
                                : Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(book.imageUrl!)),

                            const SizedBox(height: 20),
                            Text('Publication: ${book.publication?.name}'),
                            Text('Original Published: ${book.publishedDate}'),
                            Text('Rating: ${book.rating}'),
                            Text('Rating Count: ${book.ratingCount}'),

                            // description
                            const SizedBox(height: 50),
                            Text('Description', style: buildTitleTextStyle()),
                            const SizedBox(height: 16),
                            const BuildDesciptionText(),

                            //About the author,
                            const SizedBox(height: 50),
                            Text('About the Author',
                                style: buildTitleTextStyle()),
                            const SizedBox(height: 16),
                            const BuildDesciptionText(),

                            // Review
                            const SizedBox(height: 50),
                            Text('Review', style: buildTitleTextStyle()),
                            const SizedBox(height: 16),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Santosh Niroula',
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam'
                                    'nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
                                    'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea '
                                    'rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ips'
                                    'um dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing'
                                    'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna'
                                    ' aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo'
                                    ' dolores et ea rebum. Stet clita kasd gubergren, no sea takimata'
                                    ' sanctus est Lorem ipsum dolor sit amet.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff666666),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              itemCount: 5,
                              separatorBuilder: (context, i) =>
                                  const SizedBox(height: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }

  TextStyle buildTitleTextStyle() {
    return const TextStyle(
      fontSize: 24,
      color: Color(0xff333333),
      fontWeight: FontWeight.w900,
      height: 1.5,
    );
  }
}

class BuildDesciptionText extends StatelessWidget {
  const BuildDesciptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam'
      'nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
      'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea '
      'rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ips'
      'um dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing'
      'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna'
      ' aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo'
      ' dolores et ea rebum. Stet clita kasd gubergren, no sea takimata'
      ' sanctus est Lorem ipsum dolor sit amet.'
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam'
      ' nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
      ' sed diam voluptua. At vero eos et accusam et justo duo dolores et ea'
      ' rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem'
      ' ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur'
      ' sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et'
      ' dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam'
      ' et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea'
      ' takimata sanctus est Lorem ipsum dolor sit amet.'
      ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam'
      ' nonumy eirmod tempor invidunt ut labore et'
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam'
      'nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
      'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea '
      'rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ips'
      'um dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing'
      'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna'
      ' aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo'
      ' dolores et ea rebum. Stet clita kasd gubergren, no sea takimata'
      ' sanctus est Lorem ipsum dolor sit amet.\n'
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam'
      ' nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
      ' sed diam voluptua. At vero eos et accusam et justo duo dolores et ea'
      ' rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem'
      ' ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur'
      ' sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et'
      ' dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam'
      ' et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea'
      ' takimata sanctus est Lorem ipsum dolor sit amet.'
      ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam'
      ' nonumy eirmod tempor invidunt ut labore et',
      textAlign: TextAlign.justify,
      style: TextStyle(color: Color(0xff666666), fontWeight: FontWeight.w600),
    );
  }
}
