import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Model/api/api_manager.dart';
import 'package:movies_app/Model/movie_popular/MoviePopular.dart';
import 'package:movies_app/Model/movie_top_rated/MovieTopRated.dart';
import 'package:movies_app/View/home/home_view/popular/movie_popular_widget.dart';
import 'package:movies_app/View/home/home_view/recommended/movie_recomended_widget.dart';
import 'package:movies_app/View/home/home_view/release/movie_release_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<MoviePopular>(
            future: ApiManager.getPopularMovie(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.data?.code == 7) {
                return Center(
                  child: Text(snapshot.data?.message ?? ''),
                );
              }
              return CarouselSlider(
                items: snapshot.data!.results!
                    .map((result) => MoviePopularWidget(result))
                    .toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.30,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 8),
                  autoPlayAnimationDuration: const Duration(milliseconds: 400),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              );
            }),
        FutureBuilder<MoviePopular>(
            future: ApiManager.getPopularMovie(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.data?.code == 7) {
                return Center(
                  child: Text(snapshot.data?.message ?? ''),
                );
              }
              return MovieReleaseWidget(snapshot.data);
            }),
        FutureBuilder<MovieTopRated>(
            future: ApiManager.getTopRatedMovie(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.data?.code == 7) {
                return Center(
                  child: Text(snapshot.data?.message ?? ''),
                );
              }
              return MovieRecommended(snapshot.data);
            }),
      ],
    );
  }
}
