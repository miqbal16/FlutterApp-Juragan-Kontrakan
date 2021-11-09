import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/city.dart';
import 'package:juragan_kontrak/models/house.dart';
import 'package:juragan_kontrak/pages/list_house_page.dart';
import 'package:juragan_kontrak/themes/style.dart';
import 'package:juragan_kontrak/widgets/city_bubble.dart';
import 'package:juragan_kontrak/widgets/house_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: titleTextStyle1.copyWith(fontWeight: medium),
                  ),
                  Text(
                    'Mencari rumah yang nyaman',
                    style: subTitleTextStyle1.copyWith(fontWeight: ligth),
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundColor: Colors.deepOrange,
                radius: 23,
                child: Icon(
                  Icons.person,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Kota Populer',
                  style: titleTextStyle3,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: cities.values.toList().map((value) {
                      // ignore: unnecessary_cast
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ListHousePage(
                                  city: value,
                                );
                              },
                            ),
                          );
                        },
                        child: CityBubble(dataCity: value),
                      ) as Widget;
                    }).toList()
                      ..insert(
                        0,
                        const SizedBox(
                          width: 24,
                        ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Rumah Favorite',
                style: titleTextStyle3,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: List.generate(5, (index) {
                final House house = getFavoriteHouse()[index];
                return HouseCard(
                  house: house,
                  nameCard: 'recommended house',
                );
              }),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Rumah Ekonomis',
                style: titleTextStyle3,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: List.generate(5, (index) {
                final House house = getEconomiesHouse()[index];
                return HouseCard(
                  house: house,
                  nameCard: 'economies house',
                );
              }),
            ),
          ],
        ),
      ],
    );
  }

  List<House> getFavoriteHouse() {
    List<House> listHouse = [...houseList];

    listHouse.sort((data1, data2) {
      return data2.rating.compareTo(data1.rating);
    });

    return listHouse;
  }

  List<House> getEconomiesHouse() {
    List<House> listHouse = [...houseList];
    listHouse.sort((data1, data2) {
      return data1.price.compareTo(data2.price);
    });

    return listHouse;
  }
}
