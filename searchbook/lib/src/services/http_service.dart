import 'package:http/http.dart' as http;
import 'package:searchbook/src/models/google_volume.dart';
import 'dart:convert';

class HttpService {

  Future<VolumeJson> findBook(String query) async {
    final jsonResponse =  await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=${query}'));

    var jsonBody = json.decode(jsonResponse.body);

    print('https://www.googleapis.com/books/v1/volumes?q=${query}');

    VolumeJson volumelist = VolumeJson.fromJson(jsonBody);

    print(volumelist.totalItems);
    volumelist.items.forEach((element) =>
      print(element.volumeinfo.title)
    );

    return volumelist;
  }
}