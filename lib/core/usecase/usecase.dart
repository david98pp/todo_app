import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/error/error_item.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorItem, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
