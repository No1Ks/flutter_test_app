import 'package:flutter/material.dart';

part 'card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _color = Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(widget.title),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key}); // КЛЮЧИ

  @override
  Widget build(BuildContext context) {
    final data = [
      _CardData(
        'Freeze',
        descriptionText: 'hahaha',
        imageUrl:
            'https://www.skedaddlewildlife.com/wp-content/uploads/2018/09/depositphotos_22425309-stock-photo-a-lonely-raccoon-in-winter.jpg',
      ),
      _CardData(
        'Hi',
        descriptionText: 'ahahahah',
        icon: Icons.hail,
        imageUrl:
            'https://www.thesprucepets.com/thmb/nKNaS4I586B_H7sEUw9QAXvWM_0=/2121x0/filters:no_upscale():strip_icc()/GettyImages-135630198-5ba7d225c9e77c0050cff91b.jpg',
      ),
      _CardData(
        'Oh',
        descriptionText: 'lol',
        icon: Icons.warning_amber,
        imageUrl:
            'https://furmanagers.com/wp-content/uploads/2019/11/dreamstime_l_22075357.jpg',
      ),
    ];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((e) => _Card.fromData(e)).toList(),
        ),
      ),
    );
  }
}

