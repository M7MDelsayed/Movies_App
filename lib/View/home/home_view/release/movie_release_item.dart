import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_popular/MoviePopular.dart';
import 'package:movies_app/Providers/app_provider.dart';
import 'package:provider/provider.dart';

import '../../details/details_view.dart';

class MovieReleaseItem extends StatelessWidget {
  MoviePopular? moviePopular;
  int index;

  MovieReleaseItem(this.moviePopular, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName,
            arguments: moviePopular?.results?[index]);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            children: [
              CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${moviePopular?.results?[index].posterPath}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
              InkWell(
                onTap: () {
                  provider.selectMovie(moviePopular!.results![index]);
                },
                child:
                    provider.idList.contains(moviePopular?.results?[index].id)
                        ? Image.asset('assets/images/bookmark_done.png')
                        : Image.asset('assets/images/bookmark.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
