// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/all.dart';

void postStatusMessage(BuildContext context, DocumentEntity status) {
  String moneyFormat(double value) {
    final NumberFormat currency = NumberFormat('#,##0.00', 'pt_BR');
    try {
      return currency.format(value);
    } catch (e) {
      return currency.format(0);
    }
  }

  Widget addRow(PaymentEntity? payment) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            payment == null
                ? "VENCIMENTO"
                : DateFormat('dd/MM/yyyy').format(payment.dueDate),
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            payment == null
                ? "SALDO DEVEDOR"
                : moneyFormat(payment.principalAmountInCents),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            payment == null ? "AMORTIZAÇÃO" : moneyFormat(payment.amortization),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            payment == null ? "JUROS" : moneyFormat(payment.interest),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            payment == null ? "PAGAMENTO" : moneyFormat(payment.payment),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  List<Widget> widgetList = [];

  widgetList.add(Column(
    children: [
      addRow(null),
      const SizedBox(height: 20),
    ],
  ));

  for (var payment in status.data!.listPayment) {
    widgetList.add(Column(
      children: [
        addRow(payment),
        const SizedBox(height: 20),
      ],
    ));
  }
  widgetList.add(
    IconButton(
        icon: const Icon(
          Icons.close_outlined,
          size: 24,
          color: Colors.red,
        ),
        onPressed: () => {hidePostStatusDialog(context)}),
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => SimpleDialog(
      children: [
        Container(
          width: 1000,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[const SizedBox(height: 10), ...widgetList],
          ),
        ),
      ],
    ),
  );
}

void hidePostStatusDialog(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}
