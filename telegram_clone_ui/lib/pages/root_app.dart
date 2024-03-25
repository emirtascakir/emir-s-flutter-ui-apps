import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:telegram_clone_ui/pages/chats_page.dart';
import 'package:telegram_clone_ui/pages/contact_page.dart';
import 'package:telegram_clone_ui/pages/setting_page.dart';
import 'package:telegram_clone_ui/utlis/constants/constant_colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      body: buildBody(),
      bottomNavigationBar: buildFooter(),
    );
  }

  Widget buildFooter() {
    List iconItems = [
      Icons.account_circle,
      Ionicons.chatbubble,
      Icons.settings,
    ];

    List textItems = [
      "Contacts",
      "Chats",
      "Settings",
    ];

    return Container(
      height: 75,
      width: double.infinity,
      decoration: const BoxDecoration(color: ConstantColors.greyColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            iconItems.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    index == 1
                        ? Badge(
                            label: const Text("2"),
                            child: Icon(
                              iconItems[index],
                              size: 30,
                              color: pageIndex == index
                                  ? ConstantColors.primary
                                  : ConstantColors.white.withOpacity(0.5),
                            ),
                          )
                        : Icon(
                            iconItems[index],
                            size: 30,
                            color: pageIndex == index
                                ? ConstantColors.primary
                                : ConstantColors.white.withOpacity(0.5),
                          ),
                    const SizedBox(height: 3),
                    Text(
                      textItems[index],
                      style: TextStyle(
                        fontSize: 11,
                        color: pageIndex == index
                            ? ConstantColors.primary
                            : ConstantColors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ContactPage(),
        ChatsPage(),
        SettingPage(),
      ],
    );
  }
}
