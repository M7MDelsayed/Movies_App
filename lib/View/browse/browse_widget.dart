import 'package:flutter/material.dart';
import 'package:movies_app/Model/browse/Genres.dart';

import 'browse_list.dart';

class BrowseWidget extends StatelessWidget {
  Genres? genres;

  BrowseWidget(this.genres);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BrowseList(genres);
            },
          ),
        );
      },
      child: SizedBox(
        width: 160,
        height: 90,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/image_cat.png'),
            ),
            Text(
              genres?.name ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
