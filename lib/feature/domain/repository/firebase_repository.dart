import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebaseRepository {
  Future<bool> isSignIn();
  Future<void> signIn();
  Future<void> signOut();
  Future<void> novelSavesUpdate(
      {required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String level,
      required String uid});
  Future<String> getSaves(String uid);
  Future<List<String>> getNovelData(
      {required String uid, required String page, required String level});
}
