import 'package:flutter/material.dart';
import 'package:juragan_kontrak/themes/style.dart';

class CardPayPage extends StatelessWidget {
  const CardPayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return emptyListFavorite(context);
  }

  Widget emptyListFavorite(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/credit_card.png',
            color: Colors.deepOrange[200],
            width: 180,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Cooming Soon',
            style: titleTextStyle3.copyWith(fontWeight: medium, fontSize: 30),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - (30 * 2),
            ),
            child: Text(
              'Maaf, metode pembayaran via e-payment sedang dalam pengembangan',
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
