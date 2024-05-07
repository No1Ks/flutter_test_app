import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/components/utils/debounce.dart';
import 'package:flutter_test_app/domain/models/card.dart';
import 'package:flutter_test_app/presentation/details_page/details_page.dart';
import 'package:flutter_test_app/presentation/home_page/bloc/bloc.dart';
import 'package:flutter_test_app/presentation/home_page/bloc/events.dart';
import 'package:flutter_test_app/presentation/home_page/bloc/state.dart';

part 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Body());
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final searchController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeLoadDataEvent());
    });

    scrollController.addListener(_onNextPageListener);

    super.initState();
  }

  void _onNextPageListener() {
    if (scrollController.offset > scrollController.position.maxScrollExtent) {
      // preventing multiple pagination request on multiple swipes
      final bloc = context.read<HomeBloc>();
      if (!bloc.state.isPaginationLoading) {
        bloc.add(HomeLoadDataEvent(
          search: searchController.text,
          nextPage: bloc.state.data?.nextPage,
        ));
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
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
                Debounce.run(() => context.read<HomeBloc>().add(HomeLoadDataEvent(search: search)));
              },
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => state.error != null
                ? Text(
                    state.error ?? '',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.red),
                  )
                : state.isLoading
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: _onRefresh,
                          child: ListView.builder(
                            controller: scrollController,
                            padding: EdgeInsets.zero,
                            itemCount: state.data?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final data = state.data?.data?[index];
                              return data != null
                                  ? _Card.fromData(
                                      data,
                                      onLike: (title, isLiked) =>
                                          _showSnackBar(context, title, isLiked),
                                      onTap: () => _navToDetails(context, data),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => state.isPaginationLoading
                ? const CircularProgressIndicator()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Future<void> _onRefresh() {
    context.read<HomeBloc>().add(HomeLoadDataEvent(search: searchController.text));
    return Future.value(null);
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
