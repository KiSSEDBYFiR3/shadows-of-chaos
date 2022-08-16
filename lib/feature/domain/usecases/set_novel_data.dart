import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/domain/repository/firebase_repository.dart';

// Отправляем сохранения в сеть
class SetNovelSaves {
  final IFirebaseRepository novelRepository;
  SetNovelSaves({required this.novelRepository});

  Future call(Timestamp lastSave, int messageNum, String route, int pageNum,
      String level) async {
    return await novelRepository.novelSavesUpdate(
        lastSave: lastSave,
        messageNum: messageNum,
        route: route,
        pageNum: pageNum,
        level: level);
  }
}
