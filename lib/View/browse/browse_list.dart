import 'package:flutter/material.dart';
import 'package:movies_app/Model/api/api_manager.dart';
import 'package:movies_app/Model/browse/Genres.dart';
import 'package:movies_app/Model/browse_list/BrowseListResponse.dart';

import 'browse_item.dart';

class BrowseList extends StatelessWidget {
  Genres? genres;

  BrowseList(this.genres);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${genres?.name ?? ''} List'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<BrowseListResponse>(
              future: ApiManager.browseListResponse('${genres?.id}'),
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
                if (snapshot.data?.statusCode == 7) {
                  return Center(
                    child: Text(snapshot.data?.statusMessage ?? ''),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return BrowseItem(snapshot.data?.results?[index]);
                      },
                      itemCount: snapshot.data!.results!.length),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
