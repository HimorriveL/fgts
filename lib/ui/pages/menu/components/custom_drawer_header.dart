import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Menu',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: context.theme.primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
