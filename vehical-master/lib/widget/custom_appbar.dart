import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apptext.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackTap;
  final VoidCallback? onSearchTap;
  final bool isSearch;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.onBackTap,
    required this.isSearch,
    this.onSearchTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: InkWell(
          onTap: onBackTap,
          child: const Icon(Icons.arrow_back,color: Colors.white),
        ),
      ),
      title: AppText(text: title, size: 20,color: Colors.white),
      actions: isSearch
          ? [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchTap,
          ),
        ),
      ]
          : [],
    );
  }
}