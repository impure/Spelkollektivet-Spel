
import 'dart:math';

import 'package:spelkollektivet_spel/Card.dart';
import 'package:spelkollektivet_spel/Player.dart';
import 'package:tools/RandomBag.dart';

Random rng = Random();

RandomBag<GameCard> cardPool = RandomBag<GameCard>();
RandomBag<GameCard> cardPoolDiscards = RandomBag<GameCard>();

RandomBag<ItemCard> itemPool = RandomBag<ItemCard>();
RandomBag<ItemCard> itemDiscards = RandomBag<ItemCard>();

Map<int, GameCard> cardsCanBeBought = <int, GameCard>{};
Map<int, ItemCard> itemsCanBeBought = <int, ItemCard>{};

int startingPlayerIndex = 0;
int currentPlayerIndex = 0;
List<Player> players = <Player>[];

Player get currentPlayer => players[currentPlayerIndex];

void incrementTurn() {
  currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
  if (currentPlayerIndex == startingPlayerIndex) {
    startingPlayerIndex = (startingPlayerIndex + 1) % players.length;
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
    cardPool.add(GameCard.Tacos());
    clearCardsCanBeBought();
    dealCardsThatCanBeBought();
  }
  currentPlayer.startTurn();
}

void dealCardsThatCanBeBought() {
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
      cardPoolDiscards = RandomBag<GameCard>();
      // TODO: end game if ran out of cards
      if (cardPool.empty) {
        break;
      }
    }
    cardsCanBeBought[i] = cardPool.getRandomItem(rng);
  }
}

void clearCardsCanBeBought() {
  cardsCanBeBought.values.forEach(cardPoolDiscards.add);
  cardsCanBeBought.clear();

  itemsCanBeBought.values.forEach(itemDiscards.add);
  itemsCanBeBought.clear();
}

void initGameState() {
  cardPool.add(GameCard.HouseMeeting());

  cardPool.add(GameCard.SGDC());
  cardPool.add(GameCard.SGDC());
  cardPool.add(GameCard.SGDC());
  cardPool.add(GameCard.SGDC());
  cardPool.add(GameCard.SGDC());
  cardPool.add(GameCard.SGDC());
  cardPool.add(GameCard.SGDC());

  cardPool.add(GameCard.StandUp());
  cardPool.add(GameCard.StandUp());
  cardPool.add(GameCard.StandUp());
  cardPool.add(GameCard.StandUp());
  cardPool.add(GameCard.StandUp());
  cardPool.add(GameCard.StandUp());
  cardPool.add(GameCard.StandUp());
  cardPool.add(GameCard.StandUp());

  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());
  cardPool.add(GameCard.SecondsTime());

  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());
  cardPool.add(GameCard.Tacos());

  cardPool.add(GameCard.Karaoke());
  cardPool.add(GameCard.Karaoke());
  cardPool.add(GameCard.Karaoke());
  cardPool.add(GameCard.Karaoke());
  cardPool.add(GameCard.Karaoke());
  cardPool.add(GameCard.Karaoke());

  cardPool.add(GameCard.FoodTruck());
  cardPool.add(GameCard.FoodTruck());
  cardPool.add(GameCard.FoodTruck());
  cardPool.add(GameCard.FoodTruck());
  cardPool.add(GameCard.FoodTruck());
  cardPool.add(GameCard.FoodTruck());

  cardPool.add(GameCard.TVShow());
  cardPool.add(GameCard.TVShow());
  cardPool.add(GameCard.TVShow());
  cardPool.add(GameCard.TVShow());

  cardPool.add(GameCard.Movie());
  cardPool.add(GameCard.Movie());
  cardPool.add(GameCard.Movie());
  cardPool.add(GameCard.Movie());

  itemPool.add(ItemCard.Treadmill());
  itemPool.add(ItemCard.Treadmill());
  itemPool.add(ItemCard.Treadmill());
  itemPool.add(ItemCard.Treadmill());
  itemPool.add(ItemCard.Hammock());
  itemPool.add(ItemCard.Hammock());
  itemPool.add(ItemCard.Hammock());
  itemPool.add(ItemCard.Hammock());
  itemPool.add(ItemCard.GamingComputer());
  itemPool.add(ItemCard.GamingComputer());
  itemPool.add(ItemCard.GamingComputer());
  itemPool.add(ItemCard.GamingComputer());
  itemPool.add(ItemCard.StandingDesk());
  itemPool.add(ItemCard.StandingDesk());
  itemPool.add(ItemCard.StandingDesk());
  itemPool.add(ItemCard.StandingDesk());
  itemPool.add(ItemCard.StandingDesk());
  itemPool.add(ItemCard.WaffleMaker());
  itemPool.add(ItemCard.WaffleMaker());
  itemPool.add(ItemCard.WaffleMaker());
  itemPool.add(ItemCard.WaffleMaker());

  players.add(Player(cardPool, rng));
  players.add(Player(cardPool, rng));

  dealCardsThatCanBeBought();
}
