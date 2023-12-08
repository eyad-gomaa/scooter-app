import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';
@HiveType(typeId: 0)
class Data extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String lastChangeKm;

  Data({required this.name, required this.lastChangeKm});
}