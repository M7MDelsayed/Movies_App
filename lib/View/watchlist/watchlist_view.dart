import 'package:flutter/material.dart';
import 'package:movies_app/Providers/app_provider.dart';
import 'package:movies_app/View/watchlist/watch_item.dart';
import 'package:provider/provider.dart';

class WatchlistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Watchlist',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            provider.idList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return WatchItem(provider.watchList[index]);
                      },
                      itemCount: provider.watchList.length,
                    ),
                  )
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.local_movies,
                          color: Color.fromRGBO(181, 180, 180, 1.0),
                          size: 150,
                        ),
                        Text(
                          'No movies select yet.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(181, 180, 180, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
