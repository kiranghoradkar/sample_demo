import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';

class UserDataProvider {
  Future<List<UserDetails?>> fetchUser() async {
    final response = await http.get(Uri.parse('https://api.github.com/users'),
        headers: {
          'Authorization': 'token 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',
        });
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<UserDetails> posts =
          List<UserDetails>.from(l.map((model) => UserDetails.fromJson(model)));
      return posts;
    } else {
      throw Exception('Failed');
    }
  }

  Future<SingleUserModel> fetchSingleUser(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization': 'token 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',
    });
    if (response.statusCode == 200) {
      var user = SingleUserModel.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw Exception('Failed');
    }
  }
}
