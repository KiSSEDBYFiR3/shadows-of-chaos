import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// Entity for game saves
// Stores current level, game route, laste scene and last message number

class NovelSavesEntity extends Equatable {
  final int messageNum;
  final int pageNum;
  final String route;
  final String level;
  final Timestamp lastSave;

  const NovelSavesEntity(
      {required this.level,
      required this.pageNum,
      required this.lastSave,
      required this.messageNum,
      required this.route});

  @override
  List<Object?> get props => [messageNum, route, lastSave, level, pageNum];
}
