import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_similar/MoviesSimilar.dart';
import 'package:movies_app/View/home/details/details_view.dart';

class SimilarWidgetItem extends StatelessWidget {
  MoviesSimilar? moviesSimilar;
  int? index;

  SimilarWidgetItem(this.moviesSimilar, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName,
            arguments: moviesSimilar?.results?[index!]);
      },
      child: SizedBox(
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
                        'https://image.tmdb.org/t/p/w500${moviesSimilar?.results?[index!].posterPath}',
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
                    width: 5,
                  ),
                  Text(
                    '${moviesSimilar?.results?[index!].voteAverage}',
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
                '${moviesSimilar?.results?[index!].title}',
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${moviesSimilar?.results?[index!].releaseDate}',
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
