import 'package:shadows_beta_01/core/usecases/novel_saves_usecase.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';
import 'package:shadows_beta_01/feature/domain/repository/firebase_repository.dart';

class GetNovelSaves extends NovelSavesUseCase {
  final IFirebaseRepository novelRepository;

  GetNovelSaves(this.novelRepository);

  @override
  Future<NovelSavesEntity> call(String uid) {
    return novelRepository.getSaves(uid);
  }
}
