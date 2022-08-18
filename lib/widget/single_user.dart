import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/database_helper.dart';
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/network/user_data_provider.dart';

class SingleUser extends StatelessWidget {
  // final String url;

  const SingleUser({Key? key}) : super(key: key);
  // DataBaseHelper? dbHelper = DataBaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<SingleUserModel?>(
      builder: (BuildContext context, value, Widget? child) {
        if (value == null) {
          return const Text("loading");
        }
        return InkWell(
          child: Row(
            children: [
              value.avatarUrl == null
                  ? Image.asset(
                      'assets/user.png',
                      width: 50,
                      height: 50,
                    )
                  : Image.network(
                      value.avatarUrl!,
                      width: 50,
                      height: 50,
                    ),
              const SizedBox(
                width: 10,
              ),
              Text(value.name ?? ''),
              Text(value.email ?? ''),
            ],
          ),
          onLongPress: () async {
            var tempDetails = UserDetails(
                avatarUrl: value.avatarUrl == null
                    ? 'assets/user.png'
                    : value.avatarUrl!,
              name: value.name
            );
            await DataBaseHelper.instance.create(tempDetails);
          },
        );
      },
    );
  }
}
