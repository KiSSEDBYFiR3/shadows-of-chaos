import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/repository/repository.dart';
import '../../../core/usecases/novel_data_usecase.dart';

// Получаем данные из сети
class GetNovelData extends IGetNovelData {
  final ILocalRepository novelRepository;

  GetNovelData({required this.novelRepository});

  @override
  Future<BaseEntity> call(String uid, String page, int pageNum) async {
    return await novelRepository.getNovelData(uid, page, pageNum);
  }
}
