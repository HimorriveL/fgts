import 'package:get/get.dart';

import '../../domain/helpers/all.dart';
import '../../domain/usecases/all.dart';
import '../../ui/helpers/errors/all.dart';
import '../../ui/pages/all.dart';
import '../mixins/all.dart';

class GetxLoginPresenter extends GetxController
    with LoadingManager, NavigationManager, UIMainErrorManager, FormManager
    implements LoginPresenter {
  final IAuthentication authentication;
  final ISaveAccount saveCurrentAccount;

  GetxLoginPresenter({
    required this.authentication,
    required this.saveCurrentAccount,
  });

  String? _username = "";
  String? _password = "";

  @override
  void validateUsername(String username) {
    _username = username;
  }

  @override
  void validatePassword(String password) {
    _password = password;
  }

  @override
  Future<void> auth() async {
    try {
      mainError = null;
      isLoading = true;
      final account = await authentication.auth(AuthenticationParams(
          document: _username ?? "", password: _password ?? ""));
      await saveCurrentAccount.execute(account);
      navigateTo = '/dashboard';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
      isLoading = false;
    }
  }
}
