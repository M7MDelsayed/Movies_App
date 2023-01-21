import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_popular/Result.dart';

import '../../details/details_view.dart';

class MoviePopularWidget extends StatelessWidget {
  Result? result;

  MoviePopularWidget(this.result);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName, arguments: result);
      },
      child: SizedBox(
        height: size.height * 0.30,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * 0.22,
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${result?.backdropPath}',
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            Positioned(
              top: size.height * 0.07,
              left: size.width * 0.4,
              child: const Icon(
                Icons.play_circle,
                size: 60,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.06,
              child: SizedBox(
                height: 180,
                width: 120,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${result?.posterPath}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.36,
              top: MediaQuery.of(context).size.height * 0.22,
              child: Container(
                height: 70,
                width: 245,
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 18,
                      child: Text(
                        result?.title ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: Text(
                        result?.releaseDate ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
