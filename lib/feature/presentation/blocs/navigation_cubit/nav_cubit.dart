import 'package:bloc/bloc.dart';
import 'package:shadows_beta_01/feature/domain/usecases/get_local_saves.dart';
import 'package:shadows_beta_01/feature/domain/usecases/get_novel_data.dart';
import 'package:shadows_beta_01/feature/domain/usecases/get_saves_from_server.dart';
import 'package:shadows_beta_01/feature/domain/usecases/update_novel_local_saves.dart';
import 'package:shadows_beta_01/feature/domain/usecases/update_remote_saves.dart';
import 'package:shadows_beta_01/feature/presentation/blocs/navigation_cubit/nav_cubit_states.dart';

class NavCubit extends Cubit<NavCubitStates> {
  bool isSignIn;
  GetNovelData getNovelData;
  GetLocalSaves getLocalSaves;
  UpdateLocalSaves updateLocalSaves;
  UpdateRemoteSaves updateRemoteSaves;
  GetSavesFromServer getSavesFromServer;

  NavCubit(this.isSignIn, this.getNovelData, this.getLocalSaves,
      this.updateLocalSaves, this.updateRemoteSaves, this.getSavesFromServer)
      : super(isSignIn ? StartPageState() : const SignInState());

  newGame(String uid, String page, int pageNum) async {
    final novelData = await getNovelData.call(uid, page, pageNum);
    emit(NewGameState(novelData));
  }

  openSettings() {
    emit(const SettingsPageState());
  }

  openInfo() {
    emit(const InfoPageState());
  }

  lastSave(String uid, String page, int pageNum) async {
    final localSave = await getLocalSaves.call(uid, page);
    final novelData = await getNovelData.call(uid, page, pageNum);
    emit(LastSaveState(localSave, novelData));
  }

  updateSaves(String uid, String page) async {
    final remoteSaves = await getSavesFromServer.call(uid, page);
  }
}
