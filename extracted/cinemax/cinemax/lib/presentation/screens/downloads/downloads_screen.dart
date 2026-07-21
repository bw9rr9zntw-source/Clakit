import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/movie_card.dart';
import '../../providers/app_provider.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myList = context.watch<AppProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My List'),
      ),
      body: myList.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bookmark_border,
                      size: 56, color: Colors.white.withOpacity(0.2)),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Movies you save will show up here',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                childAspectRatio: 0.56,
              ),
              itemCount: myList.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: myList[index],
                  width: double.infinity,
                  height: 150,
                );
              },
            ),
    );
  }
}
