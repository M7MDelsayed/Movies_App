import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_similar/MoviesSimilar.dart';
import 'package:movies_app/View/home/details/similar/similar_widget_item.dart';

import '../../../../Core/theme/my_theme.dart';

class SimilarWidget extends StatelessWidget {
  MoviesSimilar? moviesSimilar;

  SimilarWidget(this.moviesSimilar);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      width: double.infinity,
      height: 275,
      color: MyTheme.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'More Like This',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SimilarWidgetItem(moviesSimilar, index);
              },
              itemCount: moviesSimilar?.results?.length,
            ),
          ),
        ],
      ),
    );
  }
}
