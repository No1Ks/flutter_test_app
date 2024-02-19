import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/domain/models/card.dart';
import 'package:flutter_test_app/presentation/details_page/details_page.dart';

part 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      CardData(
        'Freeze',
        descriptionText: 'so cold..',
        imageUrl:
            'https://www.skedaddlewildlife.com/wp-content/uploads/2018/09/depositphotos_22425309-stock-photo-a-lonely-raccoon-in-winter.jpg',
      ),
      CardData(
        'Hi',
        descriptionText: 'pretty face',
        icon: Icons.hail,
        imageUrl:
            'https://www.thesprucepets.com/thmb/nKNaS4I586B_H7sEUw9QAXvWM_0=/2121x0/filters:no_upscale():strip_icc()/GettyImages-135630198-5ba7d225c9e77c0050cff91b.jpg',
      ),
      CardData(
        'Orange',
        descriptionText: 'I like autumn',
        icon: Icons.warning_amber,
        imageUrl:
            'https://furmanagers.com/wp-content/uploads/2019/11/dreamstime_l_22075357.jpg',
      ),
    ];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((data) {
            return _Card.fromData(
              data,
              onLike: (String title, bool isLiked) =>
                  _showSnackBar(context, title, isLiked),
              onTap: () => _navToDetails(context, data),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Racoon $title ${isLiked ? 'liked!' : 'disliked :('}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 1),
      ));
    });
  }
}
