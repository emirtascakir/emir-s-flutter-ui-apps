import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_ui/dummy_datas/chat.json.dart';
import 'package:telegram_clone_ui/utlis/constants/constant_colors.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: buildAppBar(),
      ),
      body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ConstantColors.greyColor,
      title: const Text(
        "Chats",
        style: TextStyle(
          fontSize: 22,
          color: ConstantColors.white,
        ),
      ),
      centerTitle: true,
      leading: const TextButton(
        onPressed: null,
        child: Text(
          "Edit",
          style: TextStyle(
            fontSize: 16,
            color: ConstantColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            LineIcons.edit,
            color: ConstantColors.primary,
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68,
            decoration: const BoxDecoration(
              color: ConstantColors.greyColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: ConstantColors.bgColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(color: ConstantColors.white),
                  cursorColor: ConstantColors.primary,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      LineIcons.search,
                      color: ConstantColors.white.withOpacity(0.3),
                    ),
                    hintText: "Search for messages or users",
                    hintStyle: TextStyle(
                        color: ConstantColors.white.withOpacity(0.3),
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildChatList(),
        ],
      ),
    );
  }

  Widget buildChatList() {
    return Column(
      children: List.generate(
        chat_data.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 4, left: 12, right: 12),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(chat_data[index]['img']),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 40) *
                                        .6,
                                child: Text(
                                  chat_data[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: ConstantColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                chat_data[index]['date'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ConstantColors.white.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 40) * 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  chat_data[index]['text'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                    color: ConstantColors.white.withOpacity(.3),
                                  ),
                                ),
                                chat_data[index]['badge'] > 0
                                    ? Badge(
                                        label: Text(chat_data[index]['badge']
                                            .toString()),
                                        backgroundColor: ConstantColors.primary,
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          Divider(
                            color: ConstantColors.white.withOpacity(.3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
