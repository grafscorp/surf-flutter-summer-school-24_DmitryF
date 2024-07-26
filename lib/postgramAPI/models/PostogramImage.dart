import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:surf_flutter_summer_school_24/models/LoadingImageContainer.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';

class PostogramImage extends StatelessWidget {
  const PostogramImage({super.key, required this.photoData});
  final PhotoData photoData;
  static final customCacheManager = CacheManager(
    Config(
      "CacheKey",
      stalePeriod: const Duration(days: 2),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: photoData.url,
      fit: BoxFit.cover,
      placeholder: (context, url) => const LoadingImageContainer(),
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
      // Container(
      //   decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //     colors: [
      //       Color.fromARGB(255, 63, 63, 63),
      //       Color.fromARGB(255, 185, 183, 183)
      //     ],
      //   )),
      // ),
    );
  }
}
