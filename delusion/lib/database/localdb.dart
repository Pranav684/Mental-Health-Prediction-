import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'consts.dart';

List ques = [
  "I feel overwhelmingly sad at times",
  "When I think of the future I feel hopeless",
  "I feel like a complete failure",
  "I get a lot of satisfaction / joy from doing things",
  "I feel guilty about something most of the time",
  "I feel like I am being punished",
  "I feel disappointed (even disgusted) with myself",
  "The bad things in my life aren't all my fault",
  "I am often on the brink of tears or cry",
  "I feel irritated and annoyed by things in my life",
  "I am very interested in other people's lives and like to listen to them",
  "I find it easy to make decisions, big and small",
  "I think I am unattractive or ugly",
  "I find it really hard to do anything, especially work",
  "My sleep patterns have been really disrupted",
  "I am so tired I don't have the energy to do anything",
  "My appetite has changed a lot",
  "I have lost a lot of weight",
  "I am very concerned, even preoccupied, with my physical health",
  "I am not interested in sexual relations at all",
  "I have thought about ending my life"
];

Future<Database> setPath() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'zooper_customer.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE  $localTable (questions TEXT)');
    },
    version: 1,
  );
  return database;
}

Future<void> insertData() async {
  final db = await setPath();
  for (int i = 0; i < 21; i++) {
    print(ques[i]);
    await db.insert(
      localTable,
      {'questions': ques[i]},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

getTableData(table_name) async {
  final db = await setPath();
  final maps = await db.query(table_name);
  return maps;
}
