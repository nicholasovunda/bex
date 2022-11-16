import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_style.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: bexColor,
      automaticallyImplyLeading: false,
      title: const Text(
        'Bex Stores',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: const [
        Icon(
          Icons.notifications_none,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(20.0);
}
