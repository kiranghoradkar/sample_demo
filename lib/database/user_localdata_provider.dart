import 'package:flutter/material.dart';
import 'package:sample_demo/database/database_helper.dart';
import 'package:sample_demo/model/single_user_model.dart';

class UserLocalDataProvider extends ChangeNotifier {
  List<SingleUserModel> listOfLocalUsers = [];

  UserLocalDataProvider() {
    readAllUser();
  }

  void readAllUser() async {
    listOfLocalUsers = await DataBaseHelper.instance.readAllUser();
    notifyListeners();
  }

  void deleteUser(int id) async {
    await DataBaseHelper.instance.delete(id);
    readAllUser();
  }
}