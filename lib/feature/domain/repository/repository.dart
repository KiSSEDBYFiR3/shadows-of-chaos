import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/data/models/novel_data_model.dart';
import 'package:shadows_beta_01/feature/data/models/update_novel_saves_data_model.dart';

abstract class ILocalRepository {
  Future<void> setNovelData(
      {required String uid, required String page, required String level});
  Future<NovelDataModel> getNovelData(String uid, String page, int pageNum);
  Future<NovelSavesModel> getLocalSaves(String uid, String page);
  Future<void> localSavesUpdateFromServer(String uid, String page);
  Future<void> localSavesUpdate(
      {required String level,
      required int pageNum,
      required int messageNum,
      required String route,
      required Timestamp lastSave});
}
