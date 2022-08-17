import 'package:shadows_beta_01/core/usecases/novel_saves_usecase.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';
import 'package:shadows_beta_01/feature/domain/repository/repository.dart';

class GetLocalSaves extends NovelSavesUseCase {
  final ILocalRepository novelRepository;

  GetLocalSaves(this.novelRepository);

  @override
  Future<NovelSavesEntity> call(String uid, String page) {
    return novelRepository.getLocalSaves(uid, page);
  }
}
