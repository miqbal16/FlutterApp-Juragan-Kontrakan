import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/city.dart';
import 'package:juragan_kontrak/themes/style.dart';

class CityBubble extends StatelessWidget {
  final City dataCity;

  const CityBubble({required this.dataCity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 130,
      height: 160,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.asset(
                dataCity.assetImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                dataCity.name,
                style: titleTextStyle2.copyWith(fontWeight: medium),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
