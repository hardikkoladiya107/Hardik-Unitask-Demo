import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitask_practicle_hardik/main.dart';
import 'package:unitask_practicle_hardik/ui/home/provider/home_provider.dart';
import 'package:unitask_practicle_hardik/ui/widgets/user_card.dart';

import '../../other/app_string.dart';
import '../user_detail/user_detail_screen.dart';
import '../widgets/app_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        if (navigatorKey.currentContext != null) {
          navigatorKey.currentContext!.read<HomeProvider>().init();
        }
      },
    );
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            surfaceTintColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextField(
                          hintText: searchNameOrSsn,
                          controller: searchController,
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              searchController.clear();
                              provider.onChange("");
                            },
                            child: const Icon(Icons.close),
                          ),
                          onChanged: (value) {
                            provider.onChange(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                      ),
                      itemCount: provider.searchUserList.length,
                      itemBuilder: (context, index) {
                        var user = provider.searchUserList[index];
                        return UserCard(
                          user: user,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UserDetailScreen(
                                  user: user,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              if (provider.isLoading)
                const Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
