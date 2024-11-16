part of 'model_bloc.dart';

@immutable
sealed class ModelEvent {}

class GetModels extends ModelEvent {}

class AddModel extends ModelEvent {
  AddModel({required this.model});
  final Model model;
}

class EditModel extends ModelEvent {
  EditModel({required this.model});
  final Model model;
}

class DeleteModel extends ModelEvent {
  DeleteModel({required this.model});
  final Model model;
}
