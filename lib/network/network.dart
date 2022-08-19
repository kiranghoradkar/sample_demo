import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/utils/utils.dart';
import 'package:sample_demo/widget/constants.dart';

/// This is the class for API calling
class Network {

  // Method fetch user data
  Future<List<UserDetails?>> fetchUser() async {
    if (await Utils.checkInternetConnection()) {
      final response =
          await http.get(Uri.parse('https://api.github.com/users'), headers: {
        'Authorization': StringConstant.apiTaken,
      });
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<UserDetails> posts = List<UserDetails>.from(
            l.map((model) => UserDetails.fromJson(model)));
        return posts;
      } else {
        throw Exception(StringConstant.somethingWentWrong);
      }
    } else {
      throw Exception(StringConstant.noInternetConnection);
    }
  }

  // Method to fetch Single user
  Future<SingleUserModel> fetchSingleUser(String url) async {
    if (await Utils.checkInternetConnection()) {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': StringConstant.apiTaken,
      });
      if (response.statusCode == 200) {
        var user = SingleUserModel.fromJson(jsonDecode(response.body));
        return user;
      } else {
        throw Exception(StringConstant.somethingWentWrong);
      }
    } else {
      throw Exception(StringConstant.noInternetConnection);
    }
  }
}
