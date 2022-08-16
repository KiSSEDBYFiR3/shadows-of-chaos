import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';

abstract class NovelDataUseCase {
  Future<List<BaseEntity>> call(String uid);
}
