// ignore_for_file: invalid_return_type_for_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

class NovelSavesModel extends NovelSavesEntity {
  const NovelSavesModel(
      {required super.level,
      required super.pageNum,
      required super.messageNum,
      required super.route,
      required super.lastSave});

  factory NovelSavesModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return NovelSavesModel(
        level: documentSnapshot.get('level'),
        pageNum: documentSnapshot.get('pageNum'),
        messageNum: documentSnapshot.get('messageNum'),
        route: documentSnapshot.get('route'),
        lastSave: documentSnapshot.get('lastSave'));
  }

  Map<String, dynamic> toJson() {
    return {'messageNum': messageNum, 'route': route, 'lastSave': lastSave};
  }
}
