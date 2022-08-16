import 'package:dartz/dartz.dart';
import 'package:shadows_beta_01/core/error/failure/failure.dart';
import 'package:shadows_beta_01/feature/domain/entities/base_entity.dart';

abstract class NovelRepository {
  Future<Either<Failure, BaseEntity>> getNovelData();
  Future<Either<Failure, BaseEntity>> updateNovelData();
}
