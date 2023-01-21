import 'package:flutter/material.dart';
import 'package:movies_app/Core/theme/my_theme.dart';
import 'package:movies_app/Model/api/api_manager.dart';
import 'package:movies_app/Model/movie_popular/Result.dart';
import 'package:movies_app/View/search/search_widget.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String query = '';
  List<Result> movieList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: const SizedBox(),
        leadingWidth: 10,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (newQuery) {
                setState(() {
                  query = newQuery;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: MyTheme.secondaryColor,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                contentPadding: const EdgeInsets.only(top: 10),
              ),
            ),
          ),
        ),
      ),
      body: query == ''
          ? Center(
              child: Image.asset('assets/images/no_movies.png'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return SearchWidget(
                  search().elementAt(index),
                );
              },
              itemCount: search().length,
            ),
    );
  }

  List search() {
    ApiManager.searchResponse(query).then((movieResponse) {
      movieList = movieResponse.results ?? [];
    }).catchError((error) {
      debugPrint(error);
    });
    return movieList;
  }
}
