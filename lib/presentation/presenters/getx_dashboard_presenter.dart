import 'package:get/get.dart';

import '../../domain/entities/all.dart';
import '../../domain/helpers/all.dart';
import '../../domain/usecases/all.dart';
import '../../ui/helpers/errors/all.dart';
import '../../ui/pages/all.dart';
import '../mixins/all.dart';

class GetxDashboardPresenter extends GetxController
    with
        LoadingManager,
        NavigationManager,
        UIMainErrorManager,
        FormManager,
        LoginListManager,
        TableListManager,
        DocumentFullManager,
        DocumentStatusManager,
        LoginManager,
        ShowPdfManager,
        TableManager
    implements DashboardPresenter {
  final IFindAllProducts findAllProducts;
  final IFindAllDocuments findAllDocuments;
  final IDownloadFile downloadFile;

  GetxDashboardPresenter({
    required this.findAllProducts,
    required this.findAllDocuments,
    required this.downloadFile,
  });

  String? _document;
  String? _delay;
  String? _timeout;

  @override
  Future<void> execute() async {
    try {
      mainError = null;
      isLoading = true;
      documentFull = await findAllDocuments.execute(DocumentParams(
        cpfList: _document!.split("\n"),
        timeout: int.parse(_timeout!),
        delay: int.parse(_delay!),
        rateLimitPoints: 10,
        rateLimitDuration: 60,
        productId: table!.value!,
      ));
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
    } finally {
      isLoading = false;
    }
  }

  @override
  void setLogin(ComboboxEntity val) {
    // TODO: implement setLogin
  }
  @override
  void showDocument(DocumentEntity? val) {
    documentStatus = null;
    documentStatus = val;
  }

  @override
  void setTable(ComboboxEntity val) {
    table = val;
  }

  @override
  Future<void> load() async {
    try {
      mainError = null;
      isLoading = true;
      tableList = await findAllProducts.execute();
      if (tableList.isNotEmpty) {
        table = tableList[0];
      }
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
    } finally {
      isLoading = false;
    }
  }

  @override
  void validateTrackNumbers(String value) {
    _document = value;
  }

  @override
  void validateDelay(String value) {
    _delay = value;
  }

  @override
  void validateTimeout(String value) {
    _timeout = value;
  }

  @override
  Future<void> doDownloadFile() async {
    showCSV = await downloadFile.execute(documentFull!.csvFile);
  }
}
