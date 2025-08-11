import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class LargeMovies extends StatelessWidget {
  const LargeMovies({
    super.key,
    required this.backdropPath,
    required this.id,
    required this.title,
  });

  final String backdropPath, title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailScreen(
                  id: id,
                  backdropPath: backdropPath,
                  title: title,
                ),
          ),
        );
      },
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(0, 3),
                    color: Colors.black.withAlpha(130),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500$backdropPath",
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Text(
                        '이미지를 불러올 수 없습니다',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallMovies extends StatelessWidget {
  const SmallMovies({
    super.key,
    required this.backdropPath,
    required this.title,
    required this.id,
  });

  final String title, backdropPath;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailScreen(
                  id: id,
                  backdropPath: backdropPath,
                  title: title,
                ),
            fullscreenDialog: false,
          ),
        );
      },
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                    color: Colors.black.withAlpha(130),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500$backdropPath",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Text(
                        '이미지를 불러올 수 없습니다',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
