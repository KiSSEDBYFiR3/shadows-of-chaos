import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseRemoteDataSource {
  Future<void> novelSavesUpdate(
      {required String level,
      required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String uid});
  Future<String> novelSavesGet(String uid);
  Future<List<String>> getNovelData(
      {required String uid, required String page, String? level});
  Future<bool> isSignIn();
  Future<UserCredential> signIn();
  Future<void> signOut();
  Future<String> getUid();
}
