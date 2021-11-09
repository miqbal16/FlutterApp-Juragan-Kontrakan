import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/favorite.dart';
import 'package:juragan_kontrak/models/house.dart';
import 'package:juragan_kontrak/themes/style.dart';
import 'package:juragan_kontrak/widgets/house_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return (favoriteList.isNotEmpty)
        ? RefreshIndicator(
            onRefresh: refreshData,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemBuilder: (context, index) {
                final House house = getDataHouse()[index];
                return HouseCard(nameCard: 'Favorite', house: house);
              },
              itemCount: favoriteList.length,
            ),
          )
        : emptyListFavorite();
  }

  List<House> getDataHouse() {
    final List<House> dataHouse = [];

    for (var i = 0; i < favoriteList.length; i++) {
      dataHouse.add(houseList
          .firstWhere((element) => (element as House).id == favoriteList[i]));
    }

    return dataHouse;
  }

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {});
  }

  Widget emptyListFavorite() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/love.png',
            color: Colors.deepOrange[200],
            width: 180,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kamu tidak memiliki list Favorite',
            style: titleTextStyle3.copyWith(fontWeight: medium),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - (30 * 2)),
            child: Text(
              'Silahkan melakukan wishlist rumah yang diiginkan',
              style: subTitleTextStyle2.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
