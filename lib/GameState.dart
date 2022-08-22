
import 'package:spelkollektivet_spel/Card.dart';
import 'package:tools/RandomBag.dart';

RandomBag<Card> cardPool = RandomBag<Card>();
RandomBag<Card> cardPoolDiscards = RandomBag<Card>();

RandomBag<ItemCard> itemBool = RandomBag<ItemCard>();
RandomBag<ItemCard> itemDiscards = RandomBag<ItemCard>();

void initGameState() {
  cardPool.add(Card.HouseMeeting());

  cardPool.add(Card.SGDC());
  cardPool.add(Card.SGDC());
  cardPool.add(Card.SGDC());
  cardPool.add(Card.SGDC());
  cardPool.add(Card.SGDC());

  cardPool.add(Card.StandUp());
  cardPool.add(Card.StandUp());
  cardPool.add(Card.StandUp());
  cardPool.add(Card.StandUp());
  cardPool.add(Card.StandUp());
  cardPool.add(Card.StandUp());
  cardPool.add(Card.StandUp());
  cardPool.add(Card.StandUp());
}
