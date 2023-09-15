import 'package:flutter/material.dart';

class CustomListWidget extends StatefulWidget {
  const CustomListWidget(
      {super.key, required this.title, required this.title2});
  final title;
  final title2;
  @override
  State<CustomListWidget> createState() => _CustomListWidgetState();
}

class _CustomListWidgetState extends State<CustomListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(widget.title),
          Text(widget.title2.toString()),
        ],
      ),
    );
  }
}
