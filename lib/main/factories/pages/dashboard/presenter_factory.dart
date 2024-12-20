import '../../../../presentation/presenters/all.dart';
import '../../../../ui/pages/all.dart';
import '../../all.dart';

DashboardPresenter makeGetxDashboardPresenter() => GetxDashboardPresenter(
      findAllProducts: makeFindProducts(),
      findAllDocuments: makeFindDocuments(),
      downloadFile: makeDownloadFile(),
    );
