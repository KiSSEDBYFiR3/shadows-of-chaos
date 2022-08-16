import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';

class NovelDataModel extends BaseEntity {
  const NovelDataModel({
    required super.characterImageAdress,
    required super.characterName,
    required super.choisesList,
    required super.message,
    required super.scenaryAdress,
  });

  factory NovelDataModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return NovelDataModel(
      characterImageAdress: documentSnapshot.get('characterImage') ?? '',
      characterName: documentSnapshot.get('currentCharacter') ?? '',
      choisesList: documentSnapshot.get('choises') ?? [],
      message: (documentSnapshot.get('message') as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      scenaryAdress: documentSnapshot.get('backgroundImage'),
    );
  }
}
