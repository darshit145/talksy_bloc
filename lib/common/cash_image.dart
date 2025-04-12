import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CashImage extends StatelessWidget {
  final String getImage;
  final double circleRedius;
  const CashImage({super.key,required this.circleRedius,required this.getImage});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circleRedius,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(circleRedius)),
        child: CachedNetworkImage(
          imageUrl:  getImage,
          fit: BoxFit.fitWidth,
          width: double.infinity,
          placeholder: (context, url) => Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey,
            child:CircleAvatar(
              radius: circleRedius,
            )
          ),
          errorWidget: (c, o, s) => Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey,
            child: CircleAvatar(
              radius: circleRedius,
            )
          ),
        ),
      ),
    );
  }
}
