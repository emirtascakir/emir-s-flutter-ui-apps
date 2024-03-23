import 'package:flutter/material.dart';
import 'package:telegram_clone_ui/dummy_datas/chat.json.dart';
import 'package:telegram_clone_ui/utlis/constants/constant_colors.dart';
import 'package:telegram_clone_ui/widgets/chat_bubble.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key, required this.name, required this.img});
  final String name;
  final String img;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: buildAppBar()),
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ConstantColors.greyColor,
      title: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: ConstantColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "last seen recently",
                    style: TextStyle(
                      color: ConstantColors.white.withOpacity(.5),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back,
          color: ConstantColors.primary,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.img),
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
    return ListView(
      padding: const EdgeInsets.only(top: 20, bottom: 80),
      children: List.generate(
        messages.length,
        (index) => CustomBubbleChat(
          isMe: messages[index]['isMe'],
          message: messages[index]['message'],
          time: messages[index]['time'],
          isLast: messages[index]['isLast'],
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(color: ConstantColors.greyColor),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.attachment_rounded,
              color: ConstantColors.primary,
              size: 28,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(
                color: ConstantColors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 12, bottom: 5),
                child: TextField(
                  style: TextStyle(color: ConstantColors.white),
                  cursorColor: ConstantColors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.emoji_symbols_outlined,
                      color: ConstantColors.primary,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.mic,
              color: ConstantColors.primary,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
