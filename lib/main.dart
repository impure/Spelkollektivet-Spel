import 'package:flutter/material.dart';
import 'package:spelkollektivet_spel/Card.dart';
import 'package:spelkollektivet_spel/GameState.dart';
import 'package:spelkollektivet_spel/Player.dart';

void main() {
	initGameState();
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Spelkollektivet Spel',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			darkTheme: ThemeData.dark(),
			home: const PlayerSelectionPage(),
		);
	}
}

class PlayerSelectionPage extends StatefulWidget {
  const PlayerSelectionPage({super.key});

  @override
  State<PlayerSelectionPage> createState() => _PlayerSelectionPageState();
}

class _PlayerSelectionPageState extends State<PlayerSelectionPage> {
  @override
  Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					const Flexible(
						fit: FlexFit.tight,
						child: SizedBox(),
					),
					Text("Select how many players you want.", style: Theme.of(context).textTheme.headline5),
					const SizedBox(
						height: 50,
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							ElevatedButton(
								onPressed: () {
									players.add(Player(cardPool, rng));
									players.add(Player(cardPool, rng));
									players[0].startTurn();
									Navigator.pushReplacement<void, void>(
										context,
										MaterialPageRoute<void>(
											builder: (BuildContext context) => const MyHomePage(),
										),
									);
								},
								child: const Text("2", style: TextStyle(fontSize: 20)),
							),
							const SizedBox(width: 15),
							ElevatedButton(
								onPressed: () {
									players.add(Player(cardPool, rng));
									players.add(Player(cardPool, rng));
									players.add(Player(cardPool, rng));
									players[0].startTurn();
									Navigator.pushReplacement<void, void>(
										context,
										MaterialPageRoute<void>(
											builder: (BuildContext context) => const MyHomePage(),
										),
									);
								},
								child: const Text("3", style: TextStyle(fontSize: 20)),
							),
							const SizedBox(width: 15),
							ElevatedButton(
								onPressed: () {
									players.add(Player(cardPool, rng));
									players.add(Player(cardPool, rng));
									players.add(Player(cardPool, rng));
									players.add(Player(cardPool, rng));
									players[0].startTurn();
									Navigator.pushReplacement<void, void>(
										context,
										MaterialPageRoute<void>(
											builder: (BuildContext context) => const MyHomePage(),
										),
									);
								},
								child: const Text("4", style: TextStyle(fontSize: 20)),
							),
						],
					),
					const Flexible(
						fit: FlexFit.tight,
						child: SizedBox(),
					),
				],
			),
		);
  }
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key});

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	Widget makeCard(Map<int, GameCard> cards, int index) {

		final GameCard? card = cards[index];

		if (card == null) {
			return const SizedBox();
		}

		final bool blocked = currentPlayer.handValue() < card.value || currentPlayer.buysAvailable == 0 || (card is ItemCard && currentPlayer.itemCards.containsKey(card.name));

		return card.makeCard(Theme.of(context), blocked, onTap: () {
			if (card is ItemCard && currentPlayer.itemCards.containsKey(card.name)) {
				return;
			}
			if (currentPlayer.bonusMoney >= card.value && currentPlayer.buysAvailable > 0) {
				currentPlayer.buysAvailable--;
				currentPlayer.bonusMoney -= card.value;
				cards.remove(index);
				if (card is ItemCard) {
					currentPlayer.itemCards[card.name] = card;
					if (currentPlayer.itemCards.length == 5) {
						showDialog(
							context: context,
							builder: (BuildContext context) {
								return const AlertDialog(
									title: Text("Congratulations You Win"),
									content: Text("Refresh the page to play again."),
								);
							},
						);
					}
				} else {
					if (!card.trashOnUse) {
						currentPlayer.discardPile.add(card);
					}
				}
				setState(() {});
			}
		});
	}

	Widget makeCardDisplay() {
		return Column(
			children: <Widget>[
				Flexible(
					fit: FlexFit.tight,
					child: Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(itemsCanBeBought, 0),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(itemsCanBeBought, 1),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(itemsCanBeBought, 2),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(itemsCanBeBought, 3),
							),
						],
					),
				),
				const Divider(),
				Flexible(
					fit: FlexFit.tight,
					child: Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 0),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 1),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 2),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 3),
							),
						],
					),
				),
				Flexible(
					fit: FlexFit.tight,
					child: Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 4),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 5),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 6),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 7),
							),
						],
					),
				),
				Flexible(
					fit: FlexFit.tight,
					child: Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 8),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 9),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 10),
							),
							Flexible(
								fit: FlexFit.tight,
								child: makeCard(cardsCanBeBought, 11),
							),
						],
					),
				),
			],
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					Flexible(
						fit: FlexFit.tight,
						child: Center(
							child: Text("Player ${currentPlayerIndex + 1}'s Turn", style: Theme.of(context).textTheme.headline3),
						),
					),
					Flexible(
						fit: FlexFit.tight,
						flex: 5,
						child: Center(
							child: FractionallySizedBox(
								widthFactor: 0.75,
								child: currentPlayer.currentPhase == Phase.ACTION
									? Stack(
										children: <Widget>[
											Opacity(
												opacity: 0.5,
												child: makeCardDisplay(),
											),
											Center(
												child: Material(
													borderRadius: const BorderRadius.all(Radius.circular(20)),
													color: Theme.of(context).cardColor,
													elevation: 5,
													child: GestureDetector(
														onTap: () {
															setState(() {
																currentPlayer.endActionPhase();
															});
														},
														child: const Padding(
															padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
															child: Text("Tap to enter buy phase"),
														),
													),
												),
											),
										],
									)
									: makeCardDisplay(),
							),
						),
					),
					const SizedBox(height: 20),
					Flexible(
						flex: 2,
						fit: FlexFit.tight,
						child: Padding(
							padding: const EdgeInsets.symmetric(horizontal: 20),
							child: Column(
								children: <Widget>[
									Row(
										children: <Widget>[
											const Flexible(
												fit: FlexFit.tight,
												child: SizedBox(),
											),
											Text("Hand value: ${currentPlayer.handValue()} SEK"),
											const Flexible(
												fit: FlexFit.tight,
												child: SizedBox(),
											),
											Text("Cards in deck: ${currentPlayer.deck.items.length}"),
											const Flexible(
												fit: FlexFit.tight,
												child: SizedBox(),
											),
											Text("Cards in hand: ${currentPlayer.hand.length}"),
											const Flexible(
												fit: FlexFit.tight,
												child: SizedBox(),
											),
											Text("Buys available: ${currentPlayer.buysAvailable}"),
											const Flexible(
												fit: FlexFit.tight,
												child: SizedBox(),
											),
										],
									),
									Flexible(
										fit: FlexFit.tight,
										child: Center(
											child: Text("Item cards: ${currentPlayer.itemCards.keys}"),
										),
									),
									SingleChildScrollView(
										scrollDirection: Axis.horizontal,
										child: currentPlayer.currentPhase == Phase.ACTION ? Row(
											children: currentPlayer.getHandCards(Theme.of(context), (GameCard card) {
												setState(() {
													card.action(currentPlayer);
													currentPlayer.hand.remove(card);
													currentPlayer.discardPile.add(card);
												});
											}),
										) :	Center(
											child: Material(
												borderRadius: const BorderRadius.all(Radius.circular(20)),
												color: Theme.of(context).cardColor,
												elevation: 5,
												child: GestureDetector(
													behavior: HitTestBehavior.translucent,
													onTap: () {
														setState(() {
															incrementTurn();
														});
													},
													child: const Padding(
														padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
														child: Text("Tap to end turn"),
													),
												),
											),
										),
									),
								],
							),
						),
					),
					Flexible(
						flex: 1,
						fit: FlexFit.tight,
						child: currentPlayer.currentPhase == Phase.ACTION ? Center(
							child: Material(
								borderRadius: const BorderRadius.all(Radius.circular(20)),
								color: Theme.of(context).cardColor,
								elevation: 5,
								child: GestureDetector(
									behavior: HitTestBehavior.translucent,
									onTap: () {
										setState(() {
											currentPlayer.endActionPhase();
											currentPlayer.deck.items.addAll(currentPlayer.discardPile.items);
											currentPlayer.discardPile.clear();
											incrementTurn();
										});
									},
									child: Padding(
										padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
										child: Text("Reshuffle (end turn and gain ${currentPlayer.discardPile.items.length} cards)"),
									),
								),
							),
						) : const SizedBox(),
					),
				],
			),
		);
	}
}
