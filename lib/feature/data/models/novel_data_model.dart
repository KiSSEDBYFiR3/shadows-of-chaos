import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';

class NovelDataModel extends BaseEntity {
  const NovelDataModel({
    required super.characterImageAdress,
    required super.characterName,
    required super.choisesList,
    required super.message,
    required super.scenaryAdress,
  });

  factory NovelDataModel.fromJson(Map<String, dynamic> json) {
    return NovelDataModel(
      characterImageAdress: json['characterImage'],
      scenaryAdress: json['backgroundImage'],
      characterName: json['characterName'],
      choisesList: json['choisesList'] as List<Map<String, dynamic>>,
      message: json['message'],
    );
  }
}
