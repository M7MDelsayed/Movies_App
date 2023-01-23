import 'package:flutter/material.dart';
import 'package:movies_app/Model/api/api_manager.dart';
import 'package:movies_app/Model/browse/BrowseResponse.dart';

import 'browse_widget.dart';

class BrowseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Browse Category',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder<BrowseResponse>(
              future: ApiManager.genresResponse(),
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
                if (snapshot.data?.code == '7') {
                  return Center(
                    child: Text(snapshot.data?.message ?? ''),
                  );
                }
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return BrowseWidget(snapshot.data?.genres?[index]);
                    },
                    itemCount: snapshot.data?.genres?.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
