import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_and_craft/model/model.dart';
import 'package:web_and_craft/utils/constants.dart';

class ApiService {
  Future<List<Model>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Model.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
