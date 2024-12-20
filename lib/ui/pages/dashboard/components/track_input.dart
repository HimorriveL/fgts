// ignore_for_file: must_be_immutable

import '../../../../domain/helpers/all.dart';
import '../../../helpers/all.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../all.dart';

class TrackInput extends StatelessWidget {
  const TrackInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);

    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextField(
        onChanged: presenter.validateTrackNumbers,
        inputFormatters: [
          UpperCaseTextFormatter(),
        ],
        maxLines: 20,
        decoration: InputDecoration.collapsed(
          hintText: R.string.putDocuments.toUpperCase(),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
