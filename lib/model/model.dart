import 'package:http/http.dart' as http;
import 'dart:convert';

class Repository{
  var url = "https://fakestoreapi.com/products";

  loadFromApi() async{
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
}