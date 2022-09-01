import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Items extends StatelessWidget {
  String title;
  String subtitle;
  int trailing;
  String leading;
  Items(
      {required this.title,
      required this.subtitle,
      required this.trailing,
      required this.leading});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(leading),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(trailing.toString()),
    );
  }
}
