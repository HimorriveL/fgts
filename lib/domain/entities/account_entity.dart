import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String expiresIn;
  final String token;

  @override
  List get props => [expiresIn, token];

  const AccountEntity({required this.token, required this.expiresIn});
}
