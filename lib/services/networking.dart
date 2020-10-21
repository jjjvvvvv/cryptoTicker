import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'MDZiMWQ1YWNlNGU2NGNjZDk5NmJjYzdiZmE4Mzc4NjI';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url, headers: {
      'x-ba-key': apiKey,
    });

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
