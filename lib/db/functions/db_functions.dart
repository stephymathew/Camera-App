
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
ValueNotifier<List<String>> cameraListNotifier = ValueNotifier([]);
late Database db;
Future<void> createDataBase() async {
 db = await openDatabase('camera.db',
  version: 1,
  onCreate: (db, version) async {
    await db.execute('CREATE TABLE camera (id INTEGER PRIMARY KEY,image TEXT)');
  },
  );
  await getData();
}
Future<void> insert({required String image}) async {
  await db.rawInsert('INSERT INTO camera(image) VALUES(?)',
  [image]);
  await getData();
}
Future<void> getData() async {
  cameraListNotifier.value.clear();
  final data = await db.rawQuery('SELECT * FROM camera');
for(var map in data){
  String image=map['image']as String;
cameraListNotifier.value.add(image);
}
cameraListNotifier.notifyListeners();
}
