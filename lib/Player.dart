
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spelkollektivet_spel/Card.dart';
import 'package:spelkollektivet_spel/GameState.dart';
import 'package:tools/RandomBag.dart';

const int INITIAL_CARDS = 10;
const int CARDS_TO_DRAW = 5;

enum Phase {
	ACTION,
	BUY,
}

class Player {

	Player(RandomBag<GameCard> allCards, Random rng) {
		for (int i = 0; i < INITIAL_CARDS; i++) {
			deck.add(allCards.getRandomItem(rng));
		}
	}

	void startTurn() {
		drawCards(CARDS_TO_DRAW);
		bonusMoney = 0;
		currentPhase = Phase.ACTION;
		buysAvailable = 3;
		for (final ItemCard card in itemCards.values) {
			card.action(this);
		}
	}

	void endActionPhase() {
		currentPhase = Phase.BUY;
		bonusMoney = handValue();
		discardHand();
		hand.clear();
	}

	void endTurn() {
	}

	void drawCards(int numToDraw) {
		for (int i = 0; i < numToDraw; i++) {
			if (deck.notEmpty) {
				hand.add(deck.getRandomItem(rng));
			}
		}
	}

	void discardHand() {
		for (int i = 0; i < hand.length; i++) {
			discardPile.add(hand[i]);
		}
	}

	final RandomBag<GameCard> deck = RandomBag<GameCard>();
	final RandomBag<GameCard> discardPile = RandomBag<GameCard>();

	final List<GameCard> hand = <GameCard>[];

	final Map<String, ItemCard> itemCards = <String, ItemCard>{};

	int bonusMoney = 0;
	int buysAvailable = 3;

	Phase currentPhase = Phase.ACTION;

	List<Widget> getHandCards(ThemeData theme, void Function(GameCard) onTap) {
		final List<Widget> cards = <Widget>[];

		for (int i = 0; i < hand.length; i++) {
			cards.add(hand[i].makeCard(theme, false, onTap: () {
				onTap(hand[i]);
			}));
		}

		return cards;
	}

	int handValue() {
		int counter = bonusMoney;

		for (int i = 0; i < hand.length; i++) {
			counter += hand[i].value;
		}

		return counter;
	}
}
