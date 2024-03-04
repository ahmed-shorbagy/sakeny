import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';
import 'package:sakeny/core/utils/helper_methodes.dart';

class CustomFavoriteIcon extends StatefulWidget {
  final String apartmentId;
  final FavoritesRepository favoritesRepository;

  const CustomFavoriteIcon({
    Key? key,
    required this.apartmentId,
    required this.favoritesRepository,
  }) : super(key: key);

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Check if the apartment is already in favorites
    checkIsFavorite();
  }

  Future<void> checkIsFavorite() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final result = await widget.favoritesRepository.getUserFavorites(userId);
      result.fold((failure) {
        snackBar(context, 'some thing went wrong please check your internet');
      }, (favorites) {
        setState(() {
          isFavorite = favorites.contains(widget.apartmentId);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        setState(() {
          isFavorite = !isFavorite;
        });
        // Add or remove apartment from favorites
        if (isFavorite) {
          await widget.favoritesRepository
              .addToFavorites(apartmentId: widget.apartmentId);
        } else {
          await widget.favoritesRepository
              .removeFromFavorites(apartmentId: widget.apartmentId);
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        color: isFavorite ? Colors.red : Colors.white,
      ),
    );
  }
}
