import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../presenter.dart';

class CustomListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String goTo;

  const CustomListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.goTo,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<MenuPresenter>(context);

    return InkWell(
      onTap: () => presenter.goto(goTo),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 300,
        height: 40,
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 40)),
            Expanded(
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      icon,
                      color: context.theme.primaryColorLight,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: context.theme.primaryColorLight,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
