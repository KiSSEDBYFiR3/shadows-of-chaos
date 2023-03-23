import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';
import 'package:shadows_beta_01/feature/domain/repository/repository.dart';

class GetLocalSaves {
  final ILocalRepository novelRepository;

  GetLocalSaves(this.novelRepository);

  @override
  Future<NovelSavesEntity> call(String uid, String page) {
    return novelRepository.getLocalSaves(uid, page);
  }
}
