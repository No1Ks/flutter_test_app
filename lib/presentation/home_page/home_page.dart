import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/repositories/potter_repository.dart';
import 'package:flutter_test_app/domain/models/card.dart';
import 'package:flutter_test_app/presentation/details_page/details_page.dart';
import 'package:flutter_test_app/presentation/dialogs/show_dialog.dart';

part 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final searchController = TextEditingController();
  late Future<List<CardData>?> data;

  final repo = PotterRepository();

  @override
  void initState() {
    data = repo.loadData(onError: (e) => showErrorDialog(context, error: e));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: CupertinoSearchTextField(
              controller: searchController,
              onChanged: (search) {
                setState(() {
                  data = repo.loadData(q: search);
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder<List<CardData>?>(
                future: data,
                builder: (context, snapshot) => SingleChildScrollView(
                  child: snapshot.hasData
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: snapshot.data?.map((data) {
                                return _Card.fromData(
                                  data,
                                  onLike: (String title, bool isLiked) =>
                                      _showSnackBar(context, title, isLiked),
                                  onTap: () => _navToDetails(context, data),
                                );
                              }).toList() ??
                              [],
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
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
          '$title ${isLiked ? 'liked!' : 'disliked :('}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 1),
      ));
    });
  }
}
