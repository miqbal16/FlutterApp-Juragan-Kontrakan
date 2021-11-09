import 'package:flutter/material.dart';
import 'package:juragan_kontrak/pages/e_payment_page.dart';
import 'package:juragan_kontrak/pages/favorite_page.dart';
import 'package:juragan_kontrak/pages/home_page.dart';
import 'package:juragan_kontrak/pages/message_page.dart';
import 'package:juragan_kontrak/themes/style.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex != 0
          ? AppBar(
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                    12,
                  ),
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.grey[200],
              title: Text(
                currentIndex == 1
                    ? 'Messanger'
                    : currentIndex == 2
                        ? 'E-Payment'
                        : currentIndex == 3
                            ? 'Favorite'
                            : '',
                style: titleTextStyle1.copyWith(
                  fontWeight: medium,
                  fontSize: 19,
                ),
              ),
            )
          : null,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey[200],
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: listPage(currentIndex),
    );
  }

  Widget listPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const MessagePage();
      case 2:
        return const CardPayPage();
      case 3:
        return const FavoritePage();
      default:
        return const HomePage();
    }
  }
}
