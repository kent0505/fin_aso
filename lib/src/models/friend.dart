import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Friend {
  Friend({
    required this.id,
    required this.name,
    required this.image,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
}

class FriendAdap extends TypeAdapter<Friend> {
  @override
  final typeId = 1;

  @override
  Friend read(
    BinaryReader reader,
  ) {
    return Friend(
      id: reader.read(),
      name: reader.read(),
      image: reader.read(),
    );
  }

  @override
  void write(
    BinaryWriter writer,
    Friend obj,
  ) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.image);
  }
}
