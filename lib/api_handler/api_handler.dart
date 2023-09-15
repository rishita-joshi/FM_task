import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/image_model.dart';
import '../model/profile_model.dart';

class APIHandler {
  static const String API_BASE = "https://dog.ceo/api/breeds/image/random";

  static const String PROFILE_BASE = "https://randomuser.me/api/";

  static Future<ImageModel> getImage() async {
    final response = await http.get(
      Uri.parse(API_BASE),
    );
    print(response);
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body);
      print(response.body);
      ImageModel list = ImageModel.fromJson(parsed);
      return list;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  static Future<ProfileModel> getProfile() async {
    final response = await http.get(
      Uri.parse(PROFILE_BASE),
    );
    print(response);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      ProfileModel list = ProfileModel.fromJson(json);
      return list;
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
