import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';

abstract class IGetNovelData {
  Future<BaseEntity> call(String uid, String page, int pageNum);
}
