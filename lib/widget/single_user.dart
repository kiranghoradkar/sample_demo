import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/database_helper.dart';
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';

class SingleUser extends StatelessWidget {

  const SingleUser({Key? key}) : super(key: key);

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
