import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/friend.dart';
import '../models/model.dart';

String boxName1 = 'fin_aso_models_box';
String boxName2 = 'fin_aso_friends_box';
String keyName1 = 'fin_aso_models_key';
String keyName2 = 'fin_aso_friends_key';

List<Model> modelsList = [];
List<Friend> friendsList = [];
bool onboard = true;
String profileName = '';
String profileEmail = '';
String profileUsername = '';
String profileImage = '';
int profileId = 0;

Future<void> initAll() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdap());
  Hive.registerAdapter(FriendAdap());
  await SharedPreferences.getInstance().then(
    (value) async {
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
}

Future<void> getModels() async {
  try {
    final box = await Hive.openBox(boxName1);
    List data1 = box.get(keyName1) ?? [];
    modelsList = data1.cast<Model>();
  } on Object catch (error, stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }
}

Future<void> getFriends() async {
  try {
    final box = await Hive.openBox(boxName2);
    List data2 = box.get(keyName2) ?? [];
    friendsList = data2.cast<Friend>();
  } on Object catch (error, stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }
}

Future<void> updateModels() async {
  try {
    final box = await Hive.openBox(boxName1);
    box.put(keyName1, modelsList);
    modelsList = await box.get(keyName1);
  } on Object catch (error, stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }
}

Future<void> updateFriends() async {
  try {
    final box = await Hive.openBox(boxName2);
    box.put(keyName2, friendsList);
    friendsList = await box.get(keyName2);
  } on Object catch (error, stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }
}
