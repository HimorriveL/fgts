import '../../../../presentation/presenters/all.dart';
import '../../../../ui/pages/all.dart';
import '../../all.dart';

LoginPresenter makeGetxLoginPresenter() => GetxLoginPresenter(
      authentication: makeRemoteAuthentication(),
      saveCurrentAccount: makeLocalSaveCurrentAccount(),
    );
