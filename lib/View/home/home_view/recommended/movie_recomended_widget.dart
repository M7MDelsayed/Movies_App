import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_top_rated/MovieTopRated.dart';

import '../../../../Core/theme/my_theme.dart';
import 'movie_recommended_item.dart';

class MovieRecommended extends StatelessWidget {
  MovieTopRated? movieTopRated;

  MovieRecommended(this.movieTopRated);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      width: double.infinity,
      height: 280,
      color: MyTheme.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Recommended',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MovieRecommendedItem(movieTopRated, index);
              },
              itemCount: movieTopRated?.results?.length,
            ),
          ),
        ],
      ),
    );
  }
}
