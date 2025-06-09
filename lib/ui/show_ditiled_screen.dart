import 'package:flutter/material.dart';
import 'package:quotes_app/app_text_style/app_text_style.dart';
import 'package:quotes_app/hive_servers/theme_preference.dart';

class ShowDitiledScreen extends StatefulWidget {
  final int id;
  final int pageID;
  final String title;
  final String text;
  const ShowDitiledScreen({
    super.key,
    required this.id,
    required this.pageID,
    required this.title,
    required this.text,
  });

  @override
  State<ShowDitiledScreen> createState() => _ShowDitiledScreenState();
}

class _ShowDitiledScreenState extends State<ShowDitiledScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title.toString()), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                surfaceTintColor:
                    (ThemePreference().isDark) ? Colors.white : Colors.black,
                child: Row(
                  children: [
                    Text(
                      "Page ID: ${widget.pageID.toString()}",
                      style: AppTextStyle.titleStyle,
                    ),
                  ],
                ),
              ),
              Card(
                surfaceTintColor:
                    (ThemePreference().isDark) ? Colors.white : Colors.black,
                child: SelectableText(
                  widget.text,
                  style: AppTextStyle.contentStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
