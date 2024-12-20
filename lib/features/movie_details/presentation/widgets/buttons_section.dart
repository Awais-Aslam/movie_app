import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../cubit/add_to_favorite_cubit.dart';
import '../cubit/add_to_watchlist_cubit.dart';

class ButtonsSection extends StatefulWidget {
  final int mediaId;
  final bool favourite;
  final bool watchlist;

  const ButtonsSection({
    super.key,
    required this.mediaId,
    required this.favourite,
    required this.watchlist,
  });

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  late bool isFavourite;
  late bool isWatchlist;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.favourite;
    isWatchlist = widget.watchlist;
  }

  void toggleFavourite() {
    context.read<AddToFavouriteCubit>().addToFavorite(
          mediaId: widget.mediaId,
          favorite: !isFavourite,
        );
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  void toggleWatchlist() {
    context.read<AddToWatchlistCubit>().addToWatchlist(
          mediaId: widget.mediaId,
          watchlist: !isWatchlist,
        );
    setState(() {
      isWatchlist = !isWatchlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: ElevatedButton.icon(
            onPressed: toggleFavourite,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(
              Icons.favorite,
              color: isFavourite ? Colors.pinkAccent : Colors.white,
            ),
            label: const Text(
              Strings.addToFavorites,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: ElevatedButton.icon(
            onPressed: toggleWatchlist,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(
              Icons.bookmark,
              color: isWatchlist ? Colors.redAccent : Colors.white,
            ),
            label: const Text(
              Strings.addToWatchlist,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
