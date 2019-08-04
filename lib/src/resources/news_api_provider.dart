import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

final _root = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get("$_root/topstories.json");
    return json.decode(response.body);
  }

  fetchItem(int id) async {
    final response = await client.get("$_root/item/$id.json");
    final parsedJSON = json.decode(response.body);
    return ItemModel.fromJSON(parsedJSON);
  }
}