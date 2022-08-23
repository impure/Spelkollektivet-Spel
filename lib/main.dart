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
			home: const MyHomePage(),
		);
	}
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key});

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	Widget makeCardDisplay() {
		return Column(
			children: <Widget>[
				Flexible(
					fit: FlexFit.tight,
					child: Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: itemsCanBeBought[0]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: itemsCanBeBought[1]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: itemsCanBeBought[2]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: itemsCanBeBought[3]?.makeCard(Theme.of(context)) ?? const SizedBox(),
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
								child: cardsCanBeBought[0]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[1]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[2]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[3]?.makeCard(Theme.of(context)) ?? const SizedBox(),
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
								child: cardsCanBeBought[4]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[5]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[6]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[7]?.makeCard(Theme.of(context)) ?? const SizedBox(),
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
								child: cardsCanBeBought[8]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[9]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[10]?.makeCard(Theme.of(context)) ?? const SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: cardsCanBeBought[11]?.makeCard(Theme.of(context)) ?? const SizedBox(),
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
					const Flexible(
						fit: FlexFit.tight,
						child: SizedBox(),
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
																currentPlayer.currentPhase = Phase.BUY;
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
										],
									),
									const Flexible(
										fit: FlexFit.tight,
										child: SizedBox(),
									),
									SingleChildScrollView(
										scrollDirection: Axis.horizontal,
										child: Row(
											children: currentPlayer.getHandCards(Theme.of(context), (GameCard card) {
												setState(() {
													card.action(currentPlayer);
													currentPlayer.hand.remove(card);
													currentPlayer.discardPile.add(card);
												});
											}),
										),
									),
								],
							),
						),
					),
					const Flexible(
						flex: 1,
						fit: FlexFit.tight,
						child: SizedBox(),
					),
				],
			),
		);
	}
}
