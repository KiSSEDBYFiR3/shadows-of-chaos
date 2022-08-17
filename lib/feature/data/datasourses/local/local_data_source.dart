import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:shadows_beta_01/core/error/exception/exception.dart';
import 'package:shadows_beta_01/feature/data/datasourses/local/local_data_source_interface.dart';
import 'package:shadows_beta_01/feature/data/datasourses/remote/firebase_remote_data_sourse.dart';
import 'package:shadows_beta_01/feature/data/models/novel_data_model.dart';
import 'package:shadows_beta_01/feature/data/models/update_novel_saves_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String novelData = "NOVEL_DATA";
const String userId = "CURRENT_UID";
const String localSaves = "LOCAL_SAVES";

class LocalDataSource implements ILocalDataSource {
  IFirebaseRemoteDataSource remoteDataSource;
  SharedPreferences localDataSource;
  LocalDataSource(this.remoteDataSource, this.localDataSource);

// If app is runnning for the first time
// then we will call setNovelData() and save novel pages
// in SharedPreferences first and then access said data.
// Function returns only one page that was requested

  @override
  Future<NovelDataModel> getNovelData(String uid, String page, int pageNum,
      {String? level}) async {
    final bool firstRun = await IsFirstRun.isFirstRun();
    if (firstRun) {
      await setNovelData(uid, page);
      final novelPages =
          await Future.value(localDataSource.getStringList(novelData));
      return NovelDataModel.fromJson(json.decode(novelPages[pageNum]));
    } else if ((localDataSource.getStringList(novelData)) != null) {
      final novelPages =
          await Future.value(localDataSource.getStringList(novelData));
      return NovelDataModel.fromJson(json.decode(novelPages[pageNum]));
    } else {
      throw CacheException();
    }
  }

// Same as with getNovelData: if app runs for the first time,
// we must be sure that we have saves data in shared preferenses storage,
// so first of all we get data from FirebaseRemoteDataSource and save it in our storage

  @override
  Future<NovelSavesModel> getLocalSaves(String uid, String page) async {
    final bool firstRun = await IsFirstRun.isFirstRun();
    if (firstRun) {
      await localSavesUpdateFromServer(uid, page);
      final saves = await Future.value(localDataSource.getString(localSaves));
      return NovelSavesModel.fromJson(json.decode(saves));
    } else if (localDataSource.getString(localSaves) != null) {
      final saves = await Future.value(localDataSource.getString(localSaves));
      return NovelSavesModel.fromJson(json.decode(saves));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> localSavesUpdateFromServer(String uid, String page) async {
    final saves =
        await Future.value(remoteDataSource.novelSavesGet(uid).toString());
    localDataSource.setString(localSaves, saves);
  }

// Saving our current level and uid in SharedPrefernces
  @override
  Future<void> setNovelData(String uid, String page, {String? level}) async {
    final dataList =
        await remoteDataSource.getNovelData(uid: uid, page: page, level: level);
    final currentUid = await remoteDataSource.getUid();
    localDataSource.setStringList(novelData, dataList);
    localDataSource.setString(userId, currentUid);
  }

// Updating saves after session updates in SharedPrefernces storage
  @override
  Future<void> localSavesUpdate(
      {required String level,
      required int pageNum,
      required int messageNum,
      required String route,
      required Timestamp lastSave}) async {
    final savesModel = NovelSavesModel(
            level: level,
            pageNum: pageNum,
            messageNum: messageNum,
            route: route,
            lastSave: lastSave)
        .toJson()
        .toString();
    await localDataSource.setString(localSaves, savesModel);
  }
}
