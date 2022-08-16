import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/data/datasourses/firebase_remote_data_sourse.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/repository/firebase_repository.dart';

import '../../domain/entities/novel_saves_entity.dart';

class FirebaseRepeository implements IFirebaseRepository {
  final IFirebaseRemoteDataSource remoteDataSource;

  FirebaseRepeository(this.remoteDataSource);

  @override
  Future<bool> isSignIn() async {
    return remoteDataSource.isSignIn();
  }

  @override
  Future<void> signIn() async {
    remoteDataSource.signIn();
  }

  @override
  Future<void> signOut() async {
    remoteDataSource.signOut();
  }

  @override
  Future<List<BaseEntity>> getNovelData(String uid) async {
    return remoteDataSource.getNovelData(uid: uid);
  }

  @override
  Future<NovelSavesEntity> getSaves(String uid) async {
    return remoteDataSource.novelSavesGet(uid);
  }

  @override
  Future<void> novelSavesUpdate(
      {required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String level}) async {
    return remoteDataSource.novelSavesUpdate(
        level: level,
        lastSave: lastSave,
        messageNum: messageNum,
        route: route,
        pageNum: pageNum);
  }
}
