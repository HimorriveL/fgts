import 'package:flutter/material.dart';

import '../../../../ui/pages/all.dart';
import '../../all.dart';
import './all.dart';

Widget makeDashboardPage() =>
    makeIsLoggedDecorator(DashboardPage(makeGetxDashboardPresenter()));
