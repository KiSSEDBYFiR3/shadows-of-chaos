import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadows_beta_01/feature/domain/entities/page_entity.dart';

// Entity which sole purpose is parsing game pages in its data model
// and delivering them to novel data model
class PageModel extends PageEntity {
  const PageModel({required super.page});

  factory PageModel.fromSnapshot(
      DocumentSnapshot documentSnapshot, String page) {
    return PageModel(page: documentSnapshot.get(page));
  }
}
