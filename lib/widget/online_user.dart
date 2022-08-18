import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/network/user_data_provider.dart';
import 'package:sample_demo/widget/single_user.dart';

class OnlineUserList extends StatelessWidget {
  final UserDetails? user;

  const OnlineUserList({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDataProvider userDataProvider = Provider.of<UserDataProvider>(context);

    return Consumer<List<UserDetails?>>(builder: (context, userDetails, child) {
      if (userDetails.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
          itemCount: userDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureProvider<SingleUserModel?>(
                  initialData: SingleUserModel(),
                  create: (BuildContext context) {
                    return userDataProvider
                        .fetchSingleUser(userDetails[index]!.url!);
                  },
                  child:  SingleUser(),
                ));
          });
    });
  }
}
