import 'package:flutter/material.dart';
import 'package:juragan_kontrak/themes/style.dart';

class FacilityContainer extends StatelessWidget {
  final String facilityName;
  final String imageAsset;
  final int totalAsset;

  const FacilityContainer(
      {required this.totalAsset,
      required this.facilityName,
      required this.imageAsset,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageAsset,
          width: 32,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '$totalAsset $facilityName',
          style: subTitleTextStyle3.copyWith(
            fontWeight: ligth,
          ),
        )
      ],
    );
  }
}
