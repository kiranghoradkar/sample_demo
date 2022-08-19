import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/user_localdata_provider.dart';
import 'package:sample_demo/utils/custom_text.dart';
import 'package:sample_demo/utils/image_utils.dart';
import 'package:sample_demo/widget/dialog.dart';

class OfflineUserList extends StatelessWidget {
  const OfflineUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<UserLocalDataProvider>();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UserLocalDataProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.listOfLocalUsers.isEmpty) {
              return const Center(
                  child: Text('Users not found please add user'));
            }
            return ListView.builder(
              itemCount: value.listOfLocalUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            value.listOfLocalUsers[index].avatarUrl == null
                                ? const ImageUtils(
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.fill,
                                    imageUrl: 'assets/user.png',
                                    imageType: ImageType.image,
                                  )
                                : ImageUtils(
                                    width: 50,
                                    height: 50,
                                    imageUrl: value
                                        .listOfLocalUsers[index].avatarUrl!,
                                    imageType: ImageType.network,
                                  ),
                            const SizedBox(width: 10),
                            CustomText(
                              text: value.listOfLocalUsers[index].name ?? '',
                              textColor: Colors.black,
                              textSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            var isDeleted = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const PopUp();
                              },
                            );

                            if (isDeleted != null) {
                              bloc.deleteUser(
                                  value.listOfLocalUsers[index].id ?? -1);
                            }
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              },
            );
          },
        ));
  }

  Future<void> showMyDialog(context, value, index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete user'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                context
                    .read<UserLocalDataProvider>()
                    .deleteUser(value.listOfLocalUsers[index].id ?? -1);
              },
            )
          ],
        );
      },
    );
  }
}
