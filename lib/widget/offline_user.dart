import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/user_localdata_provider.dart';

class OfflineUserList extends StatelessWidget {
  const OfflineUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UserLocalDataProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.listOfLocalUsers.isEmpty) {
              return const Text('Users not found');
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
                                ? Image.asset(
                                    'assets/user.png',
                                    width: 50,
                                    height: 50,
                                  )
                                : Image.network(
                                    value.listOfLocalUsers[index].avatarUrl!,
                                    width: 50,
                                    height: 50,
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(value.listOfLocalUsers[index].name ?? ''),
                            Text(value.listOfLocalUsers[index].email ?? ''),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<UserLocalDataProvider>().deleteUser(
                                value.listOfLocalUsers[index].id ?? -1);
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
}
