class BookRoutePath {
  final int? id;
  final bool isUnknown;
  final String? slug;
  final int? authorId;

  BookRoutePath.homePage()
      : id = null,
        slug = null,
        authorId = null,
        isUnknown = false;

  BookRoutePath.detailPage(this.slug, {int? selctedBookId})
      : id = selctedBookId,
        authorId = null,
        isUnknown = false;

  BookRoutePath.unknown()
      : id = null,
        slug = null,
        authorId = null,
        isUnknown = true;

  BookRoutePath.authorPage(this.authorId, this.slug)
      : id = null,
        isUnknown = false;

  bool get isHomePage => slug == null && isUnknown == false;
  bool get isDetailPage => slug != null;
  bool get isAuthorPage => authorId != null;
  bool get isUnknowPage => isUnknown;
}
