import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'db_utils.dart';

class DB {
  static final DB _instance = new DB.internal();

  factory DB() => _instance;

  DB.internal();

  static Database _db;

  Future<Database> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}/cards.db';
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE $CARD_TABLE(
          $ID INTEGER PRIMARY KEY,
          $FONT_COLOR INTEGER,
          $FONT_SIZE INTEGER,
          $LAYOUT INTEGER,
          $LABEL TEXT,
          $NAME TEXT,
          $PROFESSION TEXT,
          $PROFILE_IMAGE_PATH TEXT,
          $BACKGROUND_IMAGE_PATH TEXT,
          $BRAND_IMAGE_PATH TEXT,
          $PHONE TEXT,
          $EMAIL TEXT,
          $WHATSAPP TEXT
        )
      '''
    );
  }
}
