
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spelkollektivet_spel/Card.dart';
import 'package:tools/RandomBag.dart';

const int INITIAL_CARDS = 10;
const int CARDS_TO_DRAW = 5;

class Player {

	Player(RandomBag<GameCard> allCards, Random rng) {
		for (int i = 0; i < INITIAL_CARDS; i++) {
			deck.add(allCards.getRandomItem(rng));
		}
		drawCards(rng);
	}

	void drawCards(Random rng) {
		for (int i = 0; i < CARDS_TO_DRAW; i++) {
			hand.add(deck.getRandomItem(rng));
		}
	}

	final RandomBag<GameCard> deck = RandomBag<GameCard>();
	final RandomBag<GameCard> discardPile = RandomBag<GameCard>();

	final List<GameCard> hand = <GameCard>[];

	final List<ItemCard> cards = <ItemCard>[];

	List<Widget> getHandCards(ThemeData theme, void Function(GameCard) onTap) {
		final List<Widget> cards = <Widget>[];

		for (int i = 0; i < hand.length; i++) {
			cards.add(hand[i].makeCard(theme, onTap: () {
				onTap(hand[i]);
			}));
		}

		return cards;
	}

	int handValue() {
		int counter = 0;

		for (int i = 0; i < hand.length; i++) {
			counter += hand[i].value;
		}

		return counter;

	}
}
