import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_popular/MoviePopular.dart';

class MovieReleaseItem extends StatelessWidget {
  MoviePopular? moviePopular;
  int index;

  MovieReleaseItem(this.moviePopular, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            width: 100,
            height: 130,
            imageUrl:
                'https://image.tmdb.org/t/p/w500${moviePopular?.results?[index].posterPath}',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
