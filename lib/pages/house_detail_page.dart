import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/favorite.dart';
import 'package:juragan_kontrak/models/house.dart';
import 'package:juragan_kontrak/pages/map_page.dart';
import 'package:juragan_kontrak/themes/style.dart';
import 'package:juragan_kontrak/widgets/facilitiy_container.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'chat_page.dart';

class HouseDetailPage extends StatefulWidget {
  final House house;
  final String nameCard;
  const HouseDetailPage({required this.nameCard, required this.house, Key? key})
      : super(key: key);

  @override
  State<HouseDetailPage> createState() => _HouseDetailPageState();
}

class _HouseDetailPageState extends State<HouseDetailPage> {
  final String _phoneNumber = '085316269505';
  String? _nameCard;
  bool favoriteButtonCondition = false;

  @override
  void initState() {
    _nameCard = widget.nameCard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (favoriteList.isNotEmpty) {
      favoriteButtonCondition =
          favoriteList.any((element) => widget.house.id == element);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: '$_nameCard ${widget.house.id}',
                  child: Image.asset(
                    widget.house.assetImage,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              favoriteButtonCondition =
                                  !favoriteButtonCondition;
                              if (favoriteButtonCondition) {
                                favoriteList.add(widget.house.id);
                              } else {
                                favoriteList.remove(widget.house.id);
                              }
                            });
                          },
                          icon: (favoriteButtonCondition)
                              ? Icon(
                                  Icons.favorite,
                                  color: favoriteButtonColor,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: favoriteButtonColor,
                                ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              child: Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.58,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.house.nameHouse,
                          style: titleTextStyle1.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: (widget.house.price < 1000000)
                                ? 'Rp. ${(widget.house.price * 10e-4).toStringAsFixed(1)} rb '
                                : 'Rp. ${(widget.house.price * 10e-7).toStringAsFixed(1)} jt ',
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
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(5, (index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            right: 4.5,
                          ),
                          child: ((index + 1) <= widget.house.rating)
                              ? Image.asset(
                                  'assets/images/start.png',
                                  width: 15,
                                )
                              : Image.asset(
                                  'assets/images/start_empty.png',
                                  width: 15,
                                ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Main Facilities',
                    style: titleTextStyle3,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FacilityContainer(
                        totalAsset: widget.house.kitchen,
                        facilityName: 'Kitchen',
                        imageAsset: 'assets/images/kitchen.png',
                      ),
                      FacilityContainer(
                        totalAsset: widget.house.bedroom,
                        facilityName: 'Bedroom',
                        imageAsset: 'assets/images/bedroom.png',
                      ),
                      FacilityContainer(
                        totalAsset: widget.house.cupboard,
                        facilityName: 'Cupboard',
                        imageAsset: 'assets/images/cupboard.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 12,
              ),
              child: Text(
                'Photos',
                style: titleTextStyle3,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 88,
                child: Row(
                  children: List.generate(widget.house.photos.length, (index) {
                    final String photo = widget.house.photos[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: ClipRRect(
                        child: Image.network(photo),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    );
                  })
                    ..insert(
                        0,
                        const SizedBox(
                          width: 24,
                        )),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 40,
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: titleTextStyle3,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.60,
                        ),
                        child: Text(
                          '${widget.house.address} ${widget.house.city.name}',
                          style: subTitleTextStyle3,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          tooltip: 'location',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const MapPage();
                            }));
                          },
                          icon: Icon(
                            Icons.room,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 24,
                        ),
                        primary: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        FlutterPhoneDirectCaller.callNumber(_phoneNumber);
                      },
                      child: Text(
                        'Telepon',
                        style: titleTextStyle3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                      primary: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChatPage(
                              ownerHouse: widget.house,
                            );
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
