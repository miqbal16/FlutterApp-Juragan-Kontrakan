import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/house.dart';
import 'package:juragan_kontrak/pages/house_detail_page.dart';
import 'package:juragan_kontrak/themes/style.dart';

class HouseCard extends StatelessWidget {
  final House house;
  final String nameCard;

  const HouseCard({required this.nameCard, required this.house, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return HouseDetailPage(
              house: house,
              nameCard: nameCard,
            );
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: '$nameCard ${house.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      Image.asset(
                        house.assetImage,
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          width: constraints.maxWidth * 0.40,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/start.png',
                                width: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${house.rating}',
                                style: subTitleTextStyle3.copyWith(
                                  color: Colors.white,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          house.nameHouse,
                          style: titleTextStyle2.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: (house.price < 1000000)
                                ? 'Rp. ${(house.price * 10e-4).toStringAsFixed(1)} rb '
                                : 'Rp. ${(house.price * 10e-7).toStringAsFixed(1)} jt ',
                            style: priceTextStyle.copyWith(fontWeight: medium),
                            children: [
                              TextSpan(
                                text: '/ bulan',
                                style: subTitleTextStyle2.copyWith(
                                    fontWeight: ligth),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${house.city.name}, Indonesia',
                      style: subTitleTextStyle3,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
