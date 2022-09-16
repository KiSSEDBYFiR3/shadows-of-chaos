import 'package:shadows_beta_01/feature/domain/repository/repository.dart';

class GetSavesFromServer {
  ILocalRepository novelRepository;
  GetSavesFromServer(this.novelRepository);
  @override
  Future<void> call(String uid, String page) async {
    await novelRepository.localSavesUpdateFromServer(uid, page);
  }
}
