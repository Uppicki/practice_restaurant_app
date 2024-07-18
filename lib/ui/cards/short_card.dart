




import 'package:flutter/material.dart';

Widget shortCard({
  required String imageUrl,
  required String title
}) => Card.filled(
  child: Container(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Image.network(imageUrl),
        ),
        SizedBox(height: 8),
        Text(title),
      ],
    ),
  ),
);

