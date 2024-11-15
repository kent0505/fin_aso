import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/model.dart';
import 'utils.dart';

List<Model> modelsList = [];
bool onboard = true;
String profileName = '';
String profileEmail = '';
String profileUsername = '';
String profileImage = '';
int profileId = 0;

Future<void> initAll() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(ModelAdap());
    // await Hive.deleteBoxFromDisk(DB.boxName);
    await SharedPreferences.getInstance().then(
      (value) async {
        // await value.clear();
        onboard = value.getBool('onboard') ?? true;
        profileName = value.getString('profileName') ?? '';
        profileEmail = value.getString('profileEmail') ?? '';
        profileUsername = value.getString('profileUsername') ?? '';
        profileImage = value.getString('profileImage') ?? '';
        profileId = value.getInt('profileId') ?? 0;
        if (profileId == 0) {
          int randomInt = 10000 + Random().nextInt(100000 - 10000);
          profileId = randomInt;
          value.setInt('profileId', profileId);
        }
      },
    );
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
