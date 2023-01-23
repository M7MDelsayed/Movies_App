import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_details/MoviesDetails.dart';

import 'details_item.dart';

class DetailsWidget extends StatelessWidget {
  MoviesDetails? moviesDetails;

  DetailsWidget(this.moviesDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 1,
                crossAxisSpacing: 1.5,
                mainAxisSpacing: 1.5,
              ),
              itemBuilder: (context, index) {
                return DetailsItem(moviesDetails, index);
              },
              itemCount: moviesDetails?.genres?.length,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    moviesDetails?.overview ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${moviesDetails?.voteAverage}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
