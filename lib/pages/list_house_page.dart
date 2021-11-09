import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/city.dart';
import 'package:juragan_kontrak/models/house.dart';
import 'package:juragan_kontrak/themes/style.dart';
import 'package:juragan_kontrak/widgets/house_card.dart';

class ListHousePage extends StatefulWidget {
  final City city;

  const ListHousePage({required this.city, Key? key}) : super(key: key);

  @override
  State<ListHousePage> createState() => _ListHousePageState();
}

class _ListHousePageState extends State<ListHousePage> {
  String dropDownValue = 'Price';
  @override
  Widget build(BuildContext context) {
    (dropDownValue == 'Rating')
        ? houseList.sort((data1, data2) {
            return data2.rating.compareTo(data1.rating);
          })
        : houseList.sort((data1, data2) {
            return (data1 as House).price.compareTo((data2 as House).price);
          });

    final List dataHouse = houseList
        .where((element) => (element as House).city.id == widget.city.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepOrange),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              12,
            ),
          ),
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 18),
              child: DropdownButton(
                style: titleTextStyle3.copyWith(
                  color: Colors.deepOrange,
                ),
                underline: Container(
                  color: Colors.grey[200],
                ),
                value: dropDownValue,
                onChanged: (String? value) {
                  setState(() {
                    dropDownValue = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 'Price',
                    child: Text('Price'),
                  ),
                  DropdownMenuItem(
                    value: 'Rating',
                    child: Text('Rating'),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: Colors.grey[200],
        title: Text(
          widget.city.name,
          style: titleTextStyle1.copyWith(
            fontWeight: medium,
            fontSize: 19,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HouseCard(
              nameCard: dataHouse[index].city.name, house: dataHouse[index]);
        },
        itemCount: dataHouse.length,
        padding: const EdgeInsets.only(top: 30),
      ),
    );
  }
}
