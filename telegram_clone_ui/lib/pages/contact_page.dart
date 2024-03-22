import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_ui/dummy_datas/contact_json.dart';
import 'package:telegram_clone_ui/utlis/constants/constant_colors.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: buildAppBar()),
      body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ConstantColors.greyColor,
      title: const Text(
        "Contacts",
        style: TextStyle(
          fontSize: 22,
          color: ConstantColors.white,
        ),
      ),
      centerTitle: true,
      leading: const TextButton(
          onPressed: null,
          child: Text(
            "Sort",
            style: TextStyle(
              fontSize: 16,
              color: ConstantColors.primary,
              fontWeight: FontWeight.w500,
            ),
          )),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            LineIcons.plus,
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
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: ConstantColors.white.withOpacity(0.3),
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          buildSectionIcons(),
          buildContactLists(),
        ],
      ),
    );
  }

  Widget buildSectionIcons() {
    List icons = [
      {
        "icon": LineIcons.mapMarker,
        "label": "Find People Nearby",
      },
      {
        "icon": LineIcons.userPlus,
        "label": "Invite Friends",
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: List.generate(
          icons.length,
          (index) {
            return Column(
              children: [
                Row(
                  children: [
                    Icon(
                      icons[index]['icon'],
                      color: ConstantColors.primary,
                      size: 28,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      icons[index]['label'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: ConstantColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 1,
                    color: ConstantColors.white.withOpacity(.15),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildContactLists() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: List.generate(
          contact_data.length,
          (index) {
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(contact_data[index]['img']),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact_data[index]['name'],
                          style: const TextStyle(
                            fontSize: 17,
                            color: ConstantColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          contact_data[index]['is_online']
                              ? "online"
                              : contact_data[index]['seen'],
                          style: TextStyle(
                            fontSize: 13,
                            color: contact_data[index]['is_online']
                                ? ConstantColors.primary
                                : ConstantColors.white.withOpacity(.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 1,
                    color: ConstantColors.white.withOpacity(.15),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
