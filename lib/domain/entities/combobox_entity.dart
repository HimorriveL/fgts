import 'package:equatable/equatable.dart';

class ComboboxEntity extends Equatable {
  final String display;
  final String? value;

  @override
  List get props => [display, value];

  const ComboboxEntity({
    required this.display,
    required this.value,
  });
}
