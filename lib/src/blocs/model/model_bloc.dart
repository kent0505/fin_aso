import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/database.dart';
import '../../models/model.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  ModelBloc() : super(ModelInitial()) {
    on<ModelEvent>(
      (event, emit) => switch (event) {
        GetModels() => _get(event, emit),
        AddModel() => _add(event, emit),
        EditModel() => _edit(event, emit),
        DeleteModel() => _delete(event, emit),
      },
    );
  }

  void _get(GetModels event, Emitter<ModelState> emit) async {
    try {
      await getModels();
      emit(ModelsLoaded(models: modelsList));
    } on Object catch (_) {
      emit(ModelsFailure());
    }
  }

  void _add(AddModel event, Emitter<ModelState> emit) async {
    try {
      modelsList.insert(0, event.model);
      await updateModels();
      emit(ModelsLoaded(models: modelsList));
    } on Object catch (_) {
      emit(ModelsFailure());
    }
  }

  void _edit(EditModel event, Emitter<ModelState> emit) async {
    try {
      for (Model model in modelsList) {
        if (identical(model.id, event.model.id)) {
          model.title = event.model.title;
          model.amount = event.model.amount;
          model.category = event.model.category;
        }
      }
      await updateModels();
      emit(ModelsLoaded(models: modelsList));
    } on Object catch (_) {
      emit(ModelsFailure());
    }
  }

  void _delete(DeleteModel event, Emitter<ModelState> emit) async {
    try {
      modelsList.removeWhere((model) => identical(model, event.model));
      await updateModels();
      emit(ModelsLoaded(models: modelsList));
    } on Object catch (_) {
      emit(ModelsFailure());
    }
  }
}
