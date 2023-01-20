import 'package:flutter/material.dart';
import 'package:movies_app/Core/theme/my_theme.dart';
import 'package:movies_app/Model/movie_popular/MoviePopular.dart';

import 'movie_release_item.dart';

class MovieReleaseWidget extends StatelessWidget {
  MoviePopular? moviePopular;

  MovieReleaseWidget(this.moviePopular);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 200,
      color: MyTheme.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'New Releases',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return MovieReleaseItem(moviePopular, index);
              },
              itemCount: moviePopular?.results?.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
