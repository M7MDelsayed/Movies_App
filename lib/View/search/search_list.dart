import 'package:flutter/material.dart';
import 'package:movies_app/Model/api/api_manager.dart';
import 'package:movies_app/Model/search/SearchResponse.dart';
import 'package:movies_app/View/search/search_widget.dart';

class SearchList extends StatelessWidget {
  String? query;

  SearchList(this.query);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResponse>(
      future: ApiManager.searchResponse(query!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error Loading Data ${snapshot.error.toString()}'),
          );
        }
        if (snapshot.data?.statusCode == 7) {
          return Center(
              child: Text('Server Error ${snapshot.data?.statusMessage}'));
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return SearchWidget(snapshot.data?.results?[index]);
          },
          itemCount: snapshot.data?.results?.length,
        );
      },
    );
  }
}
