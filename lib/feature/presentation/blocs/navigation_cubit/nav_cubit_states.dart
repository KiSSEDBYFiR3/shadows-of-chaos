import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';
import 'package:shadows_beta_01/feature/domain/entities/novel_saves_entity.dart';

class NavCubitStates extends Equatable {
  const NavCubitStates();

  @override
  List<Object?> get props => [];
}

class SignInState extends NavCubitStates {
  final bool isSignedIn;
  const SignInState({this.isSignedIn = false});

  @override
  List<Object?> get props => [isSignedIn];
}

class StartPageState extends NavCubitStates {
  @override
  List<Object?> get props => [];
}

class LastSaveState extends NavCubitStates {
  final NovelSavesEntity lastSave;
  final BaseEntity novelData;

  const LastSaveState(this.lastSave, this.novelData);

  @override
  List<Object?> get props => [lastSave, novelData];
}

class NoSavesErrorState extends NavCubitStates {
  final String message;
  const NoSavesErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class InfoPageState extends NavCubitStates {
  const InfoPageState();

  @override
  List<Object?> get props => [];
}

class SettingsPageState extends NavCubitStates {
  const SettingsPageState();

  @override
  List<Object?> get props => [];
}

class NewGameState extends NavCubitStates {
  final BaseEntity gameData;
  const NewGameState(this.gameData);

  @override
  List<Object?> get props => [gameData];
}

class UpdateSavesState extends NavCubitStates {}
