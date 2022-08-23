

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
			value: 300,
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
			value: 500,
			action: (Player player) {
				for (int i = 0; i < 3; i++) {
					if (player.deck.notEmpty) {
						player.hand.add(player.deck.getRandomItem(rng));
					}
				}
			},
		);
	}

	Widget get prefix => const SizedBox();

	Widget makeCard(ThemeData theme, {void Function()? onTap}) {
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
									borderRadius: const BorderRadius.all(Radius.circular(20)),
									color: theme.cardColor,
									elevation: 5,
									child: Padding(
										padding: const EdgeInsets.all(5),
										child: Column(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												prefix,
												Text(name),
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
	HALL,
	ROUND_ROOM,
	BASEMENT,
	KITCHEN,
	GYM,
	PATIO,
	Theatre
}

class ItemCard extends GameCard {

	ItemCard({
		required super.name,
		required super.description,
		required super.value,
		required super.action,
		required this.room,
	});
	
	factory ItemCard.Hammock() {
		return ItemCard(
			name: "Hammock",
			description: "+50 SEK",
			value: 3500,
			action: (Player player) {
				player.bonusMoney += 50;
			},
			room: Room.PATIO,
		);
	}

	factory ItemCard.Treadmill() {
		return ItemCard(
			name: "Treadmill",
			description: "+1 Additional Card",
			value: 4000,
			action: (Player player) {
				if (player.deck.notEmpty) {
					player.hand.add(player.deck.getRandomItem(rng));
				}
			},
			room: Room.GYM,
		);
	}

	final Room room;

	@override
	Widget get prefix => Text(room.name, style: const TextStyle(fontSize: 10));

}
