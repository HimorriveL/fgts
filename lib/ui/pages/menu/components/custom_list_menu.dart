import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../all.dart';
import 'custom_list_item.dart';

class CustomListMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? goTo;

  final List<CustomListItem>? listSubMenuItem;
  final Stream<bool>? isShowStream;
  final Function? show;

  const CustomListMenu({
    super.key,
    required this.icon,
    required this.title,
    this.goTo,
    this.listSubMenuItem,
    this.isShowStream,
    this.show,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<MenuPresenter>(context);

    Widget menuItem(bool isShow) {
      return Row(
        children: [
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
          const Spacer(),
          Expanded(
            flex: 1,
            child: listSubMenuItem != null
                ? Icon(
                    isShow == false ? Icons.expand_more : Icons.expand_less,
                    color: context.theme.primaryColorLight,
                    size: 24,
                  )
                : const Center(),
          ),
        ],
      );
    }

    if (isShowStream != null) {
      return StreamBuilder<bool>(
          initialData: false,
          stream: isShowStream,
          builder: (context, snapshot) {
            List<Widget> list = [menuItem(snapshot.data as bool)];

            if (listSubMenuItem != null) {
              list.addAll(listSubMenuItem as Iterable<Widget>);
            }

            return InkWell(
              onTap: () {
                if (show != null) {
                  show!();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                width: 300,
                height: (listSubMenuItem == null ||
                        listSubMenuItem!.isEmpty ||
                        snapshot.data! == false)
                    ? 40
                    : 40 *
                            double.parse(listSubMenuItem == null
                                ? "1"
                                : listSubMenuItem!.length <= 2
                                    ? (listSubMenuItem!.length + 1).toString()
                                    : (listSubMenuItem!.length).toString()) +
                        8 * listSubMenuItem!.length,
                child: Column(
                  children: snapshot.data! == false
                      ? [menuItem(snapshot.data as bool)]
                      : list,
                ),
              ),
            );
          });
    }

    return InkWell(
      onTap: () {
        if (goTo != null) {
          presenter.goto(goTo!);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 300,
        height: 40,
        child: Column(
          children: [menuItem(false)],
        ),
      ),
    );
  }
}
