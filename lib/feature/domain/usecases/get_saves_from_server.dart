import 'package:shadows_beta_01/core/usecases/get_saves_from_server_usecase.dart';
import 'package:shadows_beta_01/feature/domain/repository/repository.dart';

class GetSavesFromServer implements IGetRemoteSaves {
  ILocalRepository novelRepository;
  GetSavesFromServer(this.novelRepository);
  @override
  Future<void> call(String uid, String page) async {
    await novelRepository.localSavesUpdateFromServer(uid, page);
  }
}
