import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/app_theme.dart';

Widget circleNetworkImageFrame(String url,double height,double width,String? imagePath){
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,


        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: lightGreyColor,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),

        ),
      ),
    ),
    errorWidget: (context, url, error) =>Image.asset((imagePath!=null)?imagePath:"assets/images/user.png",width: width/2,),
  );
}
Widget rectangularNetworkImageFrame({required String url,required double height,required double width,
  String? imagePath, required double borderRadius, Color? borderColor}){
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor??Colors.transparent,width: 2.0),
      ),
    ),
    placeholder: (context, url) => SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: lightGreyColor,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.all(Radius.circular(borderRadius)),
          ),

        ),
      ),
    ),
    errorWidget: (context, url, error) =>Image.asset((imagePath!=null)?imagePath:"assets/images/user.png",width: 25,),
  );
}