import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:heremycard/screen/add_screen/add_card_screen.dart';
import 'package:heremycard/screen/profile_card/profile_card_screen.dart';
import 'package:heremycard/service/card_service.dart';
import 'package:heremycard/utils/mc_ui_utils.dart';
import 'package:heremycard/utils/mc_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final _service = CardService();
  List<CardModel> cards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Here your cards'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Create'),
              color: Colors.blue[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: _navigateToAddCard,
            ),
          ),
        ],
      ),
      body: _buildCards(),
    );
  }

  Widget _buildCards() {
    return Container(
      child: FutureBuilder<List<CardModel>>(
        future: _service.getAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                cards = snapshot.data;
                if (cards.isEmpty) {
                  return _buildAddCards();
                }
                return ListView.separated(
                  itemBuilder: (context, index) => _buildCardItem(index),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: cards.length,
                );
              }
              return _buildAddCards();
            default:
              return _buildAddCards();
          }
        },
      ),
    );
  }

  Widget _buildAddCards() {
    return Center(
      child: Container(
        height: 250.0,
        width: 250.0,
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 2,
          dashPattern: [6],
          color: Colors.blueGrey,
          radius: Radius.circular(20.0),
          child: FlatButton(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            textColor: Colors.blueGrey,
            child: Container(
              height: 250.0,
              alignment: Alignment.center,
              child: Text(
                'Tap here to create your first card!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19.0),
              ),
            ),
            onPressed: _navigateToAddCard,
          ),
        ),
      ),
    );
  }

  Widget _buildCardItem(int index) {
    CardModel card = cards[index];
    return Dismissible(
      key: Key(card.id.toString()),
      onDismissed: (direction) async {
        await _service.delete(card);
        setState(() => cards.remove(card));
        _showDeletedSnackBar(index, card);
      },
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.delete),
              Icon(Icons.delete),
            ],
          ),
        ),
      ),
      child: ListTile(
        onTap: () => _navigateToEditCard(card),
        leading: Hero(
          tag: card.id,
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(28.0),
            child: MCUtils.getImageByPathOrDefault(
                card.profileImagePath, 'assets/person.jpeg'),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.aspect_ratio),
          onPressed: () => _navigateToProfileCard(card),
        ),
        title: Text(card.label),
        subtitle: Text(card.profession),
      ),
    );
  }

  void _showDeletedSnackBar(int index, CardModel card) async {
    MCUiUtils.showSnackBar(
      _key,
      'Card Deleted!',
      () async {
        _service.save(card);
        setState(
          () => cards.insert(index, card),
        );
      },
    );
  }

  void _navigateToProfileCard(CardModel card) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileCardScreen(card),
      ),
    );
  }

  void _navigateToAddCard() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddCardScreen(CardModel()),
      ),
    );
  }

  void _navigateToEditCard(CardModel card) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddCardScreen(card),
      ),
    );
  }
}
