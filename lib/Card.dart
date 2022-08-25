

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spelkollektivet_spel/GameState.dart';
import 'package:spelkollektivet_spel/Player.dart';

class GameCard {

	const GameCard({
		required this.name,
		required this.description,
		required this.value,
		required this.action,
		this.trashOnUse = false,
	});

	/*
	factory Card.IceCreamThief() {
		return Card(
			name: "Ice Cream Thief",
			description: "Discard this card, steal one item from another player",
			value: 1000,
			action: () {},
		);
	}
	*/

	factory GameCard.SGDC() {
		return GameCard(
			name: "SGDC",
			description: "+2 cards",
			value: 500,
			action: (Player player) {
				for (int i = 0; i < 2; i++) {
					if (player.deck.notEmpty) {
						player.hand.add(player.deck.getRandomItem(rng));
					}
				}
			},
		);
	}

	factory GameCard.StandUp() {
		return GameCard(
			name: "Stand Up",
			description: "Discard the top card of your deck. +2 cards",
			value: 200,
			action: (Player player) {
				if (player.deck.notEmpty) {
					player.discardPile.add(player.deck.getRandomItem(rng));
				}
				for (int i = 0; i < 2; i++) {
					if (player.deck.notEmpty) {
						player.hand.add(player.deck.getRandomItem(rng));
					}
				}
			},
		);
	}

	factory GameCard.HouseMeeting() {
		return GameCard(
			name: "House Meeting",
			description: "+3 cards",
			value: 1000,
			action: (Player player) {
				for (int i = 0; i < 3; i++) {
					if (player.deck.notEmpty) {
						player.hand.add(player.deck.getRandomItem(rng));
					}
				}
			},
		);
	}

	factory GameCard.SecondsTime() {
		const int value = 700;
		return GameCard(
			name: "Seconds Time",
			description: "+1 Card. Gain That card's value and this card's value as a bonus.",
			value: value,
			action: (Player player) {
				if (player.deck.notEmpty) {
					final GameCard card = player.deck.getRandomItem(rng);
					player.bonusMoney += card.value + value;
					player.hand.add(card);
				}
			},
		);
	}

	factory GameCard.Tacos() {
		return GameCard(
			name: "Tacos",
			description: "Trash this card. +1500 SEK.",
			value: 500,
			action: (Player player) {
				player.bonusMoney += 1500;
			},
			trashOnUse: true,
		);
	}

	factory GameCard.Karaoke() {
		return GameCard(
			name: "Karaoke",
			description: "Redeal both the item cards and action cards.",
			value: 800,
			action: (Player player) {
				clearCardsCanBeBought();
				dealCardsThatCanBeBought();
			},
		);
	}

	factory GameCard.FoodTruck() {
		return GameCard(
			name: "Food Truck",
			description: "Discard your hand. Draw new cards equal to how many cards you had before +4.",
			value: 300,
			action: (Player player) {
				final int cards = player.hand.length;
				player.discardHand();
				player.drawCards(cards + 4);
			},
		);
	}

	factory GameCard.TVShow() {
		return GameCard(
			name: "TV Show",
			description: "+1 Buy",
			value: 450,
			action: (Player player) {
				player.buysAvailable++;
			},
		);
	}

	factory GameCard.Movie() {
		return GameCard(
			name: "Movie",
			description: "+2 Buys",
			value: 900,
			action: (Player player) {
				player.buysAvailable += 2;
			},
		);
	}

	Widget get prefix => const SizedBox();

	final bool trashOnUse;

	Widget makeCard(ThemeData theme, bool blocked, {void Function()? onTap}) {
		return Center(
			child: ConstrainedBox(
				constraints: const BoxConstraints(maxWidth: 150, maxHeight: 150),
				child: Align(
					alignment: Alignment.center,
					child: AspectRatio(
						aspectRatio: 1,
						child: Padding(
							padding: const EdgeInsets.all(5),
							child: GestureDetector(
								onTap: onTap,
								child: Material(
									key: Key("$this $blocked"),
									borderRadius: const BorderRadius.all(Radius.circular(20)),
									color: blocked ? theme.cardColor.withOpacity(0.5) : theme.cardColor,
									elevation: 5,
									child: Padding(
										padding: const EdgeInsets.all(5),
										child: Column(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												prefix,
												SingleChildScrollView(
													scrollDirection: Axis.horizontal,
													child: Text(name, maxLines: 1, textAlign: TextAlign.center, style: const TextStyle(overflow: TextOverflow.clip)),
												),
												const SizedBox(height: 5),
												Text(description, style: const TextStyle(fontSize: 9), textAlign: TextAlign.center),
												const SizedBox(height: 5),
												Text("$value SEK", style: const TextStyle(fontSize: 10)),
											],
										),
									),
								),
							),
						),
					),
				),
			),
		);
	}

	/*
	-
    - Seconds time
        - Draw a card, that card gives double money if not used
    - Tacos
        - Trash this card, +300 SEK and draw a card
    - Movie Night
        - Get an activity card of XXX SEK or less for free
    - Presentation
        - Discard a card, get a card back worth up to XXX SEK more
    - LAN party
        - +2 Cards, each player may draw an additional card
    - The ‘lake’
        - Remove 1 activity card, 1 item card, or draw a card
    - Karoke
        - Redeal either the items deck or the activities deck
    - Food Truck
        - Discard your hand and redraw as many cards as you had before + 4
    - Volunteer day
        - Pick a player, that player must reshuffle either this round (if they haven’t gone yet) or next round
	 */

	final String name, description;
	final Function(Player) action;
	final int value;
}

enum Room {
	//HALL,
	ROUND_ROOM,
	BASEMENT,
	KITCHEN,
	GYM,
	PATIO,
	//Theatre
}

class ItemCard extends GameCard {

	ItemCard({
		required super.name,
		required super.description,
		required super.value,
		required super.action,
		required this.room,
	});

	factory ItemCard.WaffleMaker() {
		return ItemCard(
			name: "Waffle Maker",
			description: "+1 Buy",
			value: 1500,
			action: (Player player) {
				player.buysAvailable++;
			},
			room: Room.KITCHEN,
		);
	}

	factory ItemCard.Hammock() {
		return ItemCard(
			name: "Hammock",
			description: "+200 SEK",
			value: 3500,
			action: (Player player) {
				player.bonusMoney += 200;
			},
			room: Room.PATIO,
		);
	}

	factory ItemCard.StandingDesk() {
		return ItemCard(
			name: "Standing Desk",
			description: "+200 SEK",
			value: 4000,
			action: (Player player) {
				player.bonusMoney += 200;
			},
			room: Room.BASEMENT,
		);
	}

	factory ItemCard.Treadmill() {
		return ItemCard(
			name: "Treadmill",
			description: "+1 Additional Card",
			value: 8000,
			action: (Player player) {
				if (player.deck.notEmpty) {
					player.hand.add(player.deck.getRandomItem(rng));
				}
			},
			room: Room.GYM,
		);
	}

	factory ItemCard.GamingComputer() {
		return ItemCard(
			name: "Gaming Computer",
			description: "+1 Buy",
			value: 10000,
			action: (Player player) {
				player.buysAvailable++;
			},
			room: Room.ROUND_ROOM,
		);
	}

	final Room room;

	@override
	Widget get prefix => Text(room.name, style: const TextStyle(fontSize: 10));

}
