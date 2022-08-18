import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';

class Service {
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
