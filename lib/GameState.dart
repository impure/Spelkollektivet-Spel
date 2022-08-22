
import 'dart:math';

import 'package:spelkollektivet_spel/Card.dart';
import 'package:spelkollektivet_spel/Player.dart';
import 'package:tools/RandomBag.dart';

Random rng = Random();

RandomBag<Card> cardPool = RandomBag<Card>();
RandomBag<Card> cardPoolDiscards = RandomBag<Card>();

RandomBag<ItemCard> itemPool = RandomBag<ItemCard>();
RandomBag<ItemCard> itemDiscards = RandomBag<ItemCard>();

Map<int, Card> cardsCanBeBought = <int, Card>{};
Map<int, ItemCard> itemsCanBeBought = <int, ItemCard>{};

int currentPlayerIndex = 0;
List<Player> players = <Player>[];

void startRound() {
  assert(cardsCanBeBought.isEmpty);
  assert(itemsCanBeBought.isEmpty);

  for (int i = 0; i < 4; i++) {
    if (itemPool.empty) {
      itemPool = itemDiscards;
      itemDiscards = RandomBag<ItemCard>();
      if (itemPool.empty) {
        break;
      }
    }
    itemsCanBeBought[i] = itemPool.getRandomItem(rng);
  }

  for (int i = 0; i < 12; i++) {
    if (cardPool.empty) {
      cardPool = cardPoolDiscards;
      cardPoolDiscards = RandomBag<Card>();
      // TODO: end game if ran out of cards
      if (cardPool.empty) {
        break;
      }
    }
    cardsCanBeBought[i] = cardPool.getRandomItem(rng);
  }
}

void endRound() {

  cardsCanBeBought.values.forEach(cardPoolDiscards.add);
  cardsCanBeBought.clear();

  itemsCanBeBought.values.forEach(itemDiscards.add);
  itemsCanBeBought.clear();
}

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

  // For debugging
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

  itemPool.add(ItemCard.Treadmill());
  itemPool.add(ItemCard.Treadmill());
  itemPool.add(ItemCard.Treadmill());
  itemPool.add(ItemCard.Hammock());
  itemPool.add(ItemCard.Hammock());
  itemPool.add(ItemCard.Hammock());

  players.add(Player(cardPool, rng));

  startRound();
}
