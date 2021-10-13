import 'package:flutter/material.dart';
import 'package:payment_app/theme.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatefulWidget {
  const PaymentApp({Key? key}) : super(key: key);

  @override
  State<PaymentApp> createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subtitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
                color: selectedIndex == index ? blueColor : whiteColor),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Image.asset(
                selectedIndex == index
                    ? 'assets/images/check_two.png'
                    : 'assets/images/check_one.png',
                width: 18,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: planTextStyle,
                  ),
                  Text(
                    subtitle,
                    style: descTextStyle,
                  )
                ],
              ),
              const Spacer(),
              Text(
                price,
                style: priceTextStyle,
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/icon_one.png',
                width: 267,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to ',
                  style: titleTextStyle,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'Go unlock all features and\nbuild your own business bigger',
                style: subtitleTextStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(71),
                  ),
                ),
                child: Text(
                  'Checkout Now',
                  style: buttonTextStyle,
                )),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xff04112f),
          body: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                const SizedBox(
                  height: 30,
                ),
                option(0, 'Monthly', 'Good for starting up', '\$20'),
                option(1, 'Quarterly', 'Focusing on building', '\$55'),
                option(2, 'Yearly', 'Steady company', '\$220'),
                const SizedBox(
                  height: 25,
                ),
                selectedIndex == -1 ? const SizedBox() : checkoutButton(),
              ],
            ),
          )),
    );
  }
}
