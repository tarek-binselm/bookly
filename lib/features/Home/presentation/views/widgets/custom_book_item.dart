import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
            errorWidget: (context, url, error) =>const  Icon(Icons.error),
          ),
      ),
    );
  }
}

//  Container(
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(14),
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: NetworkImage(imageUrl),
//           )
//    ),
//       ),