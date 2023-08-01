import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static List<News> news = [];
  static List<News> newsInApp = [];

//function to get News ///// Return News
  static Future<List<News>> comingNews() async {
    List<News> returnedNews = [];
    var url = 'http://www.mocky.io/v2/5ecfddf13200006600e3d6d0';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //convert to news object
      var jsonNotes = json.decode(response.body);
      // print(jsonNotes);
      for (var note in jsonNotes) {
        returnedNews.add(News.fromJson(note));
      }
    }
    return returnedNews;
  }
}
