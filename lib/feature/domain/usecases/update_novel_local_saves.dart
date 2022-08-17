import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/core/usecases/update_novel_saves_usecase.dart';
import 'package:shadows_beta_01/feature/domain/repository/repository.dart';

// Sending local saves to Firestore
class UpdateLocalSaves implements IUpdateLocalSaves {
  final ILocalRepository novelRepository;
  UpdateLocalSaves({required this.novelRepository});

  @override
  Future<void> call({
    required Timestamp lastSave,
    required int messageNum,
    required String route,
    required int pageNum,
    required String level,
  }) async {
    return await novelRepository.localSavesUpdate(
        level: level,
        pageNum: pageNum,
        messageNum: messageNum,
        route: route,
        lastSave: lastSave);
  }
}
