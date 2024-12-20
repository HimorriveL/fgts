import '../../../../presentation/presenters/all.dart';
import '../../../../ui/pages/all.dart';
import '../../usecases/all.dart';

LogoutPresenter makeGetxLogoutPresenter() => GetxLogoutPresenter(
      deleteSecureAccount: makeDeleteAccount(),
    );
