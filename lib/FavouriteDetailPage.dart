import 'package:english_words/english_words.dart';
import 'package:favourite_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteDetailPage extends StatelessWidget {
  final WordPair pair;

  FavouriteDetailPage({required this.pair});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Word Pairs"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${pair.first} ${pair.second}",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                // Get the current app state
                var appState = Provider.of<MyAppState>(context, listen: false);

                // Find the matching WordPair and remove it
                var matchingPair = appState.favorites.firstWhere(
                  (p) => p.first == pair.first && p.second == pair.second,
                );

                if (matchingPair != null) {
                  appState.removeFavourite(matchingPair);
                }

                Navigator.pop(context); // Go back to previous page
              },
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
