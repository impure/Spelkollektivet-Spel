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
			body: Center(
				child: FractionallySizedBox(
					widthFactor: 0.5,
					heightFactor: 0.5,
					child: Column(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: Row(
									children: <Widget>[
										Flexible(
											fit: FlexFit.tight,
											child: Text(itemsCanBeBought[0].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(itemsCanBeBought[1].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(itemsCanBeBought[2].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(itemsCanBeBought[3].name),
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
											child: Text(cardsCanBeBought[0].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[1].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[2].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[3].name),
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
											child: Text(cardsCanBeBought[4].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[5].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[6].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[7].name),
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
											child: Text(cardsCanBeBought[8].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[9].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[10].name),
										),
										Flexible(
											fit: FlexFit.tight,
											child: Text(cardsCanBeBought[11].name),
										),
									],
								),
							),
						],
					),
				),
			),
		);
	}
}
