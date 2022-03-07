class GoogleBookModel {
  String? id, title, subtitle, description, thumbnail, bookUrl;
  String? author;

  GoogleBookModel({this.id, this.title, this.author, this.subtitle, this.description, this.thumbnail, this.bookUrl});

  factory GoogleBookModel.fromApi(Map<String, dynamic> data) {

    String getThumbnailSafety(Map<String, dynamic> data) {
      final imageLinks = data['volumeInfo']['imageLinks'];
      if (imageLinks != null && imageLinks['thumbnail'] != null) {
        return imageLinks['thumbnail'];
      } else {
        return "http://yt3.ggpht.com/ytc/AKedOLR0Q2jl80Ke4FS0WrTjciAu_w6WETLlI0HmzPa4jg=s176-c-k-c0x00ffffff-no-rj";
      }
    }

    String author = "-";
    var list = data['volumeInfo']['authors'];
    if(list != null && list.isNotEmpty) {
      author = list[0];
    }

    return GoogleBookModel(
        id: data['id'],
        title: data['volumeInfo']['title'],
        author: author,
        description: data['volumeInfo']['description'],
        subtitle: data['volumeInfo']['subtitle'],
        thumbnail: getThumbnailSafety(data).replaceAll("http", "https"),
        bookUrl: data['volumeInfo']['previewLink']);
  }
}

