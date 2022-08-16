import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

abstract class IFirebaseRepository {
  Future<bool> isSignIn();
  Future<void> signIn();
  Future<void> signOut();
  Future<void> novelSavesUpdate(
      {required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String level});
  Future<NovelSavesEntity> getSaves(String uid);
  Future<List<BaseEntity>> getNovelData(String uid);
}
