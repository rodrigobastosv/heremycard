import 'package:heremycard/dao/card_dao.dart';
import 'package:heremycard/model/card_model.dart';

class CardService {

  final _dao = CardDAO();

  Future<List<CardModel>> getAll() async {
    return _dao.getAll();
  }

  Future<int> save(CardModel cardModel) async {
    return _dao.save(cardModel);
  }

  Future<int> update(CardModel cardModel) async {
    return _dao.update(cardModel);
  }

  Future<int> delete(CardModel cardModel) async {
    return _dao.delete(cardModel);
  }
}