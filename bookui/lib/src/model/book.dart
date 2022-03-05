class Book {
  String? imgUrl;
  String? name;
  String? author;
  num? score;
  num? review;
  num? view;
  List<String>? type;
  String? desc;
  Book(
    this.imgUrl,
    this.name,
    this.author,
    this.score,
    this.review,
    this.view,
    this.type,
    this.desc,
  );

  static List<Book> generateRecommendedBook() {
    return [
      Book(
          'assets/images/book1.jpg',
          'A Million to One',
          'Tony Faggioli',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Description'),
      Book(
          'assets/images/book2.jpg',
          'The Girl Who Never',
          'HC Michaels',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
      Book(
          'assets/images/book3.jpg',
          'Dune',
          'Frank Herbert',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
      Book(
          'assets/images/book4.jpg',
          'The Imperfections of Memory',
          'Angelina Aludo',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
      Book(
          'assets/images/book5.jpg',
          'The Time Traveller',
          'J.D Kreisch',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
    ];
  }

  static List<Book> generateTrendingBook() {
    return [
      Book(
          'assets/images/book6.jpg',
          'Lord of Winter',
          'Author',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
      Book(
          'assets/images/book7.jpg',
          'The Chaos Temple',
          'Albert Davis',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
      Book(
          'assets/images/book8.jpg',
          'Rise',
          'Cain S. Latrani',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
      Book(
          'assets/images/book9.jpg',
          'To Kill a Witch',
          'Christopher Patterson',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
      Book(
          'assets/images/book10.jpg',
          'Lost in the Dungeon',
          'Gregory Garrison',
          4.9,
          107.3,
          2.7,
          ['Action', 'Fantasy', 'Supernatural'],
          'Harry Potter and the Deathly Hallows is the seventh and final book in the Harry Potter series by J. K. Rowling. It was released on 21 July, 2007 at 00:01 am local time in English-speaking countries.'),
    ];
  }
}
