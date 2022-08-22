

import 'package:flutter/widgets.dart';

class Card {

	const Card({
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

	factory Card.SGDC() {
		return Card(
			name: "SGDC",
			description: "+2 cards",
			value: 300,
			action: () {},
		);
	}

	factory Card.StandUp() {
		return Card(
			name: "Stand Up",
			description: "Discard the top card of your deck. +2 cards",
			value: 200,
			action: () {},
		);
	}

	factory Card.HouseMeeting() {
		return Card(
			name: "House Meeting",
			description: "+3 cards",
			value: 500,
			action: () {},
		);
	}

	Widget makeCard() {
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				Text(name),
				const SizedBox(height: 5),
				Text(description, style: const TextStyle(fontSize: 9)),
				const SizedBox(height: 5),
				Text("$value SEK", style: const TextStyle(fontSize: 10)),
			],
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
	final Function() action;
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

class ItemCard extends Card {

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
			description: "+1 Additional Card",
			value: 3500,
			action: () {},
			room: Room.PATIO,
		);
	}

	factory ItemCard.Treadmill() {
		return ItemCard(
			name: "Treadmill",
			description: "+1 Additional Card",
			value: 4000,
			action: () {},
			room: Room.GYM,
		);
	}

	final Room room;

}
