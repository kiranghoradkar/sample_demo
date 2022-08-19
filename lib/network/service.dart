import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/utils/utils.dart';

/// This is the class for API calling
class Service {

  // Method fetch user data
  Future<List<UserDetails?>> fetchUser() async {
    if (await Utils.checkInternetConnection()) {
      final response =
          await http.get(Uri.parse('https://api.github.com/users'), headers: {
        'Authorization': 'token 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',
      });
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<UserDetails> posts = List<UserDetails>.from(
            l.map((model) => UserDetails.fromJson(model)));
        return posts;
      } else {
        throw Exception('Failed');
      }
    } else {
      debugPrint('No internet connection');
      throw Exception('No internet connection');
    }
  }

  // Method to fetch Single user
  Future<SingleUserModel> fetchSingleUser(String url) async {
    if (await Utils.checkInternetConnection()) {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'token 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',
      });
      if (response.statusCode == 200) {
        var user = SingleUserModel.fromJson(jsonDecode(response.body));
        return user;
      } else {
        throw Exception('Failed');
      }
    } else {
      throw Exception('No internet connection');
    }
  }
}
