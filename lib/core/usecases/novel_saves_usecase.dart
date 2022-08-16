import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

abstract class NovelSavesUseCase {
  Future<NovelSavesEntity> call(String uid);
}
