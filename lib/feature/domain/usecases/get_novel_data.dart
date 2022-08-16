import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/repository/firebase_repository.dart';
import '../../../core/usecases/novel_data_usecase.dart';

// Получаем данные из сети
class GetNovelData extends NovelDataUseCase {
  final IFirebaseRepository novelRepository;

  GetNovelData({required this.novelRepository});

  @override
  Future<List<BaseEntity>> call(String uid) async {
    return await novelRepository.getNovelData(uid);
  }
}
