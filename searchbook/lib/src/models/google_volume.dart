class VolumeJson {
  final int totalItems;
  final String kind;
  final List<Item> items;

  VolumeJson({required this.items, required this.kind,required this.totalItems});

  factory VolumeJson.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;

    print(list.length);
    List<Item> itemList = [];

    if(list != null && list != []) {
      itemList = list.map((i) => Item.fromJson(i)).toList();
    }

    print(itemList.length);

    return VolumeJson(
        items: itemList,
        kind: parsedJson['kind'],
        totalItems: parsedJson['totalItems']);
  }
}

class Item {
  final String kind;

  final String etag;

  final VolumeInfo volumeinfo;

  Item({required this.kind, required this.etag, required this.volumeinfo});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        kind: parsedJson['kind'],
        etag: parsedJson['etag'],
        volumeinfo: VolumeInfo.fromJson(parsedJson['volumeInfo']));
  }
}

class VolumeInfo {
  final String title;
  final String publisher;
  final String printType;
  final ImageLinks image;

  VolumeInfo(
      {required this.printType, required this.title, required this.publisher, required this.image });

  factory VolumeInfo.fromJson(Map<String, dynamic> parsedJson) {

    print('GETTING DATA');
    //print(isbnList[1]);
    return VolumeInfo(
      printType: parsedJson['printType'],
      title: parsedJson['title'],
      publisher: parsedJson['publisher'],
      image: ImageLinks.fromJson(
        parsedJson['imageLinks'],
      ),
    );
  }
}

class ImageLinks {
  final String thumb;

  ImageLinks({required this.thumb});

  factory ImageLinks.fromJson(Map<String, dynamic> parsedJson) {
    return ImageLinks(thumb: parsedJson['thumbnail']);
  }
}

class ISBN {
  final String iSBN13;
  final String type;

  ISBN({required this.iSBN13, required this.type});

  factory ISBN.fromJson(Map<String, dynamic> parsedJson) {
    return ISBN(
      iSBN13: parsedJson['identifier'],
      type: parsedJson['type'],
    );
  }
}

/*
Column(
  mainAxisSize: MainAxisSize.min,
  // crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  Flexible(
  fit: FlexFit.loose,
  child: Container(
  margin: EdgeInsets.all(2.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
  Container(
  margin: EdgeInsets.only(
  bottom: 3.0,
  top: 30.0,
  ),
  child: Text(
  'ISBN',
  textAlign: TextAlign.left,
  style: TextStyle(fontWeight: FontWeight.bold),
  )),
  Container(
  width: 150.0,
  margin: EdgeInsets.only(bottom: 10.0, top: 3.0),
  child: Text(
  'ISBN HERE',
  softWrap: true,
  overflow: TextOverflow.ellipsis,
  maxLines: 3,
  )),
  Container(
  margin: EdgeInsets.only(bottom: 3.0, top: 10.0),
  child: Text('Author',
  style: TextStyle(fontWeight: FontWeight.bold)),
  ),
  Container(
  margin: EdgeInsets.only(bottom: 10.0, top: 3.0),
  child: Text(
  book.record.coverAuthors,
  ),
  ),
  Container(
  margin: EdgeInsets.only(bottom: 3.0, top: 10.0),
  child: Text('Format',
  style: TextStyle(fontWeight: FontWeight.bold)),
  ),
  Container(
  margin: EdgeInsets.only(bottom: 10.0, top: 3.0),
  child: Text(
  volumelist.items[index].volumeinfo.printType,
  ),
  ),
  Container(
  margin: EdgeInsets.all(10.0),
  child: Column(
  children: <Widget>[
  FlatButton(
  onPressed: () {},
  child: Text(
  'VIEW MORE DETAILS',
  style: TextStyle(color: Colors.deepPurple),
  ),
  ),
  ],
  ),
  )
  ],
  )),
)
*/