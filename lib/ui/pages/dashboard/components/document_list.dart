import 'package:fgts/main/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/all.dart';
import '../all.dart';
import 'all.dart';

class DocumentList extends StatelessWidget {
  const DocumentList({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);

    String moneyFormat(double value) {
      final NumberFormat currency = NumberFormat('#,##0.00', 'pt_BR');
      try {
        return currency.format(value);
      } catch (e) {
        return currency.format(0);
      }
    }

    String setMaskCPF(String value) {
      return value.replaceFirstMapped(
          RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'),
          (match) =>
              '${match.group(1)}.${match.group(2)}.${match.group(3)}-${match.group(4)}');
    }

    Widget item(DocumentEntity entity) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: "#1D1D1D".hexToColor(),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 2,
                child: Text(
                  textAlign: TextAlign.center,
                  setMaskCPF(entity.document),
                  style: const TextStyle(color: Colors.white),
                )),
            Expanded(
              flex: 1,
              child: Center(
                child: entity.error != null
                    ? const SizedBox()
                    : IconButton(
                        icon: const Icon(Icons.search, size: 24),
                        onPressed: () {
                          presenter.showDocument(entity);
                        }),
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  entity.error != null
                      ? entity.error!.message
                      : moneyFormat(entity.data!.liquidValue),
                  style: const TextStyle(color: Colors.white),
                )),
            Expanded(
                flex: 3,
                child: Text(
                  entity.error != null
                      ? entity.error!.reason
                      : moneyFormat(entity.data!.debtor),
                  style: const TextStyle(color: Colors.white),
                )),
          ]),
        );

    return StreamBuilder<DocumentFullEntity?>(
        stream: presenter.documentFullStream,
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const SizedBox();
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: 650,
                    height: 860,
                    constraints: const BoxConstraints(
                      minWidth: 650,
                      minHeight: 860,
                    ),
                    decoration: BoxDecoration(
                      color: "#1D1D1D".hexToColor(),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 36),
                        ListView.builder(
                          itemCount: snapshot.data!.documentList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return item(snapshot.data!.documentList[index]);
                          },
                        ),
                        const SizedBox(height: 12),
                        const DownloadButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
