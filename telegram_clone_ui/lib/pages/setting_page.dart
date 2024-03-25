import 'package:flutter/material.dart';
import 'package:telegram_clone_ui/dummy_datas/chat.json.dart';
import 'package:telegram_clone_ui/dummy_datas/setting_json.dart';
import 'package:telegram_clone_ui/utlis/constants/constant_colors.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
      backgroundColor: ConstantColors.bgColor,
      leading: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.qr_code,
          color: ConstantColors.primary,
          size: 28,
        ),
      ),
      actions: const [
        TextButton(
          onPressed: null,
          child: Text(
            "Edit",
            style: TextStyle(
              fontSize: 16,
              color: ConstantColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(profile[0]['img']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            profile[0]['name'],
            style: const TextStyle(
                fontSize: 24,
                color: ConstantColors.white,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            "+855 10 100 100 - @sopheamen",
            style: TextStyle(
              fontSize: 18,
              color: ConstantColors.white.withOpacity(.5),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          buildSettingsSection(setting_section_one),
          const SizedBox(height: 30),
          buildSettingsSection(setting_section_two),
          const SizedBox(height: 30),
          buildSettingsSection(setting_section_three),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildSettingsSection(List settingsList) {
    return Column(
      children: List.generate(settingsList.length, (index) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: ConstantColors.textfieldColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: settingsList[index]['color'],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(
                              settingsList[index]['icon'],
                              color: ConstantColors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          settingsList[index]['text'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: ConstantColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    settingsList[index]['text'] == "Language"
                        ? Row(
                            children: [
                              Text(
                                "English",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ConstantColors.white.withOpacity(.5),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ConstantColors.white.withOpacity(.2),
                                size: 15,
                              ),
                            ],
                          )
                        : Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ConstantColors.white.withOpacity(.2),
                            size: 15,
                          ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
