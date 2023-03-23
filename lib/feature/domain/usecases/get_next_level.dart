import 'package:shadows_beta_01/feature/domain/repository/repository.dart';

class GetNextLevel {
  ILocalRepository novelRepository;
  GetNextLevel(this.novelRepository);

  @override
  Future<void> call(String uid, String page, {String level = 'levelOne'}) {
    return novelRepository.setNovelData(uid: uid, page: page, level: level);
  }
}
