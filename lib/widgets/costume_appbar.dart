import 'package:flutter/material.dart';

class CostumeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const CostumeAppbar(
      {super.key,
      required this.title,
      required this.suffix,
      required this.prefix});
  final String title;
  final Icon suffix, prefix;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      //يجعل ارتفاع AppBar مساوي للقيمة اللي اخترتيها
      toolbarHeight: preferredSize.height,
      //منع ظهور ظل
      scrolledUnderElevation: 0.0,
      //خفي زر الرجوع أو أي عنصر في اليسار
      leading: SizedBox.shrink(),
      //بحيث مسيبسش مسافه فاضيه 
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        prefix,
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
           suffix
        ],
      ),
    );
  }
}
