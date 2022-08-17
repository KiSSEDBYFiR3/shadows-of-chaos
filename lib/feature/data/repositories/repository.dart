import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/data/datasourses/local/local_data_source_interface.dart';
import 'package:shadows_beta_01/feature/data/models/novel_data_model.dart';
import 'package:shadows_beta_01/feature/data/models/update_novel_saves_data_model.dart';
import 'package:shadows_beta_01/feature/domain/repository/repository.dart';

class LocalRepository implements ILocalRepository {
  ILocalDataSource localDataSource;
  LocalRepository(this.localDataSource);

  @override
  Future<NovelSavesModel> getLocalSaves(String uid, String page) async {
    return await localDataSource.getLocalSaves(uid, page);
  }

  @override
  Future<NovelDataModel> getNovelData(
      String uid, String page, int pageNum) async {
    return await localDataSource.getNovelData(uid, page, pageNum);
  }

  @override
  Future<void> localSavesUpdate(
      {required String level,
      required int pageNum,
      required int messageNum,
      required String route,
      required Timestamp lastSave}) async {
    await localDataSource.localSavesUpdate(
        level: level,
        pageNum: pageNum,
        messageNum: messageNum,
        route: route,
        lastSave: lastSave);
  }

  @override
  Future<void> localSavesUpdateFromServer(String uid, String page) async {
    await localDataSource.localSavesUpdateFromServer(uid, page);
  }

  @override
  Future<void> setNovelData(
      {required String uid,
      required String page,
      required String level}) async {
    return await localDataSource.setNovelData(uid, page, level: level);
  }
}
