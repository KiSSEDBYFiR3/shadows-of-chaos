import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IUpdateRemoteSaves {
  Future<void> call(
      {required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String level,
      required String uid});
}
