part of 'model_bloc.dart';

@immutable
sealed class ModelState {}

final class ModelInitial extends ModelState {}

final class ModelsLoaded extends ModelState {
  ModelsLoaded({required this.models});

  final List<Model> models;
}

final class ModelsFailure extends ModelState {}
