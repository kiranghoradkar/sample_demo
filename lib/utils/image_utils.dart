import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_demo/utils/ui_colors.dart';

///This util class used to display images.
class ImageUtils extends StatelessWidget {
  final String imageUrl;
  final ImageType imageType;
  final Color? color;
  final BoxFit? fit;
  final double height;
  final double width;
  final double? innerRadius;
  final double? outerRadius;


  const ImageUtils(
      {Key? key ,required this.imageUrl,
      required this.imageType,
       this.fit,
      required this.height,
      required this.width,
       this.innerRadius,
       this.outerRadius,
       this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.assets:
        return SvgPicture.asset(
          imageUrl,
          height: height,
          width: height,
        );
        break;
      case ImageType.network:
        return CachedNetworkImage(
          fit: fit,
          height: height,
          width: width,
          color: color,
          imageUrl: imageUrl,
          placeholder: (context, url) => Image.asset('assets/user.png'),
          errorWidget: (context, url, error) => Icon(Icons.error_outline),
        );
        break;

      case ImageType.sdCard:
        return Image.file(File(imageUrl));
        break;
      case ImageType.image:
        return Image(
          image: AssetImage(imageUrl),
          height: height,
          width: width,
          fit: fit,
        );
        break;
      case ImageType.circularAvatar:
        return CircleAvatar(
          radius: outerRadius,
          backgroundColor: UIColors.background_colour,
          child: CircleAvatar(
            radius: innerRadius,
            backgroundImage: AssetImage(
              imageUrl,
            ),
            backgroundColor: UIColors.background_colour,
          ),
        );
        break;
      default:
        return Image.asset(imageUrl);
        break;
    }
  }
}

class CustomImageUtils {
  NetworkImage networkProviderImage(String url) {
    return NetworkImage(
      url,
    );
  }
}

enum ImageType { network, assets, sdCard, image, assetImage, circularAvatar }
