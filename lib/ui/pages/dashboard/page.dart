import 'package:fgts/main/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../mixins/all.dart';
import '../../components/all.dart';
import './all.dart';
import 'components/all.dart';

class DashboardPage extends StatelessWidget
    with LoadingManager, UIErrorManager, UIPostStatusManager, UIShowCSVManager {
  final DashboardPresenter presenter;

  const DashboardPage(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListenableProvider(
          create: (_) => presenter,
          child: Builder(
            builder: (context) {
              handleLoading(context, presenter.isLoadingStream);
              handleMainError(context, presenter.mainErrorStream);
              handlePostStatus(context, presenter.documentStatusStream);
              handleShowCSV(context, presenter.showCSVStream);
              presenter.load();
              return background(
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                width: 325,
                                height: 860,
                                constraints: const BoxConstraints(
                                  minWidth: 325,
                                  minHeight: 860,
                                ),
                                decoration: BoxDecoration(
                                  color: "#1D1D1D".hexToColor(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 36),
                                    CustomDropMenuListLogin(),
                                    CustomDropMenuListTable(),
                                    TrackInput(),
                                    DelayInput(),
                                    TimeoutInput(),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      child: ExecuteButton(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const DocumentList(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
