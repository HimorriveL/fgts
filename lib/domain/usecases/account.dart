import 'package:equatable/equatable.dart';

import '../entities/all.dart';

abstract class IAuthentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String document;
  final String password;
  @override
  List get props => [document, password];
  const AuthenticationParams({required this.document, required this.password});
}

abstract class ILoadAccount {
  Future<AccountEntity> loadAccount();
}

abstract class ISaveAccount {
  Future<void> execute(AccountEntity account);
}

abstract class IDeleteAccount {
  Future<void> execute();
}
