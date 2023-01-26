import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_popular/Result.dart';
import 'package:movies_app/Providers/app_provider.dart';
import 'package:movies_app/View/home/details/details_view.dart';
import 'package:provider/provider.dart';

import '../../Core/theme/my_theme.dart';

class WatchItem extends StatelessWidget {
  Result resultWatchItem;

  WatchItem(this.resultWatchItem);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, DetailsView.routeName,
                  arguments: resultWatchItem);
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 150,
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500${resultWatchItem.backdropPath}',
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                      InkWell(
                        onTap: () {
                          provider.selectMovie(resultWatchItem);
                        },
                        child: provider.idList.contains(resultWatchItem.id)
                            ? Image.asset('assets/images/bookmark_done.png')
                            : Image.asset('assets/images/bookmark.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          resultWatchItem.title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          resultWatchItem.releaseDate!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                              '${resultWatchItem.voteAverage}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 1.5,
            color: MyTheme.secondaryColor,
          ),
        ],
      ),
    );
  }
}
