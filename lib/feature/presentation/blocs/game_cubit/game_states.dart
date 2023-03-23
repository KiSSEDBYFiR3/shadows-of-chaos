import 'package:equatable/equatable.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

class GameStates extends Equatable {
  const GameStates();

  @override
  List<Object?> get props => [];
}

class GameInitialState extends GameStates {
  final BaseEntity novelData;
  final NovelSavesEntity savesData;
  const GameInitialState(this.novelData, this.savesData);

  @override
  List<Object?> get props => [novelData, savesData];
}

class GameLoadingState extends GameStates {
  const GameLoadingState();

  @override
  List<Object?> get props => [];
}

class GameLoadedState extends GameStates {
  final BaseEntity novelData;
  final NovelSavesEntity savesData;

  const GameLoadedState(this.novelData, this.savesData);

  @override
  List<Object?> get props => [novelData, savesData];
}
