import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:heremycard/screen/add_screen/add_card_screen.dart';
import 'package:heremycard/screen/profile_card/profile_card_screen.dart';
import 'package:heremycard/service/card_service.dart';
import 'package:heremycard/utils/mc_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _service = CardService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Here your cards'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _navigateToAddCard,
          child: Icon(Icons.add),
        ),
        body: Container(
          child: FutureBuilder<List<CardModel>>(
            future: _service.getAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CardModel> cards = snapshot.data;
                return ListView.separated(
                  itemBuilder: (context, index) => _buildCardItem(cards[index]),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: cards.length,
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }

  Widget _buildCardItem(CardModel card) {
    return ListTile(
      onTap: () => _navigateToEditCard(card),
      leading: Hero(
        tag: card.id,
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(28.0),
          child: MCUtils.getImageByPathOrDefault(card.profileImagePath, 'assets/person.jpeg'),
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.aspect_ratio),
        onPressed: () => _navigateToProfileCard(card),
      ),
      title: Text(card.label),
      subtitle: Text(card.profession),
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
