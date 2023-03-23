import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/domain/repository/firebase_repository.dart';

class UpdateRemoteSaves {
  IFirebaseRepository novelRepository;
  UpdateRemoteSaves(this.novelRepository);

  @override
  Future<void> call(
      {required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String level,
      required String uid}) async {
    return await novelRepository.novelSavesUpdate(
        lastSave: lastSave,
        messageNum: messageNum,
        route: route,
        pageNum: pageNum,
        level: level,
        uid: uid);
  }
}
