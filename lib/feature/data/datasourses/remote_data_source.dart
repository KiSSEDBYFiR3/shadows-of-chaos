import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shadows_beta_01/core/error/exception/exception.dart';
import 'package:shadows_beta_01/feature/data/datasourses/firebase_remote_data_sourse.dart';
import 'package:shadows_beta_01/feature/data/models/novel_data_model.dart';
import 'package:shadows_beta_01/feature/data/models/update_novel_saves_data_model.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

class FirebaseRemoteDataSource implements IFirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteDataSource(this.auth, this.firestore);
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<void> novelSavesUpdate(
      {required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String level}) async {
    return firestore.collection('users').doc('saves').set(NovelSavesModel(
            level: level,
            lastSave: lastSave,
            messageNum: messageNum,
            route: route,
            pageNum: pageNum)
        .toJson());
  }

  @override
  Future<List<BaseEntity>> getNovelData(
      {String level = "levelOne", required String uid}) async {
    final novelDocRef =
        firestore.collection('Novels').doc(uid).collection('levels').doc(level);
    return await (novelDocRef
        .snapshots()
        .map((docRefs) => (NovelDataModel.fromSnapshot(docRefs)))
        .toList());
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<NovelSavesEntity> novelSavesGet(String uid) async {
    final savesDocRef = await firestore
        .collection('users')
        .doc(uid)
        .collection('saves')
        .doc('saves')
        .get();
    return NovelSavesModel.fromSnapshot(savesDocRef);
  }

  @override
  Future<UserCredential> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (message) {
      throw AuthException(message.toString());
    }
  }

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<String> getUid() async => auth.currentUser!.uid;
}
