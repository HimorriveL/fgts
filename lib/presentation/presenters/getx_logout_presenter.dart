import 'package:get/get.dart';

import '../../domain/usecases/all.dart';
import '../../ui/pages/all.dart';
import '../mixins/all.dart';

class GetxLogoutPresenter extends GetxController
    with LoadingManager, NavigationManager
    implements LogoutPresenter {
  final IDeleteAccount deleteSecureAccount;

  GetxLogoutPresenter({
    required this.deleteSecureAccount,
  });

  @override
  Future<void> execute() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 100));
    await deleteSecureAccount.execute();
    navigateTo = '/dashboard';
    isLoading = false;
  }
}
