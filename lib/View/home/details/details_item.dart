import 'package:flutter/material.dart';
import 'package:movies_app/Model/movie_details/MoviesDetails.dart';

class DetailsItem extends StatelessWidget {
  MoviesDetails? moviesDetails;
  int? index;

  DetailsItem(this.moviesDetails, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.5,
            color: Colors.grey,
          )),
      child: Center(
        child: Text(
          moviesDetails?.genres?[index!].name ?? '',
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
