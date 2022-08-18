import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/user_localdata_provider.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/network/service.dart';
import 'package:sample_demo/widget/offline_user.dart';
import 'package:sample_demo/widget/online_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Service service = Provider.of<Service>(context);
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.supervisor_account_rounded),
                  text: 'Online',
                ),
                Tab(
                  icon: Icon(Icons.no_accounts_rounded),
                  text: 'OffLine',
                ),
              ],
            ),
          ),
          body: FutureProvider<List<UserDetails?>>(
            initialData: const [],
            create: (BuildContext context) {
              return service.fetchUser();
            },
            child: TabBarView(
              children: [
                const OnlineUserList(),
                ChangeNotifierProvider<UserLocalDataProvider>(
                  create: (context) {
                    return UserLocalDataProvider();
                  },
                  child: const OfflineUserList(),
                )
              ],
            ),
          ),
        ));
  }
}
