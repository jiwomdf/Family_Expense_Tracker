import 'package:flutter/material.dart';
import 'package:group_expense_tracker/util/ext/text_util.dart';

class Toolbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showDrawer;
  const Toolbar({super.key, required this.title, required this.showDrawer});

  @override
  State<Toolbar> createState() => _ToolbarState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _ToolbarState extends State<Toolbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(widget.title,
                style: TextUtil(context).urbanist(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Row(
            children: [
              Visibility(
                visible: widget.showDrawer,
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
