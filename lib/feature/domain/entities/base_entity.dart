import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  final String? characterName;
  final String? characterImageAdress;
  final String scenaryAdress;
  final List<String> message;
  final List<Map<String, dynamic>>? choisesList;

  const BaseEntity(
      {required this.characterImageAdress,
      required this.characterName,
      required this.choisesList,
      required this.message,
      required this.scenaryAdress});

  @override
  List<Object?> get props => [
        characterImageAdress,
        message,
        characterName,
        scenaryAdress,
        choisesList
      ];
}
