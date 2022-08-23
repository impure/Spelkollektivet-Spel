import 'package:flutter/material.dart';
import 'package:spelkollektivet_spel/GameState.dart';

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
								child: Column(
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
								),
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
									Text("Hand value: 1000 SEK"),
									Flexible(
										fit: FlexFit.tight,
										child: SizedBox(),
									),
									Row(
										children: currentPlayer.getHandCards(Theme.of(context)),
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
