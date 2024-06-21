import 'package:dairyapp/Utility/theme.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTheme.TitleTextStyle,
      ),
      backgroundColor: AppTheme.appBarColor,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications,
          color: Colors.white,),
          onPressed: () {
            // Handle notification button press
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart,color: Colors.white),
          onPressed: () {
            // Handle cart button press
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
