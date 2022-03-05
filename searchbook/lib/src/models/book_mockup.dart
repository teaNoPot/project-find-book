class Book{
  Book({
    this.name = '',
    this.isbn = '',
    this.author = '',
    this.imagePath = '',
  });

  String name;
  String isbn;
  String author;
  String imagePath;

  // For now a mockup
  static List<Book> bookList = <Book> [
    Book(
      name: 'NAME 1',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover1.jpg',
    ),
    Book(
      name: 'NAME 2',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover2.jpg',
    ),
    Book(
      name: 'NAME 3',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover3.jpg',
    ),
    Book(
      name: 'NAME 4',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover5.jpg',
    ),
  ];

  static List<Book> popularBookList = <Book> [
    Book(
      name: 'NAME 5',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover6.jpg',
    ),
    Book(
      name: 'NAME 6',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover7.jpg',
    ),
    Book(
      name: 'NAME 7',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover8.jpg',
    ),
    Book(
      name: 'NAME 8',
      isbn: '',
      author: 'Author',
      imagePath: 'assets/book_covers/cover9.png',
    ),
  ];
}