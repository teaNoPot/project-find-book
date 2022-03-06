class GoogleBookModel {
  String? id, title, subtitle, description, thumbnail, bookUrl;

  GoogleBookModel({this.id, this.title, this.subtitle, this.description, this.thumbnail, this.bookUrl});

  factory GoogleBookModel.fromApi(Map<String, dynamic> data) {

    String getThumbnailSafety(Map<String, dynamic> data) {
      final imageLinks = data['volumeInfo']['imageLinks'];
      if (imageLinks != null && imageLinks['thumbnail'] != null) {
        return imageLinks['thumbnail'];
      } else {
        return "https://yt3.ggpht.com/ytc/AKedOLR0Q2jl80Ke4FS0WrTjciAu_w6WETLlI0HmzPa4jg=s176-c-k-c0x00ffffff-no-rj";
      }
    }

    return GoogleBookModel(
        id: data['id'],
        title: data['volumeInfo']['title'],
        description: data['volumeInfo']['description'],
        subtitle: data['volumeInfo']['subtitle'],
        thumbnail: getThumbnailSafety(data).replaceAll("http", "https"),
        bookUrl: data['volumeInfo']['previewLink']);
  }
}

