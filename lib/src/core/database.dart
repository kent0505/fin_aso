import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/model.dart';
import 'utils.dart';

List<Model> modelsList = [];
bool onboard = true;

Future<void> initAll() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    await SharedPreferences.getInstance().then((value) async {
      // await value.clear();
      onboard = value.getBool('onboard') ?? true;
    });
    Hive.registerAdapter(ModelAdap());
  } catch (e) {
    logg(e);
  }
}

Future<void> getModels() async {
  try {
    final box = await Hive.openBox('fin_aso_box');
    List data = box.get('models_key') ?? [];
    modelsList = data.cast<Model>();
    logg(modelsList.length);
  } on Object catch (error, stackTrace) {
    logg(error);
    Error.throwWithStackTrace(error, stackTrace);
  }
}

Future<void> updateModels() async {
  try {
    final box = await Hive.openBox('fin_aso_box');
    box.put('models_key', modelsList);
    modelsList = await box.get('models_key');
  } on Object catch (error, stackTrace) {
    logg(error);
    Error.throwWithStackTrace(error, stackTrace);
  }
}

Future<void> saveOnb() async {
  await SharedPreferences.getInstance().then(
    (value) {
      value.setBool('onboard', false);
    },
  );
}