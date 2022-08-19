import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/network/network.dart';
import 'package:sample_demo/widget/custom_shimmer.dart';
import 'package:sample_demo/widget/single_user.dart';

class OnlineUserList extends StatelessWidget {
  final UserDetails? user;

  const OnlineUserList({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Network userDataProvider = Provider.of<Network>(context);

    return Consumer<List<UserDetails?>>(builder: (context, userDetails, child) {
      if (userDetails.isEmpty) {
        return ListView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: 14,
            itemBuilder: (context, index) => const CustomShimmer());
      }

      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: userDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return FutureProvider<SingleUserModel?>(
              initialData: null,
              create: (BuildContext context) {
                return userDataProvider
                    .fetchSingleUser(userDetails[index]!.url!);
              },
              child: const SingleUser(),
            );
          });
    });
  }
}
