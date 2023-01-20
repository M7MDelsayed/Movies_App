import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_top_rated/MovieTopRated.dart';

class MovieRecommendedItem extends StatelessWidget {
  MovieTopRated? movieTopRated;
  int index;

  MovieRecommendedItem(this.movieTopRated, this.index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: 110,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movieTopRated?.results?[index].posterPath}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${movieTopRated?.results?[index].voteAverage}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${movieTopRated?.results?[index].title}',
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${movieTopRated?.results?[index].releaseDate}',
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
