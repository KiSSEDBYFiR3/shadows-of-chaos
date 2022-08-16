import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

abstract class IFirebaseRemoteDataSource {
  Future<void> novelSavesUpdate(
      {required String level,
      required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum});
  Future<NovelSavesEntity> novelSavesGet(String uid);
  Future<List<BaseEntity>> getNovelData({required String uid});
  Future<bool> isSignIn();
  Future<UserCredential> signIn();
  Future<void> signOut();
  Future<String> getUid();
}
