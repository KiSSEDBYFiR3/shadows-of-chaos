import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

class NovelSavesModel extends NovelSavesEntity {
  const NovelSavesModel(
      {required super.level,
      required super.pageNum,
      required super.messageNum,
      required super.route,
      required super.lastSave});

  factory NovelSavesModel.fromJson(Map<String, dynamic> json) {
    return NovelSavesModel(
        level: json['level'],
        pageNum: json['pageNum'],
        messageNum: json['messageNum'],
        route: json['route'],
        lastSave: json['lastSave']);
  }

  Map<String, dynamic> toJson() {
    return {'messageNum': messageNum, 'route': route, 'lastSave': lastSave};
  }
}
