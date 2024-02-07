part of 'home_page.dart';

class _CardData {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;

  _CardData(
    this.text, {
    required this.descriptionText,
    this.icon = Icons.ac_unit_outlined,
    this.imageUrl,
  });
}

class _Card extends StatefulWidget {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;

  const _Card(
    this.text, {
    this.icon = Icons.ac_unit_outlined,
    required this.descriptionText,
    this.imageUrl,
  });

  factory _Card.fromData(_CardData data) => _Card(
        data.text,
        descriptionText: data.descriptionText,
        icon: data.icon,
        imageUrl: data.imageUrl,
      );

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      constraints: const BoxConstraints(minHeight: 160),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 4,
            offset: const Offset(0, 5),
            blurRadius: 8,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: SizedBox(
                height: double.infinity,
                width: 120,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        widget.imageUrl ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Placeholder(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            // bo: Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Text(
                          'скидка 20%',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      widget.descriptionText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 16,
                  bottom: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: isLiked
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                            key: ValueKey<int>(0),
                          )
                        : const Icon(
                            Icons.favorite_border,
                            key: ValueKey<int>(1),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
