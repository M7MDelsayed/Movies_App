import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_top_rated/MovieTopRated.dart';
import 'package:movies_app/View/home/details/details_view.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/app_provider.dart';

class MovieRecommendedItem extends StatelessWidget {
  MovieTopRated? movieTopRated;
  int index;

  MovieRecommendedItem(this.movieTopRated, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName,
            arguments: movieTopRated?.results?[index]);
      },
      child: SizedBox(
        height: 180,
        width: 110,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
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
                      InkWell(
                        onTap: () {
                          provider.selectMovie(movieTopRated!.results![index]);
                        },
                        child: provider.idList
                                .contains(movieTopRated?.results?[index].id)
                            ? Image.asset('assets/images/bookmark_done.png')
                            : Image.asset('assets/images/bookmark.png'),
                      ),
                    ],
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
                    '${movieTopRated?.results?[index].voteAverage}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${movieTopRated?.results?[index].releaseDate}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
