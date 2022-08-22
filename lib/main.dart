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
					Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: Text(itemsCanBeBought[0].name),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
						],
					),
					Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
						],
					),
					Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
						],
					),
					Row(
						children: <Widget>[
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
							Flexible(
								fit: FlexFit.tight,
								child: SizedBox(),
							),
						],
					),
				],
			)
		);
	}
}
