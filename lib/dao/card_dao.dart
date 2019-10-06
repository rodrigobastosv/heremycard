import 'package:heremycard/db/db.dart';
import 'package:heremycard/db/db_utils.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:sqflite/sqflite.dart';

class CardDAO {

  Future<List<CardModel>> getAll() async {
    Database db = await DB().db;

    List<Map<String, dynamic>> json = await db.query(CARD_TABLE);
    return List<CardModel>.generate(json.length, (int index) => CardModel.fromJson(json[index]));
  }

  Future<int> save(CardModel cardModel) async {
    Database db = await DB().db;

    return await db.insert(CARD_TABLE, CardModel.toJson(cardModel));
  }

  Future<int> delete(CardModel cardModel) async {
    Database db = await DB().db;

    return await db.delete(CARD_TABLE, where: 'id = ?', whereArgs: [cardModel.id]);
  }

  Future<int> update(CardModel cardModel) async {
    Database db = await DB().db;

    return await db.rawUpdate(
        '''
        UPDATE $CARD_TABLE
        SET 
          $LABEL = ?,
          $NAME = ?,
          $LAYOUT = ?,
          $PROFESSION = ?,
          $PROFILE_IMAGE_PATH = ?,
          $BRAND_IMAGE_PATH = ?,
          $BACKGROUND_IMAGE_PATH = ?,
          $FONT_COLOR = ?,
          $FONT_SIZE = ?,
          $PHONE = ?,
          $EMAIL = ?,
          $WHATSAPP = ?
        WHERE $ID = ?
      ''',
        [
          cardModel.label,
          cardModel.name,
          cardModel.layout,
          cardModel.profession,
          cardModel.profileImagePath,
          cardModel.brandImagePath,
          cardModel.backgroundImagePath,
          cardModel.fontColor,
          cardModel.fontSize,
          cardModel.phone,
          cardModel.email,
          cardModel.whatsapp,
          cardModel.id
        ]
    );
  }
}