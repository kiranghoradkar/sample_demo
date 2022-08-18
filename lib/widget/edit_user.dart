import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/database_helper.dart';
import 'package:sample_demo/model/single_user_model.dart';

class EditUser extends StatefulWidget {
  EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  // Future<List<SingleUserModel>>? list;

  @override
  void initState() {
    // list = DataBaseHelper.instance.readAllUser();
    // print(list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}
