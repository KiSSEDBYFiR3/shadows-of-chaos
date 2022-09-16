import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadows_beta_01/feature/data/datasourses/local/local_data_source.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';
import 'package:shadows_beta_01/feature/domain/usecases/get_local_saves.dart';
import 'package:shadows_beta_01/feature/domain/usecases/get_novel_data.dart';
import 'package:shadows_beta_01/feature/presentation/blocs/game_cubit/game_states.dart';

class GameCubit extends Cubit<GameStates> {
  final GetNovelData getNovelData;
  final GetLocalSaves getSaves;
  final GameInitialState initState;
  GameCubit(this.getNovelData, this.initState, this.getSaves)
      : super(initState);

  // just siganture nothing to look at yet
  Future<BaseEntity> updatePageState(
      {required String uid, required String page, required int pageNum}) async {
    final savesData = await getSaves.call(uid, page);
    final novelData = await getNovelData.call(uid, page, pageNum);
    return novelData;
  }
}
