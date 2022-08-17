import 'package:equatable/equatable.dart';

class PageEntity extends Equatable {
  final Map<String, dynamic> page;

  const PageEntity({required this.page});

  @override
  List<Object?> get props => [];
}
