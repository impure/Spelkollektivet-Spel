
import 'dart:math';

import 'package:spelkollektivet_spel/Card.dart';
import 'package:tools/RandomBag.dart';

const int INITIAL_CARDS = 10;
const int CARDS_TO_DRAW = 5;

class Player {

	Player(RandomBag<Card> allCards, Random rng) {
		for (int i = 0; i < INITIAL_CARDS; i++) {
			deck.add(allCards.getRandomItem(rng));
		}
	}

	final RandomBag<Card> deck = RandomBag<Card>();
	final RandomBag<Card> discardPile = RandomBag<Card>();

	final List<Card> hand = <Card>[];

	final List<ItemCard> cards = <ItemCard>[];
}
